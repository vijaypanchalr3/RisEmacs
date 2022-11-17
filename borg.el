
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


(provide 'borg)
