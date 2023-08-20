

(setq electric-pair-made t)
(setq show-paren-mode t)



(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time


(setq ivy-mode t)
(setq ivy-rich-mode t)
(setq which-key-mode t)


(setq ivy-height 7)
(setq which-key-idle-delay 1)
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
(setq dashboard-set-footer nil)


(setq window-divider-default-bottom-width 2)
(setq window-divider-default-right-width 6)
(setq window-divider-default-places t)

(provide 'setvar)
