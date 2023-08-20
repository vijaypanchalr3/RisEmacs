(set-face-attribute 'default nil :font "JetBrains Mono:style=Light" :height 115)







(defface fallback '((t :family "Fira mono"
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
