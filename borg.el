;; (setq backup-directory-alist `(("." . "~/.saves")))




;; (custom-set-faces
;;  '(org-block ((t (:inherit fixed-pitch))))
;;  '(org-block-begin-line ((t (:height 100))))
;;  '(org-block-end-line ((t (:height 100))))
;;  '(org-code ((t (:inherit (shadow fixed-pitch)))))
;;  '(org-date ((t (:background "#88C0D0" :foreground "#242424" :slant oblique :weight ultra-bold :height 0.95))))
;;  '(org-document-info ((t (:height 100))))
;;  '(org-document-info-keyword ((t (:height 100))))
;;  '(org-document-title ((t (:height 140 :weight bold))))
;;  '(org-drawer ((t (:inherit nano-faded :height 100))))
;;  '(org-ellipsis ((t (:inherit nano-strong))))
;;  '(org-level-1 ((t (:inherit default :extend nil :foreground "#ceb39e" :height 1.4))))
;;  '(org-level-2 ((t (:inherit nano-strong :extend nil :foreground "#ceb39e" :height 1.2))))
;;  '(org-level-3 ((t (:inherit nano-strong :extend nil :foreground "#ceb39e" :height 1.15))))
;;  '(org-level-4 ((t (:inherit nano-strong :extend nil :foreground "#ceb39e" :height 1.1))))
;;  '(org-level-5 ((t (:foreground "#ff7f24"))))
;;  '(org-link ((t (:underline t))))
;;  '(org-property-value ((t (:height 100))) t)
;;  '(org-remark-highlighter ((t (:background "#EBCB8B" :foreground "black" :underline "tan1"))))
;;  '(org-special-keyword ((t (:height 100))))
;;  '(org-meta-line ((t (:inherit fixed-pitch :foreground "#c6b6ad")))))
;;  '(org-document-info-keyword ((t (:inherit fixed-pitch :foreground "#c6b6ad"))))
;;  '(org-document-info ((t (:inherit default :foreground "#c6b6ad"))))
;;  '(org-verbatim ((t (:inherit fixed-pitch))))
;;  '(org-code ((t (:inherit fixed-pitch))))
;;  '(org-table ((t (:inherit fixed-pitch :background "#171716"))))
;;  '(org-formula ((t (:inherit org-table)))
;;  '(org-verse ((t (:inherit default :foreground "#e6e6fa" :background "#171716"))))
;;  '(org-quote ((t (:inherit default :foreground "#e6e6fa" :background "#171716"))))
;;  '(org-hide ((t (:inherit fixed-pitch :foreground "#000000"))))
;;  '(org-indent ((t (:inherit org-hide))))
;;  '(org-date ((t (:inherit fixed-pitch :foreground "#c6b6ad" :underline nil))))
;;  '(org-document-title ((t (:inherit default :foreground "#ee7e38" :height 1.8 :underline (:color "#ee7e38")))))
;;  '(org-checkbox ((t (:inherit fixed-pitch :weight bold :foreground "#999999"))))
;;  '(org-tag ((t (:inherit fixed-pitch :foreground "#aaaaaa"))))
;;  '(org-block-begin-line ((t (:inherit fixed-pitch :background "#270706"))))
;;  '(org-block-end-line ((t (:inherit fixed-pitch :background "#270706"))))
;;  '(org-block ((t (:background "#333333" :inherit fixed-pitch))))
;;  '(org-priority ((t (:inherit fixed-pitch :weight normal))))
;;  '(org-special-keyword ((t (:inherit fixed-pitch :foreground "#777777"))))
;;  '(org-footnote ((t (:inherit org-link))))
;;  '(hl-line ((t (:background "#3d0000")))))


;; (setq org-startup-indented t
;;       org-pretty-entities nil
;;       org-image-actual-width (list 550))
;; (setq org-cycle-separator-lines 1)


;; (defun new-info-mode-fun ()
;;   (setq visual-fill-column-center-text t
;;         visual-fill-column-width 90)
;;   (visual-fill-column-mode 1))
;; (add-hook 'Info-mode-hook 'new-info-mode-fun)
;; (add-hook 'calendar-mode-hook 'new-info-mode-fun)


;; (defun efs/org-mode-visual-fill ()
;;   (setq visual-fill-column-width 100
;;         visual-fill-column-center-text t)
;;   (visual-fill-column-mode 1)
;;   (visual-line-mode 1))


;; (use-package visual-fill-column
;;   :hook '((org-mode . efs/org-mode-visual-fill)
;; 	  (tex-mode . efs/org-mode-visual-fill)
;;           (add-hook 'markdown-mode-hook 'efs/org-mode-visual-fill)
;;           (add-hook 'text-mode-hook 'efs/org-mode-visual-fill)))


;; (setq org-confirm-babel-evaluate nil)
;; (setq org-babel-python-command "python3")
;; (org-babel-do-load-languages
;;  'org-babel-load-languages
;;  '((emacs-lisp . t)
;;    (python . t)
;;    (latex . t)))



;; (setq org-preview-latex-default-process 'dvipng)
;; (plist-put org-format-latex-options :scale 2)


;; (use-package captain)
;; (add-hook
;;  'org-mode-hook
;;  (lambda ()
;;    (setq captain-predicate
;;          (lambda () (not (org-in-src-block-p))))
;;    (captain-mode 1)
;;    (abbrev-mode 1)
;;    (setq sentence-end-double-space nil)))

;; (setq abbrev-expand-function (lambda ()
;; 			       (unless (org-in-src-block-p)
;; 				 (abbrev--default-expand))))
;; (setq org-latex-pdf-process (list
;;    "latexmk -pdflatex='lualatex -shell-escape -interaction nonstopmode' -pdf -f  %f"))

;; (unless (boundp 'org-latex-classes)
;;   (setq org-latex-classes nil))
;; (add-to-list 'org-latex-classes
;;              '("article"
;;                "\\documentclass[14pt,a4paper]{extarticle}
;;                 \\usepackage{blindtext}
;;     \\usepackage[skip=12pt plus1pt, indent=30pt]{parskip}
;;     \\usepackage{geometry}
;;     \\geometry{
;;       a4paper,
;;       total={166mm,227mm},
;;       left= 29mm,
;;       right=29mm,
;;       top=32mm,
;;       bottom=32mm
;;       }
;;     \\usepackage[utf8]{inputenc}
;;     \\usepackage[T1]{fontenc}
;;     \\usepackage{fixltx2e}
;;     \\usepackage{graphicx}
;;     \\usepackage{longtable}
;;     \\usepackage{float}
;;     \\usepackage{wrapfig}
;;     \\usepackage{rotating}
;;     \\usepackage[normalem]{ulem}
;;     \\usepackage{amsmath}
;;     \\usepackage{textcomp}
;;     \\usepackage{marvosym}
;;     \\usepackage{wasysym}
;;     \\usepackage{amssymb}
;;     \\usepackage{hyperref}
;;     \\usepackage{mathpazo}
;;     \\usepackage{color}
;;     \\usepackage{enumerate}
;;     \\usepackage{sectsty}    
;;     \\definecolor{astral}{RGB}{46,116,181}
;;     \\definecolor{bg}{rgb}{0.95,0.95,0.95}
;;     \\definecolor{bg1}{rgb}{0.9,0.9,0.9}
;;     \\definecolor{schrift}{RGB}{0,73,114}
;;     \\tolerance=1000
;;           [NO-DEFAULT-PACKAGES]
;;           [PACKAGES]
;;           [EXTRA]
;;     \\linespread{1.2}
;;     \\hypersetup{pdfborder=0 0 0}"
;;                ("\\section{%s}" . "\\section*{%s}")
;;                ("\\subsection{%s}" . "\\subsection*{%s}")
;;                ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
;;                ("\\paragraph{%s}" . "\\paragraph*{%s}")))



(setq backup-directory-alist `(("." . "~/.saves")))




