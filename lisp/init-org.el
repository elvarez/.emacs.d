(require 'org-habit)
;; org mode key bindings and files
(global-set-key "\C-ca" 'org-agenda)
(setq org-agenda-files '("~/Dropbox/morg"))
(setq org-default-notes-file "~/Dropbox/morg/notes.org")
(define-key global-map "\C-cc" 'org-capture)


(provide 'init-org)
