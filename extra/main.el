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

(use-package vterm
  :ensure t)

(use-package vterm-toggle)

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
  (set-face-attribute 'fixed-pitch nil :font "Roboto Mono" :height 140)
  (set-face-attribute 'variable-pitch nil :font "Roboto Mono" :height 150))



;; custom functions
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(dired-hide-dotfiles dired-filetype-face dired-single helpful ivy-prescient which-key use-package nano-modeline ivy-rich counsel))
 '(window-divider-default-bottom-width 15)
 '(window-divider-default-places bottom-right))




(require 'customfun)
(require 'keymaps)
(require 'bdired)
(require 'borg)

