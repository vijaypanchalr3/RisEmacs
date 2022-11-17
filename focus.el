(use-package olivetti
  :init
  ;;(setq olivetti-body-width .110)
  :config
  (defun distraction-free ()
    "Distraction-free writing environment"
    (interactive)
    (if (equal olivetti-mode nil)
        (progn
          (window-configuration-to-register 1)
          (delete-other-windows)
          ;;(text-scale-increase 1)
          ;;(setq visual-fill-column-width 110)
          (visual-fill-column-mode 0)
          (olivetti-mode t)
          (setq olivetti-margin-width 7)
          (flyspell-mode t)
          (set-face-attribute 'default nil :background "#F9F0CB" :foreground "#000000")
          (set-face-attribute 'nano-strong nil :foreground "#000000")
          (set-face-attribute 'cursor nil :background "#2E3440" :foreground "#EBCB8B")
          ;;(goto-char (point-min))
          ;;(org-hide-entry)
          (selectric-mode t)
          (toggle-frame-fullscreen))
      (progn
        (jump-to-register 1)
        ;;(goto-char (point-min))
        ;;(org-show-entry)
        (visual-fill-column-mode t)
        ;; (setq visual-fill-column-width 150)
        (olivetti-mode 0)
        (set-face-attribute 'default nil :background "#000000" :foreground "#ECEFF4")
        (set-face-attribute 'nano-strong nil :foreground "#ECEFF4")
        (set-face-attribute 'cursor nil :background "#EBCB8B" :foreground "#2E3440")
        (toggle-frame-fullscreen)
        (selectric-mode 0)
        ;;(text-scale-decrease 1)
        )))
  :bind
  (("<f7>" . distraction-free)))



(provide 'focus)
