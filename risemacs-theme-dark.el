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
(require 'risemacs-theme-base)

(defun risemacs-theme-set-dark ()
  "Apply dark Risemacs theme base."
  ;; Colors from Nord theme at https://www.nordtheme.com
  (setq frame-background-mode     'dark)
  (setq risemacs-color-foreground "#ECEFF4") ;; Snow Storm 3  / nord  6
  (setq risemacs-color-background "#000000") ;; Polar Night 0 / nord  0
  (setq risemacs-color-highlight  "#3B4252") ;; Polar Night 1 / nord  1
  (setq risemacs-color-critical   "#EBCB8B") ;; Aurora        / nord 11
  (setq risemacs-color-salient    "#81A1C1") ;; Frost         / nord  9
  (setq risemacs-color-strong     "#b6fff2") ;; Snow Storm 3  / nord  6
  (setq risemacs-color-strong2     "#abf0e3") ;; Snow Storm 3  / nord  6
  (setq risemacs-color-strong3     "#a1e3d6") ;; Snow Storm 3  / nord  6
  (setq risemacs-color-strong4     "#96d4c8") ;; Snow Storm 3  / nord  6
  (setq risemacs-color-popout     "#D08770") ;; Aurora        / nord 12
  (setq risemacs-color-subtle     "#434C5E") ;; Polar Night 2 / nord  2
  (setq risemacs-color-subtle2     "#5f6b85") ;; Polar Night 2 / nord  2
  (setq risemacs-color-faded      "#677691") ;;
  (setq risemacs-color-faded2      "#7283a1") ;;
  to allow for toggling of the themes.
  (setq risemacs-theme-var "dark")
  )

(provide 'risemacs-theme-dark)
