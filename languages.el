(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-c l")  ;; Or 'C-l', 's-l'
  :config
  (lsp-enable-which-key-integration t))
(add-hook 'lsp-configure-hook (lambda ()
                                (lsp-headerline-breadcrumb-mode -1)))

(use-package python-mode
  :ensure nil
  :hook (python-mode . lsp-deferred))

(setq python-shell-interpreter "python3.9")
(setq python-shell-interpreter-args "-i")
(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp))))  ; or lsp-deferred

;; (use-package lsp-julia
;;   :ensure t
;;   :hook (julia-mode . (lambda () (lsp))))

;; (add-hook 'c++-mode-hook 'lsp)
;; (add-hook 'c-mode-hook 'lsp)

;; (setq lsp-rust-analyzer-server-command (list (substring (shell-command-to-string "rustup which rls") 0 -1)))
(use-package company
  :after lsp-mode
  :hook '((lsp-mode . company-mode)
          (prog-mode . company-mode)
          (fortran-mode . company-mode))
  :bind (:map company-active-map
              ("<tab>" . company-complete-selection))
  (:map lsp-mode-map
        ("<tab>" . company-indent-or-complete-common))
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0))
(use-package company-box
  :hook (company-mode . company-box-mode))
(use-package all-the-icons)
(setq company-box-icons-alist 'company-box-icons-all-the-icons
      company-box-icons-all-the-icons
      (let ((all-the-icons-scale-factor 1)
            (all-the-icons-default-adjust 0))
        `((Unknown       . ,(all-the-icons-faicon "question" :face 'all-the-icons-purple)) ;;question-circle is also good
          (Text          . ,(all-the-icons-faicon "file-text-o" :face 'all-the-icons-green))
          (Method        . ,(all-the-icons-faicon "cube" :face 'all-the-icons-dcyan))
          (Function      . ,(all-the-icons-faicon "cube" :face 'all-the-icons-dcyan))
          (Constructor   . ,(all-the-icons-faicon "cube" :face 'all-the-icons-dcyan))
          (Field         . ,(all-the-icons-faicon "tag" :face 'all-the-icons-red))
          (Variable      . ,(all-the-icons-faicon "tag" :face 'all-the-icons-dpurple))
          (Class         . ,(all-the-icons-faicon "cog" :face 'all-the-icons-red))
          (Interface     . ,(all-the-icons-faicon "cogs" :face 'all-the-icons-red))
          (Module        . ,(all-the-icons-alltheicon "less" :face 'all-the-icons-red))
          (Property      . ,(all-the-icons-faicon "wrench" :face 'all-the-icons-red))
          (Unit          . ,(all-the-icons-faicon "tag" :face 'all-the-icons-red))
          (Value         . ,(all-the-icons-faicon "tag" :face 'all-the-icons-red))
          (Enum          . ,(all-the-icons-faicon "file-text-o" :face 'all-the-icons-red))
          (Keyword       . ,(all-the-icons-material "format_align_center" :face 'all-the-icons-red :v-adjust -0.15))
          (Snippet       . ,(all-the-icons-material "content_paste" :face 'all-the-icons-red))
          (Color         . ,(all-the-icons-material "palette" :face 'all-the-icons-red))
          (File          . ,(all-the-icons-faicon "file" :face 'all-the-icons-red))
          (Reference     . ,(all-the-icons-faicon "tag" :face 'all-the-icons-red))
          (Folder        . ,(all-the-icons-faicon "folder" :face 'all-the-icons-red))
          (EnumMember    . ,(all-the-icons-faicon "tag" :face 'all-the-icons-red))
          (Constant      . ,(all-the-icons-faicon "tag" :face 'all-the-icons-red))
          (Struct        . ,(all-the-icons-faicon "cog" :face 'all-the-icons-red))
          (Event         . ,(all-the-icons-faicon "bolt" :face 'all-the-icons-red))
          (Operator      . ,(all-the-icons-faicon "tag" :face 'all-the-icons-red))
          (TypeParameter . ,(all-the-icons-faicon "cog" :face 'all-the-icons-red))
          (Template      . ,(all-the-icons-faicon "bookmark" :face 'all-the-icons-dgreen)))))




(setq org-confirm-babel-evaluate nil)
(setq org-babel-python-command "python3")
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (python . t)
   (latex . t)))







;;rust
(setq lsp-rust-analyzer-server-command (list (substring (shell-command-to-string "rustup which rust-analyzer") 0 -1)))
(use-package cargo)
(use-package rustic
  :ensure
  :bind (:map rustic-mode-map
              ("M-j" . lsp-ui-imenu)
              ("M-?" . lsp-find-references)
              ("C-c C-c l" . flycheck-list-errors)
              ("C-c C-c a" . lsp-execute-code-action)
              ("C-c C-c r" . lsp-rename)
              ("C-c C-c q" . lsp-workspace-restart)
              ("C-c C-c Q" . lsp-workspace-shutdown)
              ("C-c C-c s" . lsp-rust-analyzer-status))
  :config
  ;; uncomment for less flashiness
  ;; (setq lsp-eldoc-hook nil)
  ;; (setq lsp-enable-symbol-highlighting nil)
  ;; (setq lsp-signature-auto-activate nil)

  ;; comment to disable rustfmt on save
  (setq rustic-format-on-save t)
  (add-hook 'rustic-mode-hook 'cargo-minor-mode)
  (add-hook 'rustic-mode-hook 'rk/rustic-mode-hook))

(defun rk/rustic-mode-hook ()
  ;; so that run C-c C-c C-r works without having to confirm, but don't try to
  ;; save rust buffers that are not file visiting. Once
  ;; https://github.com/brotzeit/rustic/issues/253 has been resolved this should
  ;; no longer be necessary.
  (when buffer-file-name
    (setq-local buffer-save-without-query t)))



(provide 'languages)
