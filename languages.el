
(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-c l")  ;; Or 'C-l', 's-l'
  :config
  (lsp-enable-which-key-integration t))
(add-hook 'lsp-configure-hook (lambda ()
                                (lsp-headerline-breadcrumb-mode -1)))

;; (use-package python-mode
;;   :ensure nil
;;   :hook (python-mode . lsp-deferred))

;; (setq python-shell-interpreter "python3.10")
;; (setq python-shell-interpreter-args "-i")
;; (use-package lsp-pyright)
;;   :hook (python-mode . (lambda ()
;;                          (require 'lsp-pyright)
;;                          (lsp))))
(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))  ; or lsp-deferred
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
 




(provide 'languages)





