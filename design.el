;;some variables
(setq column-number-mode t)
(setq display-time-mode t)
(setq electric-pair-mode t)
(setq global-display-line-numbers-mode nil)
(setq org-fontify-done-headline nil)
(setq org-fontify-todo-headline nil)
(setq show-paren-mode t)
(setq size-indication-mode t)
(setq scroll-conservatively 100) 
(setq save-place-mode t)
(setq ring-bell-function 'ignore)
(setq-default line-spacing 2)
;;(font-use-system-font nil)
;;(window-divider-default-places t)

(set-face-attribute 'default nil :font "Roboto Mono" :height 120)




;;line spacing

;;line numbers
;;(setq display-line-numbers-mode nil)
(dolist (mode '(prog-mode-hook))
  (add-hook mode(lambda () (display-line-numbers-mode 1))))

;;split control
(setq split-height-threshold 160)
(setq split-width-threshold 120)

;;pairs mode
(setq electric-pair-mode t)

;;trasnparency
;; (set-frame-parameter (selected-frame) 'alpha '(97 97))
;; (add-to-list 'default-frame-alist '(alpha 97 97))



;;------------------------------------------------------
;;change


(require 'disp-table)

(setq default-frame-alist
      (append (list
	           '(min-height . 1)
               '(height     . 45)
	           '(min-width  . 1)
               '(width      . 81)
               '(vertical-scroll-bars . nil)
               '(internal-border-width . 15)
               '(left-fringe    . 1)
               '(right-fringe   . 1)
               '(tool-bar-lines . 0)
               '(menu-bar-lines . 0))))


(defface fallback '((t :family "Roboto Mono"
                       :inherit 'nano-face-faded)) "Fallback")
(set-display-table-slot standard-display-table 'truncation
                        (make-glyph-code ?… 'fallback))
(set-display-table-slot standard-display-table 'wrap
                         (make-glyph-code ?↩ 'fallback))

;; (set-fontset-font t nil "Fira Code" nil 'append)

;; Fix bug on OSX in term mode & zsh (spurious % after each command)
(add-hook 'term-mode-hook
	  (lambda () (setq buffer-display-table (make-display-table))))

(setq inhibit-startup-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t
      initial-scratch-message nil)
(when (fboundp 'tool-bar-mode) (tool-bar-mode nil))
(tooltip-mode 0)
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode nil))
(menu-bar-mode 0)
(tool-bar-mode 0)

;; (global-hl-line-mode 1)
(setq x-underline-at-descent-line t)

;; Window divider
(setq window-divider-mode 1)
(setq window-divider-default-right-width 24)
(setq window-divider-default-places 'right-only)
(setq window-divider-default-bottom-width 3)


;; No ugly button for checkboxes
(setq widget-image-enable nil)

(dolist (mode '(org-mode-hook))
  (add-hook mode(lambda () (electric-pair-mode 0))))

(provide 'design)
