(global-display-line-numbers-mode 0)
;; (defun display-numbers-hook ()
;;   (display-line-numbers-mode 1))
;; (add-hook 'prog-mode-hook 'display-numbers-hook)

(dolist (mode '(prog-mode-hook))
  (add-hook mode(lambda () (display-line-numbers-mode 1)))
  (add-hook mode(lambda () (hl-line-mode 1))))


(add-hook 'text-mode-hook
      (lambda ()
        (setq-local cursor-type 'bar)))

;; to turn off nano modeline for perticular modes
(add-hook 'vterm-mode-hook
           (lambda ()
            (setq-local header-line-format nil)))
(add-hook 'dired-single-mode-hook
           (lambda ()
            (setq-local header-line-format nil)))


(add-hook 'text-mode-hook
           (lambda ()
            (variable-pitch-mode 1)))


(provide 'sethooks)