(custom-set-faces
 '(org-block ((t (:inherit fixed-pitch))))
 '(org-block-begin-line ((t (:height 100))))
 '(org-block-end-line ((t (:height 100))))
 '(org-code ((t (:inherit (shadow fixed-pitch)))))
 '(org-date ((t (:background "#88C0D0" :foreground "#242424" :slant oblique :weight ultra-bold :height 0.95))))
 '(org-document-info ((t (:height 100))))
 '(org-document-info-keyword ((t (:height 100))))
 '(org-document-title ((t (:height 140 :weight bold))))
 '(org-drawer ((t (:inherit nano-faded :height 100))))
 '(org-ellipsis ((t (:inherit nano-strong))))
 '(org-level-1 ((t (:inherit default :extend nil :foreground "#ceb39e" :height 1.4))))
 '(org-level-2 ((t (:inherit nano-strong :extend nil :foreground "#ceb39e" :height 1.2))))
 '(org-level-3 ((t (:inherit nano-strong :extend nil :foreground "#ceb39e" :height 1.15))))
 '(org-level-4 ((t (:inherit nano-strong :extend nil :foreground "#ceb39e" :height 1.1))))
 '(org-level-5 ((t (:foreground "#ff7f24"))))
 '(org-link ((t (:underline t))))
 '(org-property-value ((t (:height 100))) t)
 '(org-remark-highlighter ((t (:background "#EBCB8B" :foreground "black" :underline "tan1"))))
 '(org-special-keyword ((t (:height 100))))
 '(org-meta-line ((t (:inherit fixed-pitch :foreground "#c6b6ad")))))
 '(org-document-info-keyword ((t (:inherit fixed-pitch :foreground "#c6b6ad"))))
 '(org-document-info ((t (:inherit default :foreground "#c6b6ad"))))
 '(org-verbatim ((t (:inherit fixed-pitch))))
 '(org-code ((t (:inherit fixed-pitch))))
 '(org-table ((t (:inherit fixed-pitch :background "#171716"))))
 '(org-formula ((t (:inherit org-table)))
 '(org-verse ((t (:inherit default :foreground "#e6e6fa" :background "#171716"))))
 '(org-quote ((t (:inherit default :foreground "#e6e6fa" :background "#171716"))))
 '(org-hide ((t (:inherit fixed-pitch :foreground "#000000"))))
 '(org-indent ((t (:inherit org-hide))))
 '(org-date ((t (:inherit fixed-pitch :foreground "#c6b6ad" :underline nil))))
 '(org-document-title ((t (:inherit default :foreground "#ee7e38" :height 1.8 :underline (:color "#ee7e38")))))
 '(org-checkbox ((t (:inherit fixed-pitch :weight bold :foreground "#999999"))))
 '(org-tag ((t (:inherit fixed-pitch :foreground "#aaaaaa"))))
 '(org-block-begin-line ((t (:inherit fixed-pitch :background "#270706"))))
 '(org-block-end-line ((t (:inherit fixed-pitch :background "#270706"))))
 '(org-block ((t (:background "#333333" :inherit fixed-pitch))))
 '(org-priority ((t (:inherit fixed-pitch :weight normal))))
 '(org-special-keyword ((t (:inherit fixed-pitch :foreground "#777777"))))
 '(org-footnote ((t (:inherit org-link))))
 '(hl-line ((t (:background "#3d0000")))))


(setq org-startup-indented t
      org-pretty-entities nil
      org-image-actual-width (list 550))
(setq org-cycle-separator-lines 1)


(defun new-info-mode-fun ()
  (setq visual-fill-column-center-text t
        visual-fill-column-width 90)
  (visual-fill-column-mode 1))
(add-hook 'Info-mode-hook 'new-info-mode-fun)
(add-hook 'calendar-mode-hook 'new-info-mode-fun)


(defun efs/org-mode-visual-fill ()
  (setq visual-fill-column-width 100
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1)
  (visual-line-mode 1))


(use-package visual-fill-column
  :hook '((org-mode . efs/org-mode-visual-fill)
	  (tex-mode . efs/org-mode-visual-fill)
          (add-hook 'markdown-mode-hook 'efs/org-mode-visual-fill)
          (add-hook 'text-mode-hook 'efs/org-mode-visual-fill)))


