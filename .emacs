;;(setq vc-handled-backends nil)
(add-to-list 'load-path "~/RisEmacs/")
(display-line-numbers-mode 1)

(require 'initial)
(require 'design)
(setq use-package-always-ensure t)

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
(setq ivy-height 7)

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
(electric-pair-mode)
(show-paren-mode)

(use-package yasnippet
  :config
  (setq yas-snippet-dirs '("~/RisEmacs/snippets"))
  (yas-global-mode 1))

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

;;(use-package magit)

;; (use-package mixed-pitch
;;   ;;:hook
;;   ;; If you want it in all text modes:
;;   ;; (text-mode . mixed-pitch-mode)
;;   :config
;;   (set-face-attribute 'fixed-pitch nil :font "JetBrains Mono" :height 115)
;;   (set-face-attribute 'variable-pitch nil :family "ETBembo" :height 155))

(add-hook 'text-mode-hook
           (lambda ()
            (variable-pitch-mode 1)))

;; custom functions
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("e7820b899036ae7e966dcaaec29fd6b87aef253748b7de09e74fdc54407a7a02" default))
 '(package-selected-packages
   '(dired-sidebar magit dashboard company-box company lsp-pyright lsp-mode org-ref flyspell-correct captain visual-fill-column dired-hide-dotfiles dired-filetype-face dired-single helpful ivy-prescient which-key use-package nano-modeline ivy-rich counsel))
 '(window-divider-default-bottom-width 2)
 '(window-divider-default-places t))



(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq initial-scratch-message "")
  (setq dashboard-startup-banner "~/RisEmacs/logo.png")
  (setq dashboard-banner-logo-title nil)
  (setq dashboard-center-content t)
  (setq dashboard-show-shortcuts t)
  (setq dashboard-items '((recents  . 10)
			  (bookmarks . 10)))
  (setq dashboard-set-heading-icons nil)
  (setq dashboard-set-file-icons nil)
  (setq dashboard-set-navigator t)
  (setq dashboard-set-footer nil))




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

(cond
 ((member "-default" command-line-args) t)
 ((member "-dark" command-line-args) (nano-theme-set-dark))
 (t (nano-theme-set-light)))
(call-interactively 'nano-refresh-theme)

    
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time
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
