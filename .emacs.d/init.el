(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)(evil-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wombat))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; (menu-bar-mode -1)
(tool-bar-mode -1)
(global-linum-mode 1)
 
;; map jk for escape in Evil mode
;; define-key evil-insert-state-map "j" #'cofi/maybe-exit)
;; (evil-define-command cofi/maybe-exit ()
;;   :repeat change
;;   (interactive)
;;   (let ((modified (buffer-modified-p)))
;;     (insert "j")
;;     (let ((evt (read-event (format "Insert %c to exit insert state" ?k)
;;                nil 0.5)))
;;       (cond
;;        ((null evt) (message ""))
;;        ((and (integerp evt) (char-equal evt ?k))
;;     (delete-char -1)
;;     (set-buffer-modified-p modified)
;;     (push 'escape unread-command-events))
;;        (t (setq unread-command-events (append unread-command-events
;;                           (list evt))))))))
(require 'key-chord)(key-chord-mode 1) ; turn on key-chord-mode
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)

(global-set-key (kbd "M-;") 'comment-dwim-2)
