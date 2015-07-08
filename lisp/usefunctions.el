;;file deletion
(defun delete-this-buffer-and-file ()
"Removes file connected to current buffer and kills buffer."
(interactive)
(let ((filename (buffer-file-name))
(buffer (current-buffer))
(name (buffer-name)))
(if (not (and filename (file-exists-p filename)))
(error "Buffer '%s' is not visiting a file!" name)
(when (yes-or-no-p "Are you sure you want to remove this file? ")
(delete-file filename)
(kill-buffer buffer)
(message "File '%s' successfully removed" filename)))))
(global-set-key (kbd "C-c k") 'delete-this-buffer-and-file)

;; open file in external app in dired, shoutouts to xah
(defun xah-open-in-external-app ()
  "Open the current file or dired marked files in external app."
  (interactive)
  (let* (
         (ξfile-list
          (if (string-equal major-mode "dired-mode")
              (dired-get-marked-files)
            (list (buffer-file-name))))
         (ξdo-it-p (if (<= (length ξfile-list) 5)
                       t
                     (y-or-n-p "Open more than 5 files? "))))

    (when ξdo-it-p
      (cond
       ((string-equal system-type "windows-nt")
        (mapc
         (lambda (fPath)
           (w32-shell-execute "open" (replace-regexp-in-string "/" "\\" fPath t t))) ξfile-list))
       ((string-equal system-type "darwin")
        (mapc
         (lambda (fPath) (shell-command (format "open \"%s\"" fPath)))  ξfile-list))
       ((string-equal system-type "gnu/linux")
        (mapc
         (lambda (fPath) (let ((process-connection-type nil)) (start-process "" nil "xdg-open" fPath))) ξfile-list))))))
(global-set-key (kbd "C-c o") 'xah-open-in-external-app)

;; Dead keys for swiss-german keyboard
(define-key key-translation-map [dead-grave] "`")
(define-key key-translation-map [dead-acute] "'")
(define-key key-translation-map [dead-circumflex] "^")
(define-key key-translation-map [dead-diaeresis] "\"")
(define-key key-translation-map [dead-tilde] "~")

;; cleaner backup
(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.saves"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups

;; send buffer in email
(defun email-buffer (start end)
  "Send region as the body of an email."
  (interactive "r")
  (let ((content (buffer-substring (point-min) (point-max))))
    (compose-mail)
    (message-goto-body)
    (insert content)
    (message-goto-to)))
(global-set-key (kbd "C-c m") 'email-buffer)

(provide 'usefunctions)

