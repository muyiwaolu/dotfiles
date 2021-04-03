;; Key-bindings to remember
;;
;; C-x C-f -> Find (open) a file
;; C-x C-s -> Save the buffer
;; C-x b -> Switch buffer
;; C-x k -> Kill (close) a buffer
;; C-x C-b -> Display all open buffers
;; C-x C-c -> Exits emacs
;; ESC ESC ESC -> Exits out of prompts, regions, prefix arguments, and returns to just one window
;; C-/ -> Undo changes
;; F10 Activate menu bar

(setq package-archives
 '(("gnu" . "http://elpa.gnu.org/packages/")
   ("melpa" . "http://melpa.org/packages/")))

(windmove-default-keybindings)

;; IDO
(ido-mode 1)
(setq ido-everywhere t)
(setq ido-enable-flex-matching t)

;; Projectile
(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; Nov
(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(atom-one-dark))
 '(custom-safe-themes
   '("171d1ae90e46978eb9c342be6658d937a83aaa45997b1d7af7657546cae5985b" default))
 '(fido-mode t)
 '(global-display-line-numbers-mode t)
 '(grep-find-command
   '("find . -type f -exec grep  -nH --null -e  \\{\\} +" . 42))
 '(grep-find-ignored-directories
   '("SCCS" "RCS" "CVS" "MCVS" ".src" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" "node_modules"))
 '(indent-tabs-mode nil)
 '(package-selected-packages
   '(magit nov dumb-jump projectile shell-command+ helm atom-one-dark-theme)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#282C34" :foreground "#ABB2BF" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "nil" :family "Source Code Pro for Powerline")))))
