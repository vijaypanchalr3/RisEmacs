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
;;
;; Defines the 9 basic colors of the nano theme.
;; The default values are loaded from well-known faces of Emacs.
;;
;; To change nano's appearance you therefore may:
;; - Load any Emacs theme before loading nano to change the appearance
;; - Load one of the few nano themes after this file. This will result inactive
;;   the best experience.
;; - Set your own colors by customizing nano group
;;
;; ---------------------------------------------------------------------

(defgroup nano '()
  "Faces and colors for the nano emacs theme")

;; Derive our default color set from classic Emacs faces.
;; This allows dropping nano components into already themed Emacsen with varying
;; degrees of visual appeal.
;;
;; We memorize the default colorset in this var in order not to confuse
;; customize: the STANDARD argument of defcustom gets re-evaluated by customize
;; to determine if the current value is default or not.
(defvar nano-base-colors--defaults
  `((foreground . ,(face-foreground 'default nil t))
    (background . ,(face-background 'default nil t))
    (highlight . ,(face-background 'fringe nil t))
    (critical . ,(face-foreground 'error nil t))
    (salient . ,(face-foreground 'font-lock-keyword-face nil t))
    (strong . ,(face-foreground 'default nil t))
    (popout . ,(face-foreground 'font-lock-string-face nil t))
    (subtle . ,(face-background 'mode-line-inactive nil t))
    (faded . ,(face-foreground 'shadow nil t))))

(defun nano-base-colors--get (name)
  "Get default color associated with symbol NAME."
  (cdr (assoc name nano-base-colors--defaults)))

(defcustom nano-color-foreground (nano-base-colors--get 'foreground)
  ""
  :type 'color
  :group 'nano)

(defcustom nano-color-background (nano-base-colors--get 'background)
  ""
  :type 'color
  :group 'nano)

(defcustom nano-color-highlight (nano-base-colors--get 'highlight)
  ""
  :type 'color
  :group 'nano)

(defcustom nano-color-critical (nano-base-colors--get 'critical)
  ""
  :type 'color
  :group 'nano)

(defcustom nano-color-salient (nano-base-colors--get 'salient)
  ""
  :type 'color
  :group 'nano)

(defcustom nano-color-strong (nano-base-colors--get 'strong)
  ""
  :type 'color
  :group 'nano)
(defcustom nano-color-strong2 (nano-base-colors--get 'strong)
  ""
  :type 'color
  :group 'nano)
(defcustom nano-color-strong3 (nano-base-colors--get 'strong)
  ""
  :type 'color
  :group 'nano)
(defcustom nano-color-strong4 (nano-base-colors--get 'strong)
  ""
  :type 'color
  :group 'nano)
(defcustom nano-color-strong5 (nano-base-colors--get 'strong)
  ""
  :type 'color
  :group 'nano)
(defcustom nano-color-popout (nano-base-colors--get 'popout)
  ""
  :type 'color
  :group 'nano)

(defcustom nano-color-subtle (nano-base-colors--get 'subtle)
  ""
  :type 'color
  :group 'nano)

(defcustom nano-color-faded (nano-base-colors--get 'faded)
  ""
  :type 'color
  :group 'nano)
(defcustom nano-color-faded2 (nano-base-colors--get 'faded)
  ""
  :type 'color
  :group 'nano)
(defcustom nano-font-family-monospaced "Jetbrains Mono"
  "Name of the font-family to use for nano.
Defaults to Roboto Mono. Customizing this might lead to conflicts
if the family does not have sufficient bold/light etc faces."
  :group 'nano
  :type 'string)

(defcustom nano-font-family-proportional nil
  "Font to use for variable pitch faces.
Setting this allows nano to display variable pitch faces when,
for instance, 'variable-pitch-mode' or 'mixed-pitch-mode' is active in a buffer.
Defaults to nil."
  :group 'nano
  :type 'string)

(defcustom nano-font-size 12
  "Default value for the font size of nano-theme in pt units.
Note: to change this after startup, call
\(nano-faces\) and \(nano-themes\)."
  :group 'nano
  :type 'integer)

;; A theme is fully defined by these seven faces

(defface nano-face-default nil
  "Default face is used for regular information."
  :group 'nano)

(defface nano-face-variable-pitch nil
  "Default variable-pitch face is used for variable pitch mode."
  :group 'nano)

(defface nano-face-critical nil
  "Critical face is for information that requires immediate action.
It should be of high constrast when compared to other faces. This
can be realized (for example) by setting an intense background
color, typically a shade of red. It must be used scarcely."
  :group 'nano)

(defface nano-face-popout nil
  "Popout face is used for information that needs attention.
To achieve such effect, the hue of the face has to be
sufficiently different from other faces such that it attracts
attention through the popout effect."
  :group 'nano)

(defface nano-face-strong nil
  "Strong face is used for information of a structural nature.
It has to be the same color as the default color and only the
weight differs by one level (e.g., light/regular or
regular/bold). IT is generally used for titles, keywords,
directory, etc."
  :group 'nano)

(defface nano-face-strong2 nil
  "Strong face is used for information of a structural nature.
It has to be the same color as the default color and only the
weight differs by one level (e.g., light/regular or
regular/bold). IT is generally used for titles, keywords,
directory, etc."
  :group 'nano)
(defface nano-face-strong3 nil
  "Strong face is used for information of a structural nature.
It has to be the same color as the default color and only the
weight differs by one level (e.g., light/regular or
regular/bold). IT is generally used for titles, keywords,
directory, etc."
  :group 'nano)
(defface nano-face-strong4 nil
  "Strong face is used for information of a structural nature.
It has to be the same color as the default color and only the
weight differs by one level (e.g., light/regular or
regular/bold). IT is generally used for titles, keywords,
directory, etc."
  :group 'nano)
(defface nano-face-strong5 nil
  "Strong face is used for information of a structural nature.
It has to be the same color as the default color and only the
weight differs by one level (e.g., light/regular or
regular/bold). IT is generally used for titles, keywords,
directory, etc."
  :group 'nano)



(defface nano-face-salient nil
  "Salient face is used for information that are important.
To suggest the information is of the same nature but important,
the face uses a different hue with approximately the same
intensity as the default face. This is typically used for links."
  :group 'nano)

(defface nano-face-faded nil
  "Faded face is for information that are less important.
It is made by using the same hue as the default but with a lesser
intensity than the default. It can be used for comments,
secondary information and also replace italic (which is generally
abused anyway)."
  :group 'nano)
(defface nano-face-faded2 nil
  "Faded face is for information that are less important.
It is made by using the same hue as the default but with a lesser
intensity than the default. It can be used for comments,
secondary information and also replace italic (which is generally
abused anyway)."
  :group 'nano)

(defface nano-face-subtle nil
  "Subtle face is used to suggest a physical area on the screen.
It is important to not disturb too strongly the reading of
information and this can be made by setting a very light
background color that is barely perceptible."
  :group 'nano)

(defface nano-face-header-default nil
  "Default face for ther header line."
  :group 'nano)

(defface nano-face-header-critical nil
  "Critical face for ther header line."
  :group 'nano)

(defface nano-face-header-popout nil
  "Popout face for ther header line."
  :group 'nano)

(defface nano-face-header-strong nil
  "Strong face for ther header line."
  :group 'nano)

(defface nano-face-header-salient nil
  "Salient face for ther header line."
  :group 'nano)

(defface nano-face-header-faded nil
  "Faded face for ther header line."
  :group 'nano)

(defface nano-face-header-subtle nil
  "Subtle face for ther header line."
  :group 'nano)

(defface nano-face-header-highlight nil
  "Highlight face for ther header line."
  :group 'nano)

(defface nano-face-header-separator nil
  "Face for separating item in the header line (internal use)"
  :group 'nano)

(defface nano-face-header-filler nil
  "Face compsenting spaces in the header line (internal use) "
  :group 'nano)

(defface nano-face-tag-default nil
  "Default face for tags"
  :group 'nano)

(defface nano-face-tag-faded nil
  "Faded face for tags"
  :group 'nano)

(defface nano-face-tag-strong nil
  "Strong face for tags"
  :group 'nano)

(defface nano-face-tag-salient nil
  "Salient face for tags"
  :group 'nano)

(defface nano-face-tag-popout nil
  "Popout face for tags"
  :group 'nano)

(defface nano-face-tag-critical nil
  "Critical face for tags"
  :group 'nano)

(defun nano-what-faces (pos)
  "Get the font faces at POS."
  (interactive "d")
  (let ((faces (remq nil
                     (list
                      (get-char-property pos 'read-face-name)
                      (get-char-property pos 'face)
                      (plist-get (text-properties-at pos) 'face)))))
    (message "Faces: %s" faces)))

(provide 'nano-base-colors)
