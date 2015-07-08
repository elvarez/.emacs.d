(require 'js-comint)
(setq inferior-js-program-command "nodejs")

(setq inferior-js-mode-hook
      (lambda ()
        ;; We like nice colors
        (ansi-color-for-comint-mode-on)
        ;; Deal with some prompt nonsense
        (add-to-list
         'comint-preoutput-filter-functions
         (lambda (output)
  (replace-regexp-in-string "\033\\[[0-9]+[A-Z]" "" output)))))

(add-hook 'js-mode-hook
 (lambda ()
    (local-set-key (kbd "C-x C-e") 'js-send-last-sexp)
(local-set-key (kbd "C-x C-r") 'js-send-region)
(local-set-key (kbd "C-M-x") 'js-send-last-sexp-and-go)
(local-set-key (kbd "C-c b") 'js-send-buffer)
(local-set-key (kbd "C-c C-b") 'js-send-buffer-and-go)))


(provide 'init-javascript)
