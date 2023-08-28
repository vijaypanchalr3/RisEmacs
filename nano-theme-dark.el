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
(require 'nano-base-colors)

(defun nano-theme-set-dark ()
  "Apply dark Nano theme base."
  (setq frame-background-mode     'dark)
  (setq nano-color-foreground "#ECEFF4")
  (setq nano-color-background "#0c0f17")
  (setq nano-color-highlight  "#2d2d2d")
  (setq nano-color-critical   "#EBCB8B")
  (setq nano-color-salient    "#81A1C1")
  (setq nano-color-strong     "#eab65e")
  (setq nano-color-strong2     "#eab65e")
  (setq nano-color-strong3     "#eab65e")
  (setq nano-color-strong4     "#eab65e")
  (setq nano-color-strong5     "#eab65e")
  (setq nano-color-popout      "#00cdb4")
  (setq nano-color-subtle     "#383838") 
  (setq nano-color-faded      "#005756")
  (setq nano-color-faded2      "#2df8de")
  ;; to allow for toggling of the themes.
  (setq nano-theme-var "dark"))

(provide 'nano-theme-dark)
