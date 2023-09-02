(require 'nano-base-colors)

(defun nano-faces ()
  "Derive face attributes for nano-faces using nano-theme values."
  (set-face-attribute 'nano-face-default nil
                      :foreground nano-color-foreground
                      :background nano-color-background
                      :family     nano-font-family-monospaced
                      :height       (* nano-font-size 10))
  (set-face-attribute 'nano-face-critical nil :foreground nano-color-foreground :background nano-color-critical)
  (set-face-attribute 'nano-face-popout nil
                      :foreground nano-color-popout)

  (set-face-attribute 'nano-face-variable-pitch nil
                      :foreground (face-foreground 'nano-face-default)
                      :background (face-background 'nano-face-default)
                      :family "ETBembo"
                      :height (* nano-font-size 14))
  (if (display-graphic-p)
      (set-face-attribute 'nano-face-strong nil
                          :foreground nano-color-strong
                          :weight 'medium)
    (set-face-attribute 'nano-face-strong2 nil
                        :foreground nano-color-strong
                        :weight 'medium)
    (set-face-attribute 'nano-face-strong3 nil
                        :foreground nano-color-strong
                        :weight 'medium)
    (set-face-attribute 'nano-face-strong4 nil
                        :foreground nano-color-strong
                        :weight 'medium)
    (set-face-attribute 'nano-face-strong5 nil
                        :foreground nano-color-strong
                        :weight 'medium))
  (set-face-attribute 'nano-face-strong nil
                      :foreground nano-color-strong
                      :weight 'bold)
  (set-face-attribute 'nano-face-strong2 nil
                      :foreground nano-color-strong2
                      :weight 'bold
		      :height (if (display-graphic-p)
                                  (round
                                   (* 2 (* 10 nano-font-size)))
                                1))
  (set-face-attribute 'nano-face-strong3 nil
                      :foreground nano-color-strong3
                      :weight 'bold
		      :height (if (display-graphic-p)
                                  (round
                                   (* 1.8 (* 10 nano-font-size)))
                                1))
  (set-face-attribute 'nano-face-strong4 nil
                      :foreground nano-color-strong4
                      :weight 'bold
		      :height (if (display-graphic-p)
                                  (round
                                   (* 1.6 (* 10 nano-font-size)))
                                1))
  (set-face-attribute 'nano-face-strong5 nil
                      :foreground nano-color-strong5
                      :weight 'bold
		      :height (if (display-graphic-p)
                                  (round
                                   (* 1.5 (* 10 nano-font-size)))
                                1))
  (set-face-attribute 'nano-face-salient nil
                      :foreground nano-color-salient
                      :weight 'light)

  (set-face-attribute 'nano-face-faded nil
                      :foreground nano-color-faded
                      :weight 'light)

  (set-face-attribute 'nano-face-faded2 nil
                      :foreground nano-color-faded
                      :weight 'light
		      :height (* nano-font-size 12))

  (set-face-attribute 'nano-face-subtle nil
                      :background nano-color-subtle)
  (set-face-attribute 'nano-face-highlight-region nil
                      :background nano-color-highlight)
  (set-face-attribute 'nano-face-current-line nil
                      :background nano-color-current-line)

  (set-face-attribute 'nano-face-header-default nil
                      :foreground nano-color-foreground
                      :background nano-color-subtle
                      :box `(:line-width 1
                                         :color ,nano-color-background
                                         :style nil))

  (set-face-attribute 'nano-face-tag-default nil
                      :foreground nano-color-foreground
                      :background nano-color-background
                      :weight 'regular
                      :height (if (display-graphic-p)
                                  (round
                                   (* 0.85 (* 10 nano-font-size)))
                                1)
                      :box `(:line-width 1
                                         :color ,nano-color-foreground
                                         :style nil))

  (set-face-attribute 'nano-face-header-strong nil
                      :foreground nano-color-strong
                      :background nano-color-subtle
                      :inherit 'nano-face-strong
                      :box `(:line-width 1
                                         :color ,nano-color-background
                                         :style nil))

  (set-face-attribute 'nano-face-tag-strong nil
                      :foreground nano-color-strong
                      :background nano-color-subtle
                      :weight 'regular
                      :height (if (display-graphic-p)
                                  (round
                                   (* 0.85 (* 10 nano-font-size)))
                                1)
                      :box `(:line-width 1
                                         :color ,nano-color-strong
                                         :style nil))

  (set-face-attribute 'nano-face-header-salient nil
                      :foreground nano-color-background
                      :background nano-color-salient
                      :box `(:line-width 1
                                         :color ,nano-color-background
                                         :style nil))

  (set-face-attribute 'nano-face-tag-salient nil
                      :foreground nano-color-background
                      :background nano-color-salient
                      :weight 'regular
                      :height (if (display-graphic-p)
                                  (round
                                   (* 0.85 (* 10 nano-font-size)))
                                1)
                      :box `(:line-width 1
                                         :color ,nano-color-salient
                                         :style nil))

  (set-face-attribute 'nano-face-header-popout nil
                      :foreground nano-color-background
                      :background nano-color-popout
                      :box `(:line-width 1
                                         :color ,nano-color-background
                                         :style nil))

  (set-face-attribute 'nano-face-tag-popout nil
                      :foreground nano-color-background
                      :background nano-color-popout
                      :weight 'regular
                      :height (if (display-graphic-p)
                                  (round
                                   (* 0.85 (* 10 nano-font-size)))
                                1)
                      :box `(:line-width 1
                                         :color ,nano-color-popout
                                         :style nil))

  (set-face-attribute 'nano-face-header-faded nil
                      :foreground nano-color-background
                      :background nano-color-faded
                      :box `(:line-width 1
                                         :color ,nano-color-background
                                         :style nil))

  (set-face-attribute 'nano-face-tag-faded nil
                      :foreground nano-color-background
                      :background nano-color-faded
                      :weight 'regular
                      :height (if (display-graphic-p)
                                  (round
                                   (* 0.85 (* 10 nano-font-size)))
                                1)
                      :box `(:line-width 1
                                         :color ,nano-color-faded
                                         :style nil))

  (set-face-attribute 'nano-face-header-subtle nil)

  (set-face-attribute 'nano-face-header-critical nil
                      :foreground nano-color-background
                      :background nano-color-critical
                      :box `(:line-width 1
                                         :color ,nano-color-background
                                         :style nil))
  (set-face-attribute 'nano-face-tag-critical nil
                      :foreground nano-color-background
                      :background nano-color-critical
                      :weight 'regular
                      :height (if (display-graphic-p)
                                  (round
                                   (* 0.85 (* 10 nano-font-size)))
                                1)
                      :box `(:line-width 1
                                         :color ,nano-color-critical
                                         :style nil))

  (set-face-attribute 'nano-face-header-separator nil
                      :inherit 'nano-face-default
                      :height 0.5)
  (set-face-attribute 'nano-face-header-filler nil
                      :inherit 'nano-face-header-default
                      :height 0.5)
  (set-face-attribute 'nano-face-header-highlight nil
                      :inherit 'nano-face-header-faded
                      :box nil))

(provide 'nano-faces)
;;; nano-faces.el ends here
