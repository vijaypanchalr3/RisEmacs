(use-package dired-single)
(require 'nano-base-colors)
(defun my-dired-init ()
  "Bunch of stuff to run for dired, either immediately or when it's
     loaded."
  ;; <add other stuff here>
  (define-key dired-mode-map [remap dired-find-file]
    'dired-single-buffer)
  (define-key dired-mode-map [remap dired-mouse-find-file-other-window]
    'dired-single-buffer-mouse)
  (define-key dired-mode-map [remap dired-up-directory]
    'dired-single-up-directory))

;; if dired's already loaded, then the keymap will be bound
(if (boundp 'dired-mode-map)
    ;; we're good to go; just add our bindings
    (my-dired-init)
  ;; it's not loaded yet, so add our bindings to the load-hook
  (add-hook 'dired-load-hook 'my-dired-init))

(with-eval-after-load 'dired  (use-package dired-filetype-face))
(deffiletype-face "julia" "#dddddd")
(deffiletype-face-regexp julia :extensions '("julia" "jl"))
(deffiletype-setup "julia")
(deffiletype-face "org" "#454548")
(deffiletype-face-regexp org :extensions '("org" "org"))
(deffiletype-setup "org")
(deffiletype-face "python" "#454454")
(deffiletype-face-regexp python :extensions '("python" "py"))
(deffiletype-setup "python")
(deffiletype-face "cpp" "#32719A")
(deffiletype-face-regexp cpp
  :extensions
  '("c"
    "cpp"
    "f90"
    "f95"))
(deffiletype-setup "cpp")

(with-eval-after-load 'dired  (use-package dired-hide-dotfiles))
(defun my-dired-mode-hook ()
    "My `dired' mode hook."
    ;; To hide dot-files by default
    (dired-hide-dotfiles-mode)
    (setq-local header-line-format nil))
    ;; (dired-hide-details-mode)

  ;; To toggle hiding
  (define-key dired-mode-map "." #'dired-hide-dotfiles-mode)
  (add-hook 'dired-mode-hook #'my-dired-mode-hook)

(provide 'bdired)
