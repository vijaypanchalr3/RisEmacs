(add-to-list 'load-path "/home/vijay/.emacs.d/lisp/")
(require 'lsp-latex)
;; "texlab" must be located at a directory contained in `exec-path'.
;; If you want to put "texlab" somewhere else,
;; you can specify the path to "texlab" as follows:
(setq lsp-latex-texlab-executable "/home/vijay/texlab")

(with-eval-after-load "tex-mode"
 (add-hook 'tex-mode-hook 'lsp)
 (add-hook 'latex-mode-hook 'lsp))

;; For YaTeX
(with-eval-after-load "yatex"
 (add-hook 'yatex-mode-hook 'lsp))

;; For bibtex
(with-eval-after-load "bibtex"
 (add-hook 'bibtex-mode-hook 'lsp))





(provide 'elatex)
