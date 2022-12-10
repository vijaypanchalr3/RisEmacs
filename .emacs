(add-to-list 'load-path "~/RisEmacs")



(require 'initial)
(require 'design)
(require 'risemacs-dark-theme)
;;(setq split-height-threshold 0)
;; ;;(setq split-width-threshold 0)
;; (use-package winner-mode
  ;; :ensure nil
  ;; :config
  ;; (winner-mode))


(use-package all-the-icons)
(use-package nano-modeline
    :init (nano-modeline-mode 1))
(setq no-mode-line t)

;; set transparency
;; (set-frame-parameter (selected-frame) 'alpha '(97 97))
;; (add-to-list 'default-frame-alist '(alpha 97 97))

(custom-set-variables
 '(column-number-mode t)
 '(display-time-mode t)
 '(electric-pair-mode t)
 '(font-use-system-font nil)
 '(global-display-line-numbers-mode t)
 '(menu-bar-mode nil)
 '(org-fontify-done-headline nil)
 '(org-fontify-todo-headline nil)
 '(package-selected-packages
   '(mixed-pitch writeroom-mode company-box lsp-mode visual-fill-column org-bullets helpful doom-modeline doom-themes magit))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(window-divider-mode t)
 '(window-divider-default-places t)
 '(window-divider-default-bottom-width 1)
 '(tool-bar-mode nil)
 '(scroll-conservatively 100) 
 '(save-place-mode t))

(set-face-attribute 'default nil :font "Roboto Mono" :height 140)
(setq ring-bell-function 'ignore)

(use-package ivy
  :diminish
  :bind (:map ivy-minibuffer-map
              ("C-l" . ivy-alt-done)
              ("C-j" . ivy-next-line)
              ("C-k" . ivy-previous-line)
              :map ivy-switch-buffer-map
              ("C-k" . ivy-previous-line)
              ("C-l" . ivy-done)
              ("C-d" . ivy-switch-buffer-kill)
              :map ivy-reverse-i-search-map
              ("C-k" . ivy-previous-line)
              ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))
;;   (setq ivy-height 4))
(use-package ivy-explorer
  :config
  (ivy-explorer-mode 1))

(use-package ivy-rich)
(ivy-rich-mode 1)

(use-package which-key
  :defer 0
  :diminish which-key-mode
  :config
  (which-key-mode)
  (setq which-key-idle-delay 1))

(use-package counsel
  :bind (("C-M-j" . 'counsel-switch-buffer)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history))
  :config
  (counsel-mode 1))
(use-package ivy-prescient
  :after counsel
  :config
  (ivy-prescient-mode 1))

(use-package helpful
  :commands (helpful-callable helpful-variable helpful-command helpful-key)
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package org
  :config
  (setq org-ellipsis " ")
  :bind
  ("<f12>" . org-cycle-list-bullet))
(add-hook 'org-mode-hook 'org-overview)
(add-hook 'org-mode-hook 'org-num-mode)
;; (setq-default line-spacing 0)
;;(provide 'emacs-orgmode-config)

;; (setq org-adapt-indentation nil)
;; (setq org-startup-truncated t)
(setq global-page-break-line-mode t)
;; (setq header-line-format " ")
(customize-set-variable 'org-blank-before-new-entry 
                        '((heading . nil)
                          (plain-list-item . nil)))
(setq backup-directory-alist `(("." . "~/.saves")))

;; (setq make-backup-files nil)
(setq org-startup-indented t
      org-pretty-entities nil
      org-startup-with-inline-images t
      org-startup-latex-with-latex-preview t
      org-image-actual-width (list 550))
(setq org-cycle-separator-lines 1)
;;(setq org-log-done nil)
(setq org-html-coding-system 'utf-8-unix)
;;(eval-after-load "org"
;;  '(require 'ox-gfm nil t))
(setq org-html-table-default-attributes
      '(:border "0" :cellspacing "0" :cellpadding "6" :rules "none" :frame "none"))
(use-package flyspell-correct-ivy)

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode))
(setq org-bullets-bullet-list '("  "))
(setq org-indent-indentation-per-level 1)
(setq org-adapt-indentation nil)
(font-lock-add-keywords 'org-mode
                        '(("^ *\\([-]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) " "))))))
;; (dolist (face '((org-level-1 . 1.1)
;; (org-level-2 . 1.1)
;; (org-level-3 . 1.05)
;; (org-level-4 . 1.05)
;; (org-level-5 . 1.05)
;; (org-level-6 . 1.0)
;; (org-level-7 . 1.0)
;; (org-level-8 . 1.0)))
;; (set-face-attribute (car face) nil :weight 'bold :height (cdr face)))

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


;; (add-hook 'org-mode-hook 'org-indent-mode)
;; ;
                                        ; :hook '((text-mode . efs/org-mode-visual-fill))

(setq org-confirm-babel-evaluate nil)
(setq org-babel-python-command "python3")
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (python . t)
   (latex . t)))
;;      (julia . t)))

(setq org-preview-latex-default-process 'dvipng)
(plist-put org-format-latex-options :scale 2)

(setq org-latex-pdf-process
      '("latexmk -pdflatex='pdflatex -interaction nonstopmode' -pdf -bibtex -f %f"))



(unless (boundp 'org-latex-classes)
  (setq org-latex-classes nil))

(add-to-list 'org-latex-classes
             '("ethz"
               "\\documentclass[a4paper,11pt,titlepage]{memoir}
  \\usepackage[utf8]{inputenc}
  \\usepackage[T1]{fontenc}
  \\usepackage{fixltx2e}
  \\usepackage{graphicx}
  \\usepackage{longtable}
  \\usepackage{float}
  \\usepackage{wrapfig}
  \\usepackage{rotating}
  \\usepackage[normalem]{ulem}
  \\usepackage{amsmath}
  \\usepackage{textcomp}
  \\usepackage{marvosym}
  \\usepackage{wasysym}
  \\usepackage{amssymb}
  \\usepackage{hyperref}
  \\usepackage{mathpazo}
  \\usepackage{color}
  \\usepackage{enumerate}
  \\definecolor{bg}{rgb}{0.95,0.95,0.95}
  \\tolerance=1000
        [NO-DEFAULT-PACKAGES]
        [PACKAGES]
        [EXTRA]
  \\linespread{1.1}

  \\hypersetup{pdfborder=0 0 0}"
               ("\\chapter{%s}" . "\\chapter*{%s}")
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))


(add-to-list 'org-latex-classes
             '("article"
               "\\documentclass[11pt,a4paper]{article}
  \\usepackage[utf8]{inputenc}
  \\usepackage[T1]{fontenc}
  \\usepackage{fixltx2e}
  \\usepackage{graphicx}
  \\usepackage{longtable}
  \\usepackage{float}
  \\usepackage{wrapfig}
  \\usepackage{rotating}
  \\usepackage[normalem]{ulem}
  \\usepackage{amsmath}
  \\usepackage{textcomp}
  \\usepackage{marvosym}
  \\usepackage{wasysym}
  \\usepackage{amssymb}
  \\usepackage{hyperref}
  \\usepackage{mathpazo}
  \\usepackage{color}
  \\usepackage{enumerate}
  \\definecolor{bg}{rgb}{0.95,0.95,0.95}
  \\tolerance=1000
        [NO-DEFAULT-PACKAGES]
        [PACKAGES]
        [EXTRA]
  \\linespread{1.1}
  \\hypersetup{pdfborder=0 0 0}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")))



(add-to-list 'org-latex-classes '("ebook"
                                  "\\documentclass[11pt, oneside]{memoir}
  \\setstocksize{9in}{6in}
  \\settrimmedsize{\\stockheight}{\\stockwidth}{*}
  \\setlrmarginsandblock{2cm}{2cm}{*} % Left and right margin
  \\setulmarginsandblock{2cm}{2cm}{*} % Upper and lower margin
  \\checkandfixthelayout
  % Much more laTeX code omitted
  "
                                  ("\\chapter{%s}" . "\\chapter*{%s}")
                                  ("\\section{%s}" . "\\section*{%s}")
                                  ("\\subsection{%s}" . "\\subsection*{%s}")))

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
(setq org-fast-tag-selection-single-key t)
(setq org-use-fast-todo-selection t)
(setq org-reverse-note-order t)

;; (org-block-begin-line
;;  ((t (:underline "#A7A6AA" :foreground "#008ED1" :background "#EAEAFF"))))
;; (org-block-background
;;  ((t (:background "#FFFFEA"))))
;; (org-block-end-line
;;  ((nil )))

(use-package captain)
(add-hook
 'org-mode-hook
 (lambda ()
   (setq captain-predicate
         (lambda () (not (org-in-src-block-p))))
   (captain-mode 1)
   (abbrev-mode 1)
   (setq sentence-end-double-space nil)))

(setq abbrev-expand-function (lambda ()
                   (unless (org-in-src-block-p)
                 (abbrev--default-expand))))

;; Key-bind `org-remark-mark' to global-map so that you can call it
;; globally before the library is loaded.
(use-package org-remark)
(define-key global-map (kbd "C-c r m") #'org-remark-mode)

;; The rest of keybidings are done only on loading `org-remark'
(with-eval-after-load 'org-remark
  (define-key org-remark-mode-map (kbd "C-c r o") #'org-remark-open)
  (define-key org-remark-mode-map (kbd "C-c r ]") #'org-remark-view-next)
  (define-key org-remark-mode-map (kbd "C-c r [") #'org-remark-view-prev)
  (define-key org-remark-mode-map (kbd "C-c r r") #'org-remark-remove)
  (define-key org-remark-mode-map (kbd "C-c r h") #'org-remark-mark)
  (define-key org-remark-mode-map (kbd "C-c r w") #'org-remark-mark-red-line)
  (define-key org-remark-mode-map (kbd "C-c r d") #'org-remark-delete))

(org-remark-create "red-line"
                   '(:underline (:color "red" :style line))
                   '(CATEGORY "review" help-echo "Review this"))
;; (org-remark-create "yellow"
;;                    '(:underline "gold" :background "lemon chiffon")
;;                    '(CATEGORY "important"))

;; (add-hook 'markdown-mode-hook
;;           (lambda ()
;;             (markdown-toggle-markup-hiding 1)
;;             (captain-mode 1)
;;             (abbrev-mode 1)))

(with-eval-after-load 'org
  ;; This is needed as of Org 9.2
  (require 'org-tempo)

  (add-to-list 'org-structure-template-alist '("sh" . "src shell"))
  (add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
  (add-to-list 'org-structure-template-alist '("py" . "src python"))
  (add-to-list 'org-structure-template-alist '("lt" . "src latex"))
  (add-to-list 'org-structure-template-alist '("cpp" . "src c++")))

(setq org-roam-directory (file-truename "~/org-roam"))
(use-package org-roam
  :after org
  :config
  (org-roam-db-autosync-enable)
  :custom
  (org-roam-capture-templates
   '(("d" "default" plain
      "\n\n\n%?"
      :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)
     ("b" "book notes" plain
      "\n*Author* : %^{Author} \n*Title* : ${title} \n\n\n\n%?"
      :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+filetags: book")
      :unnarrowed t)))
  :bind (("C-c n f" . org-roam-node-find)
         ("C-c n r" . org-roam-node-random)		    
         (:map org-mode-map
               (("C-c n i" . org-roam-node-insert)
                ("C-c n o" . org-id-get-create)
                ("C-c n t" . org-roam-tag-add)
                ("C-c n a" . org-roam-alias-add)
                ("C-c n l" . org-roam-buffer-toggle)))))
(setq org-roam-completion-everywhere t)
(setq org-roam-capture-templates '(("d" "default" plain "%?"
                                    :if-new
                                    (file+head "${slug}.org"
                                               "#+title: ${title}\n#+date: %u\n#+lastmod: \n\n")
                                    :immediate-finish t))
      time-stamp-start "#\\+lastmod: [\t]*")

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

;; (defun efs/configure-eshell ()
;;   ;; Save command history when commands are entered
;;   (add-hook 'eshell-pre-command-hook 'eshell-save-some-history)
;;   ;; Truncate buffer for performance
;;   (add-to-list 'eshell-output-filter-functions 'eshell-truncate-buffer)
;;   (setq eshell-history-size         10000
;;         eshell-buffer-maximum-lines 10000
;;         eshell-hist-ignoredups t
;;         eshell-scroll-to-bottom-on-input t))
;; (use-package eshell-git-prompt
;;   :after eshell)
;; (use-package eshell
;;   :hook (eshell-first-time-mode . efs/configure-eshell)
;;   :config
;;   (with-eval-after-load 'esh-opt
;;     (setq eshell-destroy-buffer-when-process-dies t)
;;     (setq eshell-visual-commands '("htop" "zsh" "vim")))
;;   (eshell-git-prompt-use-theme 'robbyrussell))
(use-package vterm
  :ensure t)

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))
(setq initial-scratch-message "")
(defun remove-scratch-buffer ()
  (if (get-buffer "*scratch*")
      (kill-buffer "*scratch*")))
(add-hook 'after-change-major-mode-hook 'remove-scratch-buffer)
(setq dashboard-banner-logo-title nil)
(setq dashboard-startup-banner "~/.emacs.d/banner.png")
(setq dashboard-center-content t)
;; To disable shortcut "jump" indicators for each section, set
(setq dashboard-show-shortcuts t)
(setq dashboard-items '((recents  . 10)
                        (bookmarks . 10)))
(setq dashboard-set-heading-icons nil)
(setq dashboard-set-file-icons nil)
(setq dashboard-set-navigator t)
;;(dashboard-modify-heading-icons '((recents . "file-text")
;;                                  (bookmarks . "book")))
(setq dashboard-set-footer nil)
;; (setq dashboard-navigator-buttons
      ;; `(;; line1
        ;; ((,(all-the-icons-octicon "mark-github" :height 1.1 :v-adjust 0.0)
          ;; "Home"
          ;; "Browse homepage"
          ;; (lambda (&rest _) (browse-url "/home/vijay/home.org")))
         ;; ("★" "Star" "Show stars" (lambda (&rest _) (show-stars)) warning)
         ;; ("?" "" "?/h" #'show-help nil "<" ">"))
        ;; ;; line 2
        ;; ((,(all-the-icons-faicon "linkedin" :height 1.1 :v-adjust 0.0)
          ;; "Linkedin"
          ;; ""
          ;; (lambda (&rest _) (browse-url "homepage")))
         ;; ("⚑" nil "Show flags" (lambda (&rest _) (message "flag")) error))))

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'writeroom-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

(add-hook 'Man-mode-hook
          (lambda ()
            (visual-fill-column-mode 1)
            (setq visual-fill-column-width 100)
            (setq visual-fill-column-center-text t)))

;;saving customization opetion in custom file other than main file.
(setq custom-file (locate-user-emacs-file "custom-var.el"))
(load custom-file 'noerror 'nomessage)

;;fff

(use-package dimmer
  :init (dimmer-mode 1)
  :custom (dimmer-fraction 0.7)
  (dimmer-buffer-exclusion-regexps '("^\\*Calendar\\*$")))


;;(setq window-divider-default-bottom-width 4
;;      window-divider-default-right-width 4)

(defun move-line-up ()
  "Move up the current line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

(defun move-line-down ()
  "Move down the current line."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))


;; (defun duplicate-line ()
;;   (interactive)
;;   (kill-whole-line)
;;   (yank)
;;   (yank)
;;   (forward-line -1))


;; (defun hide-those-params-on-top ()
;;   (interactive)
;;   )
(defun crux-get-positions-of-line-or-region ()
  "Return positions (beg . end) of the current line or region."
  (let (beg end)
    (if (and mark-active (> (point) (mark)))
        (exchange-point-and-mark))
    (setq beg (line-beginning-position))
    (if mark-active
        (exchange-point-and-mark))
    (setq end (line-end-position))
    (cons beg end)))
(defun dark-theme-toggle ()
  (interactive)
  (nano-theme-toggle)
  )
           ;;;###autoload
(defun crux-duplicate-current-line-or-region (arg)
  "Duplicates the current line or region ARG times.
           If there's no region, the current line will be duplicated.  However, if
           there's a region, all lines that region covers will be duplicated."
  (interactive "p")
  (pcase-let* ((origin (point))
               (`(,beg . ,end) (crux-get-positions-of-line-or-region))
               (region (buffer-substring-no-properties beg end)))
    (dotimes (_i arg)
      (goto-char end)
      (unless (use-region-p)
        (newline))
      (insert region)
      (setq end (point)))
    (goto-char (+ origin (* (length region) arg) arg))))


(defun crux-smart-open-line-above ()
  "Insert an empty line above the current line.
                     Position the cursor at its beginning, according to the current mode."
  (interactive)
  (move-beginning-of-line nil)
  (insert "\n")
  (if electric-indent-inhibit
      ;; We can't use `indent-according-to-mode' in languages like Python,
      ;; as there are multiple possible indentations with different meanings.
      (let* ((indent-end (progn (crux-move-to-mode-line-start) (point)))
             (indent-start (progn (move-beginning-of-line nil) (point)))
             (indent-chars (buffer-substring indent-start indent-end)))
        (forward-line -1)
        ;; This new line should be indented with the same characters as
        ;; the current line.
        (insert indent-chars))
    ;; Just use the current major-mode's indent facility.
    (forward-line -1)
    (indent-according-to-mode)))

(defun smart-enter()
  (interactive)
  (move-end-of-line nil)
  (newline-and-indent)
  (indent-according-to-mode))


(defun crux-kill-other-buffers ()
  "Kill all buffers but the current one.
                   Doesn't mess with special buffers."
  (interactive)
  (when (y-or-n-p "Are you sure you want to kill all buffers but the current one? ")
    (seq-each
     #'kill-buffer
     (delete (current-buffer) (seq-filter #'buffer-file-name (buffer-list))))))


(defun crux-insert-date ()
  "Insert a timestamp according to locale's date and time format."
  (interactive)
  (insert (format-time-string "%c" (current-time))))

(defun crux-delete-file-and-buffer ()
  "Kill the current buffer and deletes the file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (when filename
      (if (vc-backend filename)
          (vc-delete-file filename)
        (when (y-or-n-p (format "Are you sure you want to delete %s? " filename))
          (delete-file filename delete-by-moving-to-trash)
          (message "Deleted file %s" filename)
          (kill-buffer))))))


(defun crux-indent-defun ()
  "Indent the current defun."
  (interactive)
  (save-excursion
    (mark-defun)
    (indent-region (region-beginning) (region-end))))

(setq mark-ring-max 6)
(setq global-mark-ring-max 6)
(defun xah-pop-local-mark-ring ()
  "Move cursor to last mark position of current buffer.
Call this repeatedly will cycle all positions in `mark-ring'.
URL `http://xahlee.info/emacs/emacs/emacs_jump_to_previous_position.html'
Version 2016-04-04"
  (interactive)
  (set-mark-command t))

(global-set-key (kbd "<f7>") 'pop-global-mark)
(global-set-key (kbd "<f8>") 'xah-pop-local-mark-ring)

;;
(use-package nano-theme
  :ensure t
  :config
  (load-theme 'nano t))
(setq nano-modeline-prefix-padding t)
;; (setq nord-region-highlight "frost")

(use-package dired-single)
(defun my-dired-init ()
  "Bunch of stuff to run for dired, either immediately or when it's
     loaded."
  ;; <add other stuff here>
  (define-key dired-mode-map [remap dired-find-file]
    'dired-single-buffer)
  (define-key dired-mode-map [remap dired-mouse-find-file-other-window]
    'dired-single-buffer-mouse)
  (define-key dired-mode-map [remap dired-up-directory]
    'dired-single-up-directory))

;; if dired's already loaded, then the keymap will be bound
(if (boundp 'dired-mode-map)
    ;; we're good to go; just add our bindings
    (my-dired-init)
  ;; it's not loaded yet, so add our bindings to the load-hook
  (add-hook 'dired-load-hook 'my-dired-init))

(with-eval-after-load 'dired  (use-package dired-filetype-face))
(deffiletype-face "julia" "#369325")
(deffiletype-face-regexp julia :extensions '("julia" "jl"))
(deffiletype-setup "julia")
(deffiletype-face "org" "#73A594")
(deffiletype-face-regexp org :extensions '("org" "org"))
(deffiletype-setup "org")
(deffiletype-face "python" "#ECC448")
(deffiletype-face-regexp python :extensions '("python" "py"))
(deffiletype-setup "python")
(deffiletype-face "cpp" "#32719A")
(deffiletype-face-regexp cpp
  :extensions
  '("c"
    "cpp"
    "f90"
    "f95"))
(deffiletype-setup "cpp")

(with-eval-after-load 'dired  (use-package dired-hide-dotfiles))
(defun my-dired-mode-hook ()
    "My `dired' mode hook."
    ;; To hide dot-files by default
    (dired-hide-dotfiles-mode))

  ;; To toggle hiding
  (define-key dired-mode-map "." #'dired-hide-dotfiles-mode)
  (add-hook 'dired-mode-hook #'my-dired-mode-hook)

(use-package bm
  :init
  (setq bm-restore-repository-on-load t)
  :config

  ;; Allow cross-buffer 'next'
  (setq bm-cycle-all-buffers t)

  ;; where to store persistant files
  (setq bm-repository-file "~/.emacs.d/bm-repository")

  ;; save bookmarks
  (setq-default bm-buffer-persistence t)

  ;; Loading the repository from file when on start up.
  (add-hook 'after-init-hook 'bm-repository-load)

  ;; Saving bookmarks
  (add-hook 'kill-buffer-hook #'bm-buffer-save)

  ;; Saving the repository to file when on exit.
  ;; kill-buffer-hook is not called when Emacs is killed, so we
  ;; must save all bookmarks first.
  (add-hook 'kill-emacs-hook #'(lambda nil
                                 (bm-buffer-save-all)
                                 (bm-repository-save)))



  ;; Restoring bookmarks
  (add-hook 'find-file-hook   #'bm-buffer-restore)
  (add-hook 'after-revert-hook #'bm-buffer-restore)

  ;; Make sure bookmarks is saved before check-in (and revert-buffer)
  (add-hook 'vc-before-checkin-hook #'bm-buffer-save)

                                        ;the two functions that make bm-bookmark worth it.
  (defun poseidon/bm-counsel-get-list (bookmark-overlays)
    "TODO: docstring.
 Arguments: BOOKMARK-OVERLAYS."
    (-map (lambda (bm)
            (with-current-buffer (overlay-buffer bm)
              (let* ((line (replace-regexp-in-string
                            "\n$"
                            ""
                            (buffer-substring (overlay-start bm)
                                              (overlay-end bm))))
                     ;; line numbers start on 1
                     (line-num (+ 1 (count-lines (point-min) (overlay-start bm))))
                     (name (format "%s:%d - %s" (buffer-name) line-num line)))
                `(,name . ,bm))))
          bookmark-overlays))


  (defun poseidon/bm-counsel-find-bookmark ()
    "TODO: docstring.
 Arguments: none."
    (interactive)
    (let* ((bm-list (poseidon/bm-counsel-get-list (bm-overlays-lifo-order t)))
           (bm-hash-table (make-hash-table :test 'equal))
           (search-list (-map (lambda (bm) (car bm)) bm-list)))
      (-each bm-list (lambda (bm)
                       (puthash (car bm) (cdr bm) bm-hash-table)))
      (ivy-read "Find bookmark: "
                search-list
                :require-match t
                :keymap counsel-describe-map
                :action (lambda (chosen)
                          (let ((bookmark (gethash chosen bm-hash-table)))
                            (switch-to-buffer (overlay-buffer bookmark))
                            (bm-goto bookmark)))
                :sort t)))

                                        ;(global-unset-key (kbd "<C-tab>"))
  (global-set-key (kbd "M-j") 'bm-toggle)
  (global-set-key (kbd "C-c j") 'poseidon/bm-counsel-find-bookmark)
  (global-set-key (kbd "C-c ,") 'bm-previous)
  (global-set-key (kbd "C-c .") 'bm-next)
  );end bm bookmarks


;; (use-package bm)
;; (setq bm-highlight-style 'bm-highlight-only-line)

;; (global-set-key (kbd "<C-f2>") 'bm-toggle)
;; (global-set-key (kbd "<f2>") 'bm-next)
;; (global-set-key (kbd "<S-f2>") 'bm-previous)

(defun xdg-open (filename)
  (interactive "fFilename: ")
  (let ((process-connection-type))
    (start-process "" nil "xdg-open" (expand-file-name filename))))

(defun find-file-auto (orig-fun &rest args)
  (let ((filename (car args)))
    (if (cl-find-if
         (lambda (regexp) (string-match regexp filename))
         '("\\.pdf\\'" "\\.docx?\\'"))
        (xdg-open filename)
      (apply orig-fun args))))

(advice-add 'find-file :around 'find-file-auto)

;; Distraction-free screen
;; for org mode
(use-package olivetti
  :init
  ;;(setq olivetti-body-width .110)
  :config
  (defun distraction-free ()
    "Distraction-free writing environment"
    (interactive)
    (if (equal olivetti-mode nil)
        (progn
          (window-configuration-to-register 1)
          (delete-other-windows)
          ;;(text-scale-increase 1)
          ;;(setq visual-fill-column-width 110)
          (visual-fill-column-mode 0)
          (olivetti-mode t)
          (setq olivetti-margin-width 7)
          (nano-modeline-mode 0)
          (hide-mode-line-mode 0)
          (flyspell-mode t)
          (set-face-attribute 'default nil :background "#F9F0CB" :foreground "#000000")
          (set-face-attribute 'nano-strong nil :foreground "#000000")
          (set-face-attribute 'cursor nil :background "#2E3440" :foreground "#EBCB8B")
          ;;(goto-char (point-min))
          ;;(org-hide-entry)
          (selectric-mode t)
          (toggle-frame-fullscreen))
      (progn
        (jump-to-register 1)
        ;;(goto-char (point-min))
        (nano-modeline-mode 1)
        ;;(org-show-entry)
        (visual-fill-column-mode t)
        ;; (setq visual-fill-column-width 150)
        (olivetti-mode 0)
        (set-face-attribute 'default nil :background "#000000" :foreground "#ECEFF4")
        (set-face-attribute 'nano-strong nil :foreground "#ECEFF4")
        (set-face-attribute 'cursor nil :background "#EBCB8B" :foreground "#2E3440")
        (toggle-frame-fullscreen)
        (selectric-mode 0)
        ;;(text-scale-decrease 1)
        )))
  :bind
  (("<f7>" . distraction-free)))
(use-package selectric-mode)
 ;; for prog modes

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(fset 'yes-or-no-p 'y-or-n-p)

(use-package vterm-toggle)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; vterm keybinds  
(global-set-key [f2] 'vterm-toggle)
(global-set-key [C-f2] 'vterm-toggle-cd)
;; vterm bindings end
(global-set-key [f6] 'calc)
(global-set-key [f5] 'dashboard-refresh-buffer)
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "M-p") 'flyspell-correct-at-point)
(global-set-key (kbd "M-P") 'flyspell-mode)
(global-set-key (kbd "C-x k") 'kill-this-buffer)
(global-set-key (kbd "C-x d") 'dired-jump)
(global-set-key (kbd "C-x D") 'dired)

(global-set-key (kbd "C-)") 'display-line-numbers-mode)
;; (global-set-key (kbd "C-(") 'hide-mode-line-mode)
;; (global-unset-key (kbd "C-n"))
;; (global-unset-key (kbd "C-p"))
;; (global-unset-key (kbd "C-f"))
;; (global-unset-key (kbd "C-b"))
;; (global-unset-key (kbd "C-h"))
;; (global-unset-key (kbd "C-j"))
;; (global-unset-key (kbd "C-k"))
;; (global-unset-key (kbd "C-l"))
;; (global-set-key (kbd "C-n") 'electric-newline-and-maybe-indent)
;; (global-set-key (kbd "C-f") 'kill-line)
;; (global-set-key (kbd "C-h") 'backward-char)
;; (global-set-key (kbd "C-l") 'forward-char)
;; (global-set-key (kbd "C-j") 'next-line)
;; (global-set-key (kbd "C-k") 'previous-line)
(global-set-key [(ctrl shift k)] 'crux-duplicate-current-line-or-region)
(global-set-key [(ctrl =)] 'crux-smart-open-line-above)
;;(global-set-key (kbd "<kp-enter>") 'smart-enter)
(global-set-key [(meta shift up)]  'move-line-up)
(global-set-key [(meta shift down)]  'move-line-down)
(global-set-key (kbd "C-<tab>")  'crux-indent-defun)
(global-set-key (kbd "C-x K") 'crux-kill-other-buffers)

(use-package mixed-pitch
  ;;:hook
  ;; If you want it in all text modes:
  ;; (text-mode . mixed-pitch-mode)
  :config
  (set-face-attribute 'fixed-pitch nil :font "Roboto Mono" :height 140)
  (set-face-attribute 'variable-pitch nil :font "Roboto Mono" :height 150))
  ;; (set-face-attribute 'variable-pitch nil :font "P22 Typewriter" :height 150))
  ;; (set-face-attribute 'variable-pitch nil :font "Noto Serif" :height 140))
  ;;(set-face-attribute 'variable-pitch nil :font "Latin Modern Sans" :height 140))

(custom-theme-set-faces
    'user
    '(window-divider ((t :foreground "#434C5E" :background "#434C5E")))
    '(window-divider-last-pixel ((t :foreground "#434C5E" :background "#434C5E")))
    '(window-divider-first-pixel ((t :foreground "#434C5E" :background "#434C5E")))
    ;; '(window-divider ((t (:inherit (nano-strong)) :foreground "#434C5E" :background "#434C5E")))
    '(bm-fringe-persistent-face ((t :background "#434C5E")))
    '(bm-persistent-face ((t :background "#434C5E")))
    ;;'(nano-modeline-active-status-RO ((t (:inherit (nano-subtle nano-strong) :background "#606C83" :foreground "#434C5E"))))
    '(org-block ((t (:inherit fixed-pitch))))
    '(org-code ((t (:inherit (shadow fixed-pitch)))))
    '(org-document-title ((t (:height 140 :weight bold))))
    '(org-tag ((t (:height 100))))
    '(dired-filetype-execute ((t (:foreground "red"))))
    '(dired-filetype-image ((t (:foreground "gray47"))))
    '(dired-filetype-plain ((t (:foreground "gold4"))))
    '(dired-filetype-source ((t (:foreground "chocolate"))))
    '(dired-filetype-video ((t (:foreground "gainsboro"))))
    '(dired-filetype-xml ((t (:foreground "dark cyan"))))
    '(italic ((t (:inherit nano-faded :slant italic))))
    '(ivy-org ((t (:inherit org-level-1))))
    '(org-level-1 ((t (:height 1.1 :foreground "#bf616a"))))
    '(org-level-2 ((t (:height 1.08 :foreground "#d08770"))))
    '(org-level-3 ((t (:height 1.05 :foreground "#ebcb8b"))))
    '(org-level-4 ((t (:height 1.03 :foreground "#a3be8c"))))
    '(org-level-5 ((t (:foreground "#b48ead"))))
    '(markdown-header-face-1 ((t (:height 1.1 :foreground "#bf616a"))))
    '(markdown-header-face-2 ((t (:height 1.08 :foreground "#d08770"))))
    '(markdown-header-face-3 ((t (:height 1.05 :foreground "#ebcb8b"))))
    '(markdown-header-face-4 ((t (:height 1.03 :foreground "#a3be8c"))))
    '(markdown-header-face-5 ((t (:foreground "#b48ead"))))
    '(org-special-keyword ((t (:height 100))))
    '(org-document-info ((t (:height 100))))
    '(org-document-info-keyword ((t (:height 100))))
    '(org-property-value ((t (:height 100))))
    '(org-meta-line ((t (:height 100))))
    '(org-verbatim ((t (:inherit fixed-pitch))))
    '(org-block-begin-line ((t (:height 100))))
    '(org-block-end-line ((t (:height 100))))
    '(org-drawer ((t (:height 100))))
    ;;'(region ((t (:inherit nano-subtle :foreground "#2E3440" :background "#88c0d0"))))
    ;;'(org-date ((t (:inherit variable-pitch)))
    '(org-link ((t (:underline t)))))

(use-package magit)

(use-package emojify
  :config
  (when (member "Segoe UI Emoji" (font-family-list))
    (set-fontset-font
     t 'symbol (font-spec :family "Segoe UI Emoji") nil 'prepend))
  (setq emojify-display-style 'unicode)
  (setq emojify-emoji-styles '(unicode))
  (bind-key* (kbd "C-c e") #'emojify-insert-emoji))

;; key to begin cycling buffers.  Global key.
(use-package buffer-flip
  :ensure t
  :bind  (("M-<tab>" . buffer-flip)
          :map buffer-flip-map
          ( "M-<tab>" .   buffer-flip-forward) 
          ( "M-S-<tab>" . buffer-flip-backward) 
          ( "M-ESC" .     buffer-flip-abort))
  :config
  (setq buffer-flip-skip-patterns
        '("^\\*helm\\b"
          "^\\*lsp-log\\*$"
          "^\\*Flymake log\\*$"
          "^\\*pyright\\*$"
          "^\\*pyright::stderr\\*$"
          "^\\*clangd\\*$"
          "^\\*clangd::stderr\\*$"
          "^\\*rust-analyzer\\*$"
          "^\\*rust-analyzer::stderr\\*$"
          "^\\*Org PDF LaTex Output\\*$"
          "^\\*Backtrace\\*$"
          "^\\*Pandoc\\*$")))

(defun autocompile nil
  "compile itself if ~/.emacs"
  (interactive)
  (require 'bytecomp)
  (let ((dotemacs (file-truename user-init-file)))
    (if (string= (buffer-file-name) (file-chase-links dotemacs))
      (byte-compile-file dotemacs))))

(add-hook 'after-save-hook 'autocompile)

;; (defun play-typewriter-sound ()
;;   (let ((data-directory "~/.emacs.d"))
;;     (play-sound `(sound :file "twsound.wav"))))

;; ;;(defadvice self-insert-command (after play-a-sound activate)
;; ;;    (play-typewriter-sound))

;; (define-minor-mode typewriter-mode
;;   "make sound of typewrite"
;;   :global t
;;   (if typewriter-mode
;;       (add-hook 'post-self-insert-hook 'play-typewriter-sound)
;;     (remove-hook 'post-self-insert-hook 'play-typewriter-sound)))

;;
;; as of now i'm using selectric mode for optimised functionality



;;(add-hook 'org-mode-hook 'selectric-mode)

(use-package yasnippet
  :config
  (setq yas-snippet-dirs '("~/emacs-config/snippets"))
  (yas-global-mode 1))
