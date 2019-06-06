# Custom Functions

function aws-stack-id-by-name() {
  if [[ -z $1 ]] ; then
    echo 'Stack name not given'
  else
    aws opsworks describe-stacks | jq -r --arg stackName $1 '.Stacks[] | select(.Name==$stackName) | .StackId'
  fi
}

# aws opsworks create-deployment --app-id=$(aws opsworks describe-apps --stack-id $(aws opsworks describe-stacks | jq -r '.Stacks[] | select(.Name | contains("staging")) | .StackId') | jq -r '.Apps[0].AppId') --stack-id $(aws-stack-id-by-name "staging") --command="Name=deploy" --custom-json "{\"branch\": \"release-2019-03-07\"}"


function aws-app-id-by-name() {
  if [[ -z $1 ]] ; then
    echo 'Stack name not given.'
  else
    stack_id=$(aws-stack-id-by-name $1)
    if [[ -z $stack_id ]] ; then
      echo 'No stack id for given stack name. (Did you enter the correct stack name?)'
    else
      aws opsworks describe-apps --stack-id $(aws-stack-id-by-name $1) | jq -r '.Apps[0].AppId'
    fi
  fi
}

# $(aws opsworks describe-apps --stack-id $(aws opsworks describe-stacks | jq -r '.Stacks[] | select(.Name | contains("staging")) | .StackId') | jq -r '.Apps[0].AppId')

function aws-opsworks-deploy-app() {
  stack_name=$1
  command_name=${2:-deploy}
  custom_branch_name=${3:-master}

  if [[ -z $stack_name ]] ; then
    echo 'Stack name not given'
  else
    echo "Using stack: $stack_name"
    echo "Using command: $command_name"
    echo "Using branch: $custom_branch_name"

    stack_id=$(aws-stack-id-by-name $stack_name)
    app_id=$(aws-app-id-by-name $stack_name)

    if [[ -z $stack_id ]] ; then
      echo 'No stack id for given stack name. (Did you enter the correct stack name?)'
    elif [[ -z $app_id ]] ; then
      echo 'No app id for given stack name. (Did you enter the correct stack name?)'
    else
      deployment_json=$(aws opsworks create-deployment \
        --app-id=$(aws-app-id-by-name $stack_name) \
        --stack-id $(aws-stack-id-by-name $stack_name) \
        --command="Name=$command_name" \
        --custom-json "{\"branch\": \"$custom_branch_name\"}")

      deployment_id=$(echo $deployment_json | jq -r '.DeploymentId')

      while [ $(aws opsworks describe-deployments --deployment-id=$deployment_id | jq -r '.Deployments[].Status') '==' running ]; do
        echo "Deploying...";
      done
    fi
  fi
}

