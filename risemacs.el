;;(setq vc-handled-backends nil)
(add-to-list 'load-path "~/RisEmacs/")
(display-line-numbers-mode 1)

(require 'initial)
(require 'design)
(setq use-package-always-ensure t)

;;all packages

(use-package nano-modeline
    :init (nano-modeline-mode 1))
(setq no-mode-line t)

(use-package nano-theme
  :init (load-theme 'nano-dark t))


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

(use-package vterm
  :ensure t)
(use-package vterm-toggle)
;; (add-hook 'text-mode-hook (setq-local header-line-format 0))

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

(use-package mixed-pitch
  ;;:hook
  ;; If you want it in all text modes:
  ;; (text-mode . mixed-pitch-mode)
  :config
  (set-face-attribute 'fixed-pitch nil :font "hermit" :height 110)
  (set-face-attribute 'variable-pitch nil :family "Hermit" :height 115))

(add-hook 'text-mode-hook
           (lambda ()
            (variable-pitch-mode 1)))

;; custom functions
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(dired-sidebar magit dashboard company-box company lsp-pyright lsp-mode org-ref flyspell-correct captain visual-fill-column dired-hide-dotfiles dired-filetype-face dired-single helpful ivy-prescient which-key use-package nano-modeline ivy-rich counsel))
 '(window-divider-default-bottom-width 5)
 '(window-divider-default-places t))



(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#000000" :foreground "cornsilk" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 128 :width normal :foundry "UKWN" :family "Hermit"))))
 '(company-tooltip ((t (:inherit nano-subtle))))
 '(company-tooltip-selection ((t (:extend t :inherit nano-faded-i))))
 '(cursor ((t (:background "#EBCB8B" :foreground "#2E3440"))))
 '(dired-filetype-execute ((t (:foreground "red"))))
 '(dired-filetype-image ((t (:foreground "gray47"))))
 '(dired-filetype-plain ((t (:foreground "gold4"))))
 '(dired-filetype-source ((t (:foreground "chocolate"))))
 '(dired-filetype-video ((t (:foreground "gainsboro"))))
 '(dired-filetype-xml ((t (:foreground "dark cyan"))))
 '(flyspell-incorrect ((t (:inherit highlighted :underline (:color "red" :style wave)))))
 '(font-lock-builtin-face ((t (:inherit nano-salient))))
 '(font-lock-constant-face ((t (:inherit nano-salient))))
 '(font-lock-doc-face ((t (:inherit nano-faded :foreground "#ebcb8b"))))
 '(font-lock-function-name-face ((t (:inherit nano-strong :foreground "#8FBCBB"))))
 '(font-lock-keyword-face ((t (:inherit (nano-salient nano-strong)))))
 '(font-lock-negation-char-face ((t (:foreground "orange red"))))
 '(font-lock-preprocessor-face ((t (:inherit font-lock-builtin-face :foreground "#8fbcbb"))))
 '(font-lock-string-face ((t (:inherit nano-faded :foreground "#a3be8c"))))
 '(font-lock-type-face ((t (:inherit nano-strong :foreground "#81A1C1"))))
 '(font-lock-variable-name-face ((t (:inherit nano-strong :foreground "#F4E0BD"))))
 '(italic ((t (:inherit nano-faded :slant italic))))
 '(ivy-org ((t (:inherit org-level-1))))
 '(line-number ((t (:inherit nil :foreground "#A3BE8C"))))
 '(line-number-current-line ((t (:inherit nano-strong :foreground "#ADE979"))))
 '(markdown-header-face-1 ((t (:height 1.1 :foreground "#8b4513"))))
 '(markdown-header-face-2 ((t (:height 1.08 :foreground "#cd661d"))))
 '(markdown-header-face-3 ((t (:height 1.05 :foreground "#ee7621"))))
 '(markdown-header-face-4 ((t (:height 1.03 :foreground "#ff7f24"))))
 '(markdown-header-face-5 ((t (:foreground "#ff7f24"))))
 '(nano-modeline-active-status-RO ((t (:inherit (nano-subtle nano-strong) :background "#BF616A" :foreground "#434C5E"))))
 '(nano-modeline-active-status-RW ((t (:inherit (nano-faded-i nano-strong) :background "#a3be8c"))))
 '(nano-modeline-inactive ((t (:inherit nano-subtle-i))))
 '(nano-popout ((t (:foreground "#EBCB8B"))) t)
 '(nano-popout-i ((t (:background "#EBCB8B" :foreground "#2E3440"))) t)
 '(nano-salient ((t (:foreground "#B48EAD"))) t)
 '(nano-salient-i ((t (:background "#B48EAD" :foreground "#2E3440"))) t)
 '(nano-strong ((t (:foreground "#FFFFFF" :weight bold))) t)
 '(nano-subtle ((t (:background "#222222"))) t)
 '(nano-subtle-i ((t (:foreground "#222222"))) t)
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
 '(org-special-keyword ((t (:height 100))))
 '(rainbow-delimiters-depth-1-face ((t (:inherit rainbow-delimiters-base-face :foreground "sea green"))))
 '(rainbow-delimiters-depth-2-face ((t (:inherit rainbow-delimiters-base-face :foreground "rosy brown"))))
 '(rainbow-delimiters-depth-3-face ((t (:inherit rainbow-delimiters-base-face :foreground "light green"))))
 '(rainbow-delimiters-depth-6-face ((t (:inherit rainbow-delimiters-base-face :foreground "lawn green"))))
 '(region ((t (:extend t :background "#222222"))))
 '(window-divider ((t :foreground "#111111" :background "#111111")))
 '(window-divider-first-pixel ((t :foreground "#111111" :background "#111111")))
 '(window-divider-last-pixel ((t :foreground "#111111" :background "#111111"))))

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
;; (defun remove-scratch-buffer ()
  ;; (if (get-buffer "*scratch*")
      ;; (kill-buffer "*scratch*")))
;; (add-hook 'after-change-major-mode-hook 'remove-scratch-buffer)
;; To disable shortcut "jump" indicators for each section, set
;;(dashboard-modify-heading-icons '((recents . "file-text")
;;                                  (bookmarks . "book")))

(require 'customfun)
(require 'keymaps)
(require 'bdired)
(require 'borg)
(require 'elatex)
(require 'languages)

;; scroll one line at a time (less "jumpy" than defaults)
    
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time

(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
    
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
    
(setq scroll-step 1) ;; keyboard scroll one line at a time
