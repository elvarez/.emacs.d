(add-to-list 'load-path "~/.emacs.d/lisp/")

;; install packages
(require 'install-packages)
;; various usability functions and setups
(require 'usefunctions)
(require 'set-ui)
;; packages configs
(require 'init-multi-term)
(require 'init-javascript)
(require 'init-org)
(require 'init-erc)
;; packages sans config
(require 'projectile) 
(projectile-global-mode)
(require 'ido)
(ido-mode t)





