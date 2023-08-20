
;; (package-initialize)
;;(setq vc-handled-backends nil)
(add-to-list 'load-path "~/RisEmacs/")

;; (require 'nano-splash)
;; (let ((inhibit-message t))
;;   (message "Welcome to GNU Emacs / N Λ N O edition")
;;   (message (format "Initialization time: %s" (emacs-init-time))))

;; Default layout (optional)
;;(require 'nano-layout)
(add-to-list 'command-switch-alist '("-dark"   . (lambda (args))))
(add-to-list 'command-switch-alist '("-light"  . (lambda (args))))
(add-to-list 'command-switch-alist '("-default"  . (lambda (args))))
(add-to-list 'command-switch-alist '("-no-splash" . (lambda (args))))
;; (add-to-list 'command-switch-alist '("-no-help" . (lambda (args))))
;; (add-to-list 'command-switch-alist '("-compact" . (lambda (args))))


(require 'initial)
(require 'design)

;; custom functions
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(custom-safe-themes
;;    '("e7820b899036ae7e966dcaaec29fd6b87aef253748b7de09e74fdc54407a7a02" default))
;;  '(package-selected-packages
;;    '(dired-sidebar magit dashboard company-box company lsp-pyright lsp-mode org-ref flyspell-correct captain visual-fill-column dired-hide-dotfiles dired-filetype-face dired-single helpful ivy-prescient which-key use-package nano-modeline ivy-rich counsel))
;; )



(use-package dashboard
  :ensure nil
  :config
  (dashboard-setup-startup-hook))



(require 'customfun)
(require 'keymaps)
(require 'bdired)
(require 'borg)
(require 'elatex)
(require 'languages)
(require 'nano-faces)
(require 'nano-theme)
(require 'nano-theme-dark)
(require 'nano-theme-light)
(require 'nano-modeline)
(require 'sethooks)


(cond
 ((member "-default" command-line-args) t)
 ((member "-dark" command-line-args) (nano-theme-set-light))
 (t (nano-theme-set-dark)))
(call-interactively 'nano-refresh-theme)

;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(window-divider-default-right-width 5))
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







(require 'setvar)
