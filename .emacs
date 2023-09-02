(add-to-list 'load-path "~/RisEmacs/")


(require 'initial)
(require 'design)
(require 'customfun)
(require 'keymaps)
(require 'bdired)
;;(require 'elatex)
(require 'languages)
(require 'nano-faces)
(require 'nano-theme)
(require 'nano-theme-dark)
(require 'nano-theme-light)
(require 'nano-modeline)
(require 'sethooks)
(require 'setvar)
(require 'borg)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
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
 '(org-meta-line ((t (:inherit fixed-pitch :foreground "#c6b6ad"))))
 '(org-property-value ((t (:height 100))) t)
 '(org-remark-highlighter ((t (:background "#EBCB8B" :foreground "black" :underline "tan1"))))
 '(org-special-keyword ((t (:height 100)))))







;; (use-package org
;;   :config
;;   ;;(setq org-ellipsis " "
;;   ;;      org-hide-emphasis-markers t)
;;   :bind
;;   ("<f12>" . org-cycle-list-bullet))
;; (add-hook 'org-mode-hook 'org-overview)
;; (add-hook 'org-mode-hook 'org-num-mode)
;; ;; (setq-default line-spacing 0)
;; ;;(provide 'emacs-orgmode-config)

;; ;; (setq org-adapt-indentation nil)
;; ;; (setq org-startup-truncated t)
;; (setq global-page-break-line-mode t)
;; ;; (setq header-line-format " ")
;; (customize-set-variable 'org-blank-before-new-entry 
;;                         '((heading . nil)
;;                           (plain-list-item . nil)))
;; (setq backup-directory-alist `(("." . "~/.saves")))

;; ;; (setq make-backup-files nil)
;; (setq org-startup-indented t
;;       org-pretty-entities t
;;       org-startup-with-inline-images t
;;       ;;org-startup-latex-with-latex-preview t
;;       org-image-actual-width (list 550))
;; (setq org-cycle-separator-lines 1)
;; (setq org-log-done nil)
;; (setq org-html-coding-system 'utf-8-unix)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(yasnippet which-key vterm-toggle visual-fill-column use-package rainbow-delimiters nano-modeline mixed-pitch magit lsp-pyright ivy-rich ivy-prescient helpful flyspell-correct dired-single dired-sidebar dired-hide-dotfiles dired-filetype-face dashboard counsel company-box captain buffer-flip all-the-icons))
 '(warning-suppress-log-types '((comp))))
