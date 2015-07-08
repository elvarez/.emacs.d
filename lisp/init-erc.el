;; Set autoconnect networks
(defun my-erc ()
  "Connect to my default ERC servers." 
  (interactive)
(erc-tls :server "kornbluth.freenode.net" :port 6697 :nick "szuletett"))


(provide 'init-erc)
