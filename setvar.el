

(electric-pair-mode 1)
(show-paren-mode 1)



(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time


(counsel-mode 1)
(ivy-mode 1)
(setq ivy-height 7)
(ivy-rich-mode 1)
(ivy-prescient-mode 1)

(which-key-mode 1)
(setq which-key-idle-delay 1)


;; (setq initial-scratch-message "RisEmacs")
(setq dashboard-startup-banner "~/RisEmacs/logo.png")
(setq dashboard-banner-logo-title nil)
(setq dashboard-center-content t)
(setq dashboard-show-shortcuts t)
(setq dashboard-items '((recents  . 10)
			(bookmarks . 10)))
(setq dashboard-set-heading-icons nil)
(setq dashboard-set-file-icons nil)
(setq dashboard-set-navigator t)
(setq dashboard-set-footer nil)


(setq window-divider-default-bottom-width 2)
(setq window-divider-default-right-width 6)
(setq window-divider-default-places t)




(cond
 ((member "-default" command-line-args) t)
 ((member "-dark" command-line-args) (nano-theme-set-light))
 (t (nano-theme-set-dark)))
(call-interactively 'nano-refresh-theme)


(provide 'setvar)
