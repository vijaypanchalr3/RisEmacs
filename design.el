(set-face-attribute 'default nil :font "JetBrains Mono:style=Light" :height 115)
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
;; (dolist (mode '(vterm-mode-hook))
  ;; (add-hook mode(lambda ()
		  ;; (header-line-format nil))))
(add-hook 'vterm-mode-hook
           (lambda ()
            (setq-local header-line-format nil)))
(add-hook 'dired-single-mode-hook
           (lambda ()
            (setq-local header-line-format nil)))


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
(setq x-underline-at-descent-line t)
(setq window-divider-mode 1)
(setq widget-image-enable nil)
(setq ring-bell-function 'ignore)

(dolist (mode '(org-mode-hook))
  (add-hook mode(lambda () (electric-pair-mode 0))))


(provide 'design)
