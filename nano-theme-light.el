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
(defun nano-theme-set-light ()
  "Apply light Nano theme base."
  ;; Colors from Material design at https://material.io/



  (setq frame-background-mode    'light)
  (setq nano-color-foreground "#655370")
  (setq nano-color-background "#FAF3F0")
  (setq nano-color-highlight  "#9bd4bf") ;; Very Light Grey
  (setq nano-color-critical   "#cc3c3c") ;; Amber / L900
  (setq nano-color-salient    "#673AB7") ;; Deep Purple / L500
  (setq nano-color-strong     "#6f3104") ;; Black
  (setq nano-color-strong2    "#6f3104") ;; Black
  (setq nano-color-strong3    "#6f3104") ;; Black
  (setq nano-color-strong4    "#43848c") ;; Black
  (setq nano-color-strong5    "#577a8c") ;; Black
  (setq nano-color-popout     "#E97777") ;; Deep Orange / L200
  (setq nano-color-keyword    "#ff0000")
  (setq nano-color-subtle     "#F5EBE0") ;; Blue Grey / L50
  (setq nano-color-current-line "#f3e5de") 
  (setq nano-color-faded      "#66bea1") ;; manjaro light
  (setq nano-color-faded2     "#66bea1") ;; manjaro light
  ;; to allow for toggling of the themes.
  (setq nano-theme-var "light")
  )

(provide 'nano-theme-light)
