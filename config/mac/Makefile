brew: global-brew \
	local-brew

global-brew:
	@brew bundle --file=Brewfile

local-brew:
	@./scripts/local-brew.sh

install-yarn:
	@./scripts/install-yarn.sh

clojure-brew:
	@brew bundle --file=Brewfile.clojure

ruby-brew:
	@brew bundle --file=Brewfile.ruby
	
