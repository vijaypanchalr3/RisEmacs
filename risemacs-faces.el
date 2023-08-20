;;; nano-faces --- Face settings for nano-emacs
;;; License:
;; ---------------------------------------------------------------------
;; GNU Emacs / N Λ N O - Emacs made simple
;; Copyright (C) 2020 - N Λ N O developers
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.
;; ---------------------------------------------------------------------
;;; Commentary:
;;
;; This file defines the 6 basic nano faces:
;;
;; - nano-face-critical  - nano-face-popout   - nano-face-salient
;; - nano-face-default   - nano-face-faded    - nano-face-subtle
;;
;; Several nano modules require
;;
;; ---------------------------------------------------------------------
;;; Code:

(require 'risemacs-theme-base)



(defcustom risemacs-font-family-monospaced "Jetbrains Mono"
  "Name of the font-family to use for risemacs.
Defaults to Roboto Mono. Customizing this might lead to conflicts
if the family does not have sufficient bold/light etc faces."
  :group 'risemacs
  :type 'string)

(defcustom risemacs-font-family-proportional t
  "Font to use for variable pitch faces.
Setting this allows risemacs to display variable pitch faces when,
for instance, 'variable-pitch-mode' or 'mixed-pitch-mode' is active in a buffer.
Defaults to t."
  :group 'risemacs
  :type 'string)

(defface risemacs-face-variable-pitch nil
  "Default variable-pitch face is used for variable pitch mode."
  :group 'risemacs)

(defcustom risemacs-font-size 12
  "Default value for the font size of risemacs-theme in pt units.
Note: to change this after startup, call
\(risemacs-faces\) and \(risemacs-themes\)."
  :group 'risemacs
  :type 'integer)

;; A theme is fully defined by these seven faces

(defface risemacs-face-default nil
  "Default face is used for regular information."
  :group 'risemacs)

(defface risemacs-face-critical nil
  "Critical face is for information that requires immediate action.
It should be of high constrast when compared to other faces. This
can be realized (for example) by setting an intense background
color, typically a shade of red. It must be used scarcely."
  :group 'risemacs)

(defface risemacs-face-popout nil
  "Popout face is used for information that needs attention.
To achieve such effect, the hue of the face has to be
sufficiently different from other faces such that it attracts
attention through the popout effect."
  :group 'risemacs)

(defface risemacs-face-strong nil
  "Strong face is used for information of a structural nature.
It has to be the same color as the default color and only the
weight differs by one level (e.g., light/regular or
regular/bold). IT is generally used for titles, keywords,
directory, etc."
  :group 'risemacs)

(defface risemacs-face-strong2 nil
  "Strong face is used for information of a structural nature.
It has to be the same color as the default color and only the
weight differs by one level (e.g., light/regular or
regular/bold). IT is generally used for titles, keywords,
directory, etc."
  :group 'risemacs)

(defface risemacs-face-strong3 nil
  "Strong face is used for information of a structural nature.
It has to be the same color as the default color and only the
weight differs by one level (e.g., light/regular or
regular/bold). IT is generally used for titles, keywords,
directory, etc."
  :group 'risemacs)

(defface risemacs-face-strong4 nil
  "Strong face is used for information of a structural nature.
It has to be the same color as the default color and only the
weight differs by one level (e.g., light/regular or
regular/bold). IT is generally used for titles, keywords,
directory, etc."
  :group 'risemacs)

(defface risemacs-face-salient nil
  "Salient face is used for information that are important.
To suggest the information is of the same nature but important,
the face uses a different hue with approximately the same
intensity as the default face. This is typically used for links."
  :group 'risemacs)

(defface risemacs-face-faded nil
  "Faded face is for information that are less important.
It is made by using the same hue as the default but with a lesser
intensity than the default. It can be used for comments,
secondary information and also replace italic (which is generally
abused anyway)."
  :group 'risemacs)



(defface risemacs-face-faded2 nil
  "Faded face is for information that are less important.
It is made by using the same hue as the default but with a lesser
intensity than the default. It can be used for comments,
secondary information and also replace italic (which is generally
abused anyway)."
  :group 'risemacs)

(defface risemacs-face-subtle nil
  "Subtle face is used to suggest a physical area on the screen.
It is important to not disturb too strongly the reading of
information and this can be made by setting a very light
background color that is barely perceptible."
  :group 'risemacs)


(defface risemacs-face-subtle2 nil
  "Subtle face is used to suggest a physical area on the screen.
It is important to not disturb too strongly the reading of
information and this can be made by setting a very light
background color that is barely perceptible."
  :group 'risemacs)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



(defface risemacs-face-header-default nil
  "Default face for ther header line."
  :group 'risemacs)

(defface risemacs-face-header-critical nil
  "Critical face for ther header line."
  :group 'risemacs)

(defface risemacs-face-header-popout nil
  "Popout face for ther header line."
  :group 'risemacs)

(defface risemacs-face-header-strong nil
  "Strong face for ther header line."
  :group 'risemacs)

(defface risemacs-face-header-salient nil
  "Salient face for ther header line."
  :group 'risemacs)

(defface risemacs-face-header-faded nil
  "Faded face for ther header line."
  :group 'risemacs)

(defface risemacs-face-header-subtle nil
  "Subtle face for ther header line."
  :group 'risemacs)

(defface risemacs-face-header-highlight nil
  "Highlight face for ther header line."
  :group 'risemacs)

(defface risemacs-face-header-separator nil
  "Face for separating item in the header line (internal use)"
  :group 'risemacs)

(defface risemacs-face-header-filler nil
  "Face compsenting spaces in the header line (internal use) "
  :group 'risemacs)

(defface risemacs-face-tag-default nil
  "Default face for tags"
  :group 'risemacs)

(defface risemacs-face-tag-faded nil
  "Faded face for tags"
  :group 'risemacs)

(defface risemacs-face-tag-strong nil
  "Strong face for tags"
  :group 'risemacs)

(defface risemacs-face-tag-salient nil
  "Salient face for tags"
  :group 'risemacs)

(defface risemacs-face-tag-popout nil
  "Popout face for tags"
  :group 'risemacs)

(defface risemacs-face-tag-critical nil
  "Critical face for tags"
  :group 'risemacs)

(defun risemacs-what-faces (pos)
  "Get the font faces at POS."
  (interactive "d")
  (let ((faces (remq nil
                     (list
                      (get-char-property pos 'read-face-name)
                      (get-char-property pos 'face)
                      (plist-get (text-properties-at pos) 'face)))))
    (message "Faces: %s" faces)))

(defun risemacs-faces ()
  "Derive face attributes for risemacs-faces using risemacs-theme values."
  (set-face-attribute 'risemacs-face-default nil
                      :foreground risemacs-color-foreground
                      :background risemacs-color-background
                      :family     risemacs-font-family-monospaced
                      :height       (* risemacs-font-size 10))
  (set-face-attribute 'risemacs-face-critical nil
                      :foreground risemacs-color-foreground
                      :background risemacs-color-critical)
  (set-face-attribute 'risemacs-face-popout nil
                      :foreground risemacs-color-popout)

  (set-face-attribute 'risemacs-face-variable-pitch nil
                          :foreground (face-foreground 'risemacs-face-default)
                          :background (face-background 'risemacs-face-default)
                          :family risemacs-font-family-proportional
                          :height (* risemacs-font-size 10))
  (if (display-graphic-p)
      (set-face-attribute 'risemacs-face-strong nil
                          :foreground risemacs-color-strong
                          :weight 'medium)
    (set-face-attribute 'risemacs-face-strong nil
                        :foreground risemacs-color-strong
                        :weight 'bold))

  (set-face-attribute 'risemacs-face-salient nil
                      :foreground risemacs-color-salient
                      :weight 'light)

  (set-face-attribute 'risemacs-face-faded nil
                      :foreground risemacs-color-faded
                      :weight 'light)

  (set-face-attribute 'risemacs-face-subtle nil
                      :background risemacs-color-subtle)

  (set-face-attribute 'risemacs-face-header-default nil
                      :foreground risemacs-color-foreground
                      :background risemacs-color-subtle
                      :box `(:line-width 1
                                         :color ,risemacs-color-background
                                         :style nil))

  (set-face-attribute 'risemacs-face-tag-default nil
                      :foreground risemacs-color-foreground
                      :background risemacs-color-background
                      :weight 'regular
                      :height (if (display-graphic-p)
                                  (round
                                   (* 0.85 (* 10 risemacs-font-size)))
                                                1)
                      :box `(:line-width 1
                                         :color ,risemacs-color-foreground
                                         :style nil))

  (set-face-attribute 'risemacs-face-header-strong nil
                      :foreground risemacs-color-strong
                      :background risemacs-color-subtle
                      :inherit 'risemacs-face-strong
                      :box `(:line-width 1
                                         :color ,risemacs-color-background
                                         :style nil))

  (set-face-attribute 'risemacs-face-tag-strong nil
                      :foreground risemacs-color-strong
                      :background risemacs-color-subtle
                      :weight 'regular
                      :height (if (display-graphic-p)
                                  (round
                                   (* 0.85 (* 10 risemacs-font-size)))
                                                1)
                      :box `(:line-width 1
                                         :color ,risemacs-color-strong
                                         :style nil))

  (set-face-attribute 'risemacs-face-header-salient nil
                      :foreground risemacs-color-background
                      :background risemacs-color-salient
                      :box `(:line-width 1
                                         :color ,risemacs-color-background
                                         :style nil))

  (set-face-attribute 'risemacs-face-tag-salient nil
                      :foreground risemacs-color-background
                      :background risemacs-color-salient
                      :weight 'regular
                      :height (if (display-graphic-p)
                                  (round
                                   (* 0.85 (* 10 risemacs-font-size)))
                                                1)
                      :box `(:line-width 1
                                         :color ,risemacs-color-salient
                                         :style nil))

  (set-face-attribute 'risemacs-face-header-popout nil
                      :foreground risemacs-color-background
                      :background risemacs-color-popout
                      :box `(:line-width 1
                                         :color ,risemacs-color-background
                                         :style nil))

  (set-face-attribute 'risemacs-face-tag-popout nil
                      :foreground risemacs-color-background
                      :background risemacs-color-popout
                      :weight 'regular
                      :height (if (display-graphic-p)
                                  (round
                                   (* 0.85 (* 10 risemacs-font-size)))
                                                1)
                      :box `(:line-width 1
                                         :color ,risemacs-color-popout
                                         :style nil))

  (set-face-attribute 'risemacs-face-header-faded nil
                      :foreground risemacs-color-background
                      :background risemacs-color-faded
                      :box `(:line-width 1
                                         :color ,risemacs-color-background
                                         :style nil))

  (set-face-attribute 'risemacs-face-tag-faded nil
                      :foreground risemacs-color-background
                      :background risemacs-color-faded
                      :weight 'regular
                      :height (if (display-graphic-p)
                                  (round
                                   (* 0.85 (* 10 risemacs-font-size)))
                                                1)
                      :box `(:line-width 1
                                         :color ,risemacs-color-faded
                                         :style nil))

  (set-face-attribute 'risemacs-face-header-subtle nil)

  (set-face-attribute 'risemacs-face-header-critical nil
                      :foreground risemacs-color-background
                      :background risemacs-color-critical
                      :box `(:line-width 1
                                         :color ,risemacs-color-background
                                         :style nil))
  (set-face-attribute 'risemacs-face-tag-critical nil
                      :foreground risemacs-color-background
                      :background risemacs-color-critical
                      :weight 'regular
                      :height (if (display-graphic-p)
                                  (round
                                   (* 0.85 (* 10 risemacs-font-size)))
                                                1)
                      :box `(:line-width 1
                                         :color ,risemacs-color-critical
                                         :style nil))

  (set-face-attribute 'risemacs-face-header-separator nil
                      :inherit 'risemacs-face-default
                      :height 0.1)
  (set-face-attribute 'risemacs-face-header-filler nil
                      :inherit 'risemacs-face-header-default
                      :height 0.1)
  (set-face-attribute 'risemacs-face-header-highlight nil
                      :inherit 'risemacs-face-header-faded
                      :box nil))

(provide 'risemacs-faces)
