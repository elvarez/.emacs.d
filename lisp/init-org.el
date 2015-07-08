(require 'org-habit)
;; org mode key bindings and files
(global-set-key "\C-ca" 'org-agenda)
(setq org-agenda-files '("~/Dropbox/morg"))
(setq org-default-notes-file "~/Dropbox/morg/notes.org")
(setq org-archive-location "~/Dropbox/morg/archives/%s_archive::")
(define-key global-map "\C-cc" 'org-capture)

;; speed commands

(setq org-use-speed-commands t)
(add-to-list 'org-speed-commands-user '("s" call-interactively 'org-schedule))
(add-to-list 'org-speed-commands-user '("d" call-interactively 'org-deadline))
(add-to-list 'org-speed-commands-user '("p" call-interactively 'org-set-property))
(add-to-list 'org-speed-commands-user '("$" call-interactively 'org-archive-subtree))

(provide 'init-org)
