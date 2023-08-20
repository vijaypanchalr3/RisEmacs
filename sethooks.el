(add-hook 'text-mode-hook
           (lambda ()
            (variable-pitch-mode 1)))
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


(add-hook 'vterm-mode-hook
           (lambda ()
            (setq-local header-line-format nil)))
(add-hook 'dired-single-mode-hook
           (lambda ()
            (setq-local header-line-format nil)))


;; (require 'disp-table)

(provide 'sethooks)
