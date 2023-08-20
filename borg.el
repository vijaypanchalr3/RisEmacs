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
(provide 'borg)
