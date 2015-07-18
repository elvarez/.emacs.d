(require 'org-habit)
(require 'org-capture)
;; org mode key bindings and files
(global-set-key "\C-ca" 'org-agenda)
(setq org-agenda-files '("~/Dropbox/morg"))
(setq org-default-notes-file "~/Dropbox/morg/notes.org")
(setq org-archive-location "~/Dropbox/morg/archives/%s_archive::")
(define-key global-map "\C-cc" 'org-capture)

;; agenda export
(setq org-agenda-custom-commands
           '(("X" agenda "" nil ("~/Dropbox/morg/share/agenda.txt"))
	     ("Y" alltodo "" nil ("~/Dropbox/morg/share/todo.txt"))
))

(defun progo-run-agenda-store ()
  (org-store-agenda-views)
  )

(run-at-time 5 60 'progo-run-agenda-store)

;; org capture templates
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline org-default-notes-file "Tasks")
	 "* TODO %?")
	("p" "Event" entry (file+headline org-default-notes-file "Event")
	       "* %? \n %t")))

;; speed commands

(setq org-use-speed-commands t)
(add-to-list 'org-speed-commands-user '("s" call-interactively 'org-schedule))
(add-to-list 'org-speed-commands-user '("d" call-interactively 'org-deadline))
(add-to-list 'org-speed-commands-user '("p" call-interactively 'org-set-property))
(add-to-list 'org-speed-commands-user '("$" call-interactively 'org-archive-subtree))

(provide 'init-org)
