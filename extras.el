;; ;;auto tangle
;;(defun efs/org-babel-tangle-config ()
;;  (when (string-equal (buffer-file-name)
;;                      (expand-file-name "/home/vijay/emacs-config/emacs.org"))
;;    ;; Dynamic scoping to the rescue
;;    (let ((org-confirm-babel-evaluate nil))
;;      (org-babel-tangle))))
;;(add-hook 'org-mode-hook (lambda () (add-hook 'after-save-hook #'efs/org-babel-tangle-config)))

;; yasnippet
(use-package yasnippet
:config
(setq yas-snippet-dirs '("~/RisEmacs/snippets"))
(yas-global-mode 1))

(setq org-todo-keywords
      '((sequence "IDEA(i)")
        (sequence "TODO(t)")
        (sequence "STARTED(s)")
        (sequence "NEXT(n)")
        (sequence "WAITING(w)")
        (sequence "DONE(d)")
        (sequence "CANCELED(c)")
        (sequence "SOMEDAY(f)")))
;;(sequence "|" "CANCELED(c)" "DELEGATED(l)" "SOMEDAY(f)")))
(setq org-todo-keyword-faces
      '(("IDEA" . (:foreground "#F8BC5C" :weight bold))
        ("TODO" . (:foreground "#24448C" :weight bold))
        ("NEXT" . (:foreground "#74A466" :weight bold))
        ("STARTED" . (:foreground "#DC4424" :weight bold))
        ("WAITING" . (:foreground "#CCA4A0" :weight bold))
        ("CANCELED" . (:foreground "LimeGreen" :weight bold))
        ("DELEGATED" . (:foreground "LimeGreen" :weight bold))
        ("SOMEDAY" . (:foreground "LimeGreen" :weight bold))))


(defun new-info-mode-fun ()
  (setq visual-fill-column-center-text t
        visual-fill-column-width 90)
  (visual-fill-column-mode 1))
(add-hook 'Info-mode-hook 'new-info-mode-fun)
(add-hook 'calendar-mode-hook 'new-info-mode-fun)

(defun efs/org-mode-visual-fill ()
  (setq visual-fill-column-width 130
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1)
  (visual-line-mode 1)
  (variable-pitch-mode 1))

(use-package visual-fill-column
  :hook '((org-mode . efs/org-mode-visual-fill)
          (add-hook 'markdown-mode-hook 'efs/org-mode-visual-fill)
          (add-hook 'text-mode-hook 'efs/org-mode-visual-fill)))




(provide 'extras)