(setq org-confirm-babel-evaluate nil)
(setq org-babel-python-command "python3")
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (python . t)
   (latex . t)))



(setq org-preview-latex-default-process 'dvipng)
(plist-put org-format-latex-options :scale 2)


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
(setq org-latex-pdf-process (list
   "latexmk -pdflatex='lualatex -shell-escape -interaction nonstopmode' -pdf -f  %f"))

(unless (boundp 'org-latex-classes)
  (setq org-latex-classes nil))
(add-to-list 'org-latex-classes
             '("article"
               "\\documentclass[14pt,a4paper]{extarticle}
                \\usepackage{blindtext}
    \\usepackage[skip=12pt plus1pt, indent=30pt]{parskip}
    \\usepackage{geometry}
    \\geometry{
      a4paper,
      total={166mm,227mm},
      left= 29mm,
      right=29mm,
      top=32mm,
      bottom=32mm
      }
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
    \\usepackage{sectsty}    
    \\definecolor{astral}{RGB}{46,116,181}
    \\definecolor{bg}{rgb}{0.95,0.95,0.95}
    \\definecolor{bg1}{rgb}{0.9,0.9,0.9}
    \\definecolor{schrift}{RGB}{0,73,114}
    \\tolerance=1000
          [NO-DEFAULT-PACKAGES]
          [PACKAGES]
          [EXTRA]
    \\linespread{1.2}
    \\hypersetup{pdfborder=0 0 0}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")))



;; emacs from scractch code


;; (defun efs/org-font-setup ()
;;   ;; Replace list hyphen with dot
;;   (font-lock-add-keywords 'org-mode
;;                           '(("^ *\\([-]\\) "
;;                              (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

;;   ;; Set faces for heading levels
;;   (dolist (face '((org-level-1 . 1.2)
;;                   (org-level-2 . 1.1)
;;                   (org-level-3 . 1.05)
;;                   (org-level-4 . 1.0)
;;                   (org-level-5 . 1.1)
;;                   (org-level-6 . 1.1)
;;                   (org-level-7 . 1.1)
;;                   (org-level-8 . 1.1)))
;;     (set-face-attribute (car face) nil :font "Cantarell" :weight 'regular :height (cdr face)))

;;   ;; Ensure that anything that should be fixed-pitch in Org files appears that way
;;   (set-face-attribute 'org-block nil    :foreground nil :inherit 'fixed-pitch)
;;   (set-face-attribute 'org-table nil    :inherit 'fixed-pitch)
;;   (set-face-attribute 'org-formula nil  :inherit 'fixed-pitch)
;;   (set-face-attribute 'org-code nil     :inherit '(shadow fixed-pitch))
;;   (set-face-attribute 'org-table nil    :inherit '(shadow fixed-pitch))
;;   (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
;;   (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
;;   (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
;;   (set-face-attribute 'org-checkbox nil  :inherit 'fixed-pitch)
;;   (set-face-attribute 'line-number nil :inherit 'fixed-pitch)
;;   (set-face-attribute 'line-number-current-line nil :inherit 'fixed-pitch))
;; (defun efs/org-mode-setup ()
;;   (org-indent-mode)
;;   (variable-pitch-mode 1)
;;   (visual-line-mode 1))

;; (use-package org
;;   :pin org
;;   :commands (org-capture org-agenda)
;;   :hook (org-mode . efs/org-mode-setup)
;;   :config
;;   (setq org-ellipsis " ▾")

;;   (setq org-agenda-start-with-log-mode t)
;;   (setq org-log-done 'time)
;;   (setq org-log-into-drawer t)

;;   (setq org-agenda-files
;;         '("~/Projects/Code/emacs-from-scratch/OrgFiles/Tasks.org"
;;           "~/Projects/Code/emacs-from-scratch/OrgFiles/Habits.org"
;;           "~/Projects/Code/emacs-from-scratch/OrgFiles/Birthdays.org"))

;;   (require 'org-habit)
;;   (add-to-list 'org-modules 'org-habit)
;;   (setq org-habit-graph-column 60)

;;   (setq org-todo-keywords
;;     '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!)")
;;       (sequence "BACKLOG(b)" "PLAN(p)" "READY(r)" "ACTIVE(a)" "REVIEW(v)" "WAIT(w@/!)" "HOLD(h)" "|" "COMPLETED(c)" "CANC(k@)")))

;;   (setq org-refile-targets
;;     '(("Archive.org" :maxlevel . 1)
;;       ("Tasks.org" :maxlevel . 1)))

;;   ;; Save Org buffers after refiling!
;;   (advice-add 'org-refile :after 'org-save-all-org-buffers)

;;   (setq org-tag-alist
;;     '((:startgroup)
;;        ; Put mutually exclusive tags here
;;        (:endgroup)
;;        ("@errand" . ?E)
;;        ("@home" . ?H)
;;        ("@work" . ?W)
;;        ("agenda" . ?a)
;;        ("planning" . ?p)
;;        ("publish" . ?P)
;;        ("batch" . ?b)
;;        ("note" . ?n)
;;        ("idea" . ?i)))

;;   ;; Configure custom agenda views
;;   (setq org-agenda-custom-commands
;;    '(("d" "Dashboard"
;;      ((agenda "" ((org-deadline-warning-days 7)))
;;       (todo "NEXT"
;;         ((org-agenda-overriding-header "Next Tasks")))
;;       (tags-todo "agenda/ACTIVE" ((org-agenda-overriding-header "Active Projects")))))

;;     ("n" "Next Tasks"
;;      ((todo "NEXT"
;;         ((org-agenda-overriding-header "Next Tasks")))))

;;     ("W" "Work Tasks" tags-todo "+work-email")

;;     ;; Low-effort next actions
;;     ("e" tags-todo "+TODO=\"NEXT\"+Effort<15&+Effort>0"
;;      ((org-agenda-overriding-header "Low Effort Tasks")
;;       (org-agenda-max-todos 20)
;;       (org-agenda-files org-agenda-files)))

;;     ("w" "Workflow Status"
;;      ((todo "WAIT"
;;             ((org-agenda-overriding-header "Waiting on External")
;;              (org-agenda-files org-agenda-files)))
;;       (todo "REVIEW"
;;             ((org-agenda-overriding-header "In Review")
;;              (org-agenda-files org-agenda-files)))
;;       (todo "PLAN"
;;             ((org-agenda-overriding-header "In Planning")
;;              (org-agenda-todo-list-sublevels nil)
;;              (org-agenda-files org-agenda-files)))
;;       (todo "BACKLOG"
;;             ((org-agenda-overriding-header "Project Backlog")
;;              (org-agenda-todo-list-sublevels nil)
;;              (org-agenda-files org-agenda-files)))
;;       (todo "READY"
;;             ((org-agenda-overriding-header "Ready for Work")
;;              (org-agenda-files org-agenda-files)))
;;       (todo "ACTIVE"
;;             ((org-agenda-overriding-header "Active Projects")
;;              (org-agenda-files org-agenda-files)))
;;       (todo "COMPLETED"
;;             ((org-agenda-overriding-header "Completed Projects")
;;              (org-agenda-files org-agenda-files)))
;;       (todo "CANC"
;;             ((org-agenda-overriding-header "Cancelled Projects")
;;              (org-agenda-files org-agenda-files)))))))

;;   (setq org-capture-templates
;;     `(("t" "Tasks / Projects")
;;       ("tt" "Task" entry (file+olp "~/Projects/Code/emacs-from-scratch/OrgFiles/Tasks.org" "Inbox")
;;            "* TODO %?\n  %U\n  %a\n  %i" :empty-lines 1)

;;       ("j" "Journal Entries")
;;       ("jj" "Journal" entry
;;            (file+olp+datetree "~/Projects/Code/emacs-from-scratch/OrgFiles/Journal.org")
;;            "\n* %<%I:%M %p> - Journal :journal:\n\n%?\n\n"
;;            ;; ,(dw/read-file-as-string "~/Notes/Templates/Daily.org")
;;            :clock-in :clock-resume
;;            :empty-lines 1)
;;       ("jm" "Meeting" entry
;;            (file+olp+datetree "~/Projects/Code/emacs-from-scratch/OrgFiles/Journal.org")
;;            "* %<%I:%M %p> - %a :meetings:\n\n%?\n\n"
;;            :clock-in :clock-resume
;;            :empty-lines 1)

;;       ("w" "Workflows")
;;       ("we" "Checking Email" entry (file+olp+datetree "~/Projects/Code/emacs-from-scratch/OrgFiles/Journal.org")
;;            "* Checking Email :email:\n\n%?" :clock-in :clock-resume :empty-lines 1)

;;       ("m" "Metrics Capture")
;;       ("mw" "Weight" table-line (file+headline "~/Projects/Code/emacs-from-scratch/OrgFiles/Metrics.org" "Weight")
;;        "| %U | %^{Weight} | %^{Notes} |" :kill-buffer t)))

;;   (define-key global-map (kbd "C-c j")
;;     (lambda () (interactive) (org-capture nil "jj")))

;;   (efs/org-font-setup))
;; (use-package org-bullets
;;   :hook (org-mode . org-bullets-mode)
;;   :custom
;;   (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))
;; (defun efs/org-mode-visual-fill ()
;;   (setq visual-fill-column-width 100
;;         visual-fill-column-center-text t)
;;   (visual-fill-column-mode 1))

;; (use-package visual-fill-column
;;   :hook (org-mode . efs/org-mode-visual-fill))

(provide 'borg)
