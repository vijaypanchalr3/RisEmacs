(add-to-list 'load-path "~/RisEmacs/")


(require 'initial)
;;(require 'pack-init)
(require 'pack)
(require 'design)
(require 'nano-faces)
(require 'nano-theme)
(require 'nano-colors)
(require 'nano-theme-dark)
(require 'nano-theme-light)
(require 'nano-modeline)
(require 'rainbow-delimiters)
(require 'bdired)
(require 'borg)
(require 'customfun)
(require 'sethooks)
(require 'setvar)
(require 'keymaps)







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
   '(visual-fill-column helpful captain which-key use-package rainbow-delimiters ivy-rich ivy-prescient dired-single dired-hide-dotfiles dired-filetype-face dashboard counsel buffer-flip)))


;; (set-face-attribute 'org-table nil :inherit 'fixed-pitch)
