(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; vterm keybinds  
(global-set-key (kbd "M-RET") 'vterm-toggle)
(global-set-key [C-f2] 'vterm-toggle-cd)
;; vterm bindings end
(global-set-key [f6] 'calc)
(global-set-key [f5] 'dashboard-refresh-buffer)
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "M-p") 'flyspell-correct-at-point)
(global-set-key (kbd "M-P") 'flyspell-mode)
(global-set-key (kbd "C-x k") 'kill-this-buffer)
(global-set-key (kbd "C-x d") 'dired-jump)
(global-set-key (kbd "C-x D") 'dired)

(global-set-key (kbd "C-)") 'display-line-numbers-mode)
;; (global-set-key (kbd "C-(") 'hide-mode-line-mode)
;; (global-unset-key (kbd "C-n"))
;; (global-unset-key (kbd "C-p"))
;; (global-unset-key (kbd "C-f"))
;; (global-unset-key (kbd "C-b"))
;; (global-unset-key (kbd "C-h"))
;; (global-unset-key (kbd "C-j"))
;; (global-unset-key (kbd "C-k"))
;; (global-unset-key (kbd "C-l"))
;; (global-set-key (kbd "C-n") 'electric-newline-and-maybe-indent)
;; (global-set-key (kbd "C-f") 'kill-line)
;; (global-set-key (kbd "C-h") 'backward-char)
;; (global-set-key (kbd "C-l") 'forward-char)
;; (global-set-key (kbd "C-j") 'next-line)
(global-set-key (kbd "C-x t") 'nano-toggle-theme)
(global-set-key [(ctrl shift k)] 'crux-duplicate-current-line-or-region)
(global-set-key [(ctrl =)] 'crux-smart-open-line-above)
;;(global-set-key (kbd "<kp-enter>") 'smart-enter)
(global-set-key [(meta shift up)]  'move-line-up)
(global-set-key [(meta shift down)]  'move-line-down)
(global-set-key (kbd "C-<tab>")  'crux-indent-defun)
(global-set-key (kbd "C-x K") 'crux-kill-other-buffers)











(provide 'keymaps)
