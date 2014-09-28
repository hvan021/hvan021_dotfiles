(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)(evil-mode 1)
(require 'smex)


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

(when window-system
  ;; (menu-bar-mode -1)
  (tool-bar-mode -1)
  (global-linum-mode 1)
  (blink-cursor-mode -1))

;; (indent-tabs-mode nil)		       ; insert spaces instead of tabs

;; (global-hl-line-mode)
(show-paren-mode)

 
;; map jk for escape in Evil mode
;; define-key evil-insert-state-map "j" #'cofi/maybe-exitnd)
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

;;================================================== 
;; bind-key
;;================================================== 
(require 'bind-key)
(bind-key "<f6>" (lambda()(interactive)(find-file "~/.emacs.d/init.el")))
(bind-key "M-x" 'smex)
(bind-key "M-X" 'smex-major-mode-commands)
(bind-key "C-c C-c M-x" 'execute-extended-command) ; emacs default "M-x"

;;================================================== 
;; Customized settings
;;================================================== 
(setq user-full-name "Hugh Van"
	  user-mail-address "hvan021@gmail.com")

(setq-default tab-width 4) ; tabstop = 4
(setq-default indicate-empty-lines t)
(setq-default show-trailing-whitespaces t)

(fset 'yes-or-no-p 'y-or-n-p) ; y for yes - n for no

(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)

(require 'key-chord)(key-chord-mode 1) ; turn on key-chord-mode
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)

(global-set-key (kbd "M-;") 'comment-dwim-2)
;; (global-set-key (kbd "RET") 'evil-insert-newline-below)


;;================================================== 
;; packages initialize
;;================================================== 
(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-x r" "C-x 4" "C-x")) 
(guide-key-mode 1)  ; Enable guide-key-mode



;;================================================== 
;; custom functions
;;================================================== 
(defun hvan021/vsplit-last-buffer (prefix)
  "Split the window vertically and display the previous buffer."
  (interactive "p")
  (split-window-vertically)
  (other-window 1 nil)
  (unless prefix
    (switch-to-next-buffer)))

(defun hvan021/hsplit-last-buffer (prefix)
  "Split the window horizontally and display the previous buffer."
  (interactive "p")
  (split-window-horizontally)
  (other-window 1 nil)
  (unless prefix (switch-to-next-buffer)))

(bind-key "C-x 2" 'hvan021/vsplit-last-buffer)
(bind-key "C-x 3" 'hvan021/hsplit-last-buffer)
(bind-key "M-s" 'save-buffer)




(defun toggle-fullscreen ()
  "Toggle full screen"
  (interactive)
  (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth)))
;; (bind-key "S-return" 'toggle-fullscreen)
(global-set-key [s-return] 'toggle-fullscreen)

(toggle-fullscreen)						;toogle fullscreen when start

;; Evaluate new settings
;; C-x C-e ;; current line
;; M-x eval-region ;; region
;; M-x eval-buffer ;; whole buffer
;; M-x load-file ~/.emacs.d/init.el

;; Use Emacs terminfo, not system terminfo
;(setq system-uses-terminfo nil)

;(require 'multi-term)
;(setq multi-term-program "/bin/zsh")

;(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

; unicode setting for term
;see here http://stackoverflow.com/questions/6820051/unicode-characters-in-emacs-term-mode
(add-hook 'term-exec-hook
          (function
           (lambda ()
             (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))))

; setting unicode for ansi-term
;(defadvice ansi-term (after advise-ansi-term-coding-system)
    ;(set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))
;(ad-activate 'ansi-term)
