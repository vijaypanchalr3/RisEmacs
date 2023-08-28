
(global-display-line-numbers-mode 0)
(dolist (mode '(prog-mode-hook))
  (add-hook mode(lambda () (display-line-numbers-mode 1))))


;; to turn off nano modeline for perticular modes
(add-hook 'vterm-mode-hook
           (lambda ()
            (setq-local header-line-format nil)))
(add-hook 'dired-single-mode-hook
           (lambda ()
            (setq-local header-line-format nil)))


;; all text mode have variable pitch mode
(add-hook 'text-mode-hook
           (lambda ()
            (variable-pitch-mode 1)))

;; (require 'disp-table)
;; (add-hook 'prog-mode-hook            #'nano-modeline-prog-mode)
;;(add-hook 'text-mode-hook            (lambda () (display-line-numbers-mode 0)))
;; (add-hook 'org-mode-hook             #'nano-modeline-org-mode)
;; (add-hook 'pdf-view-mode-hook        #'nano-modeline-pdf-mode)


(provide 'sethooks)
