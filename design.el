;;some variables
(set-face-attribute 'default nil :font "Roboto Mono" :height 120)
(dolist (mode '(org-mode-hook
                vterm-mode-hook
                eshell-mode-hook
                markdown-mode-hook
                helpful-mode-hook
                Custom-mode-hook
                LaTeX-mode-hook
                text-mode-hook
                inferior-python-mode-hook
                dired-mode-hook
                neotree-mode-hook
                image-mode-hook
                help-mode-hook
                Man-mode-hook
                calc-mode-hook
                Info-mode-hook
                Archive-mode-hook
                term-mode-hook
                calendar-mode-hook
                calc-trail-mode-hook))
  (add-hook mode(lambda () (display-line-numbers-mode 0))))

;;line spacing

;;line numbers

;;split control
(setq split-height-threshold 160)
(setq split-width-threshold 120)

;;pairs mode
;;(setq electric-pair-mode t)

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
(scroll-bar-mode 0)
(global-display-line-numbers-mode 1)
;; (global-hl-line-mode 1)
(setq x-underline-at-descent-line t)

;; Window divider
(setq window-divider-mode 1)


;; No ugly button for checkboxes
(setq widget-image-enable nil)
(setq ring-bell-function 'ignore)

(dolist (mode '(org-mode-hook))
  (add-hook mode(lambda () (electric-pair-mode 0))))

;; set transparency
;; (set-frame-parameter (selected-frame) 'alpha '(97 97))
;; (add-to-list 'default-frame-alist '(alpha 97 97))


;;


(provide 'design)
