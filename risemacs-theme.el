(require 'risemacs-faces)

(defcustom risemacs-theme-var nil
  "Variable which sets the default startup theme as light or dark.
Also allows for toggling of the themes. Is set to 'light' by
'risemacs-theme-light' and 'dark' by 'risemacs-theme-dark'.
Defaults to nil."
  :group 'risemacs
  :type 'string)

;; When we set a face, we take care of removing any previous settings
(defun set-face (face style)
  "Reset FACE and make it inherit STYLE."
  (if (facep face)
      (set-face-attribute face nil
                          :foreground 'unspecified :background 'unspecified
                          :family     'unspecified :slant      'unspecified
                          :weight     'unspecified :height     'unspecified
                          :underline  'unspecified :overline   'unspecified
                          :box        'unspecified :inherit    style)
    (message "RISEMACS Warning: Face %s could not be set. It may not be defined."
             face)))
  


(defun risemacs-theme--basics ()
  "Derive basic Emacs faces from risemacs-faces and risemacs-color-theme."

  (set-foreground-color risemacs-color-foreground)
  (set-background-color risemacs-color-background)

  ;; XXX the following seems to be a no-op, should it be removed?
  (set-face-attribute 'default nil
                      :foreground (face-foreground 'default)
                      :background (face-background 'default)
                      :weight     'light
                      :family     (face-attribute 'risemacs-face-default :family)
                      :height     (face-attribute 'risemacs-face-default :height))

  (if (display-graphic-p)
      (set-face-attribute 'bold nil :weight 'regular)
    (set-face-attribute 'bold nil :weight 'bold))

  ;; Structural
  (set-face 'bold                                     'risemacs-face-strong)
  (set-face 'italic                                    'risemacs-face-faded)
  (set-face 'bold-italic                              'risemacs-face-strong)
  (set-face 'region                                   'risemacs-face-subtle)
  (set-face 'highlight                                'risemacs-face-subtle)
  ;;(set-face 'fixed-pitch                                     'default)
  (set-face 'fixed-pitch-serif                       'risemacs-face-default)
  (set-face 'cursor                                  'risemacs-face-default)
  (if 'risemacs-font-family-proportional
      (set-face-attribute 'variable-pitch nil ;; to work with mixed-pitch
                :foreground (face-foreground 'default)
                :background (face-background 'default)
                :family     (face-attribute 'risemacs-face-variable-pitch :family)
                :height     (face-attribute 'risemacs-face-variable-pitch :height))
      (set-face 'variable-pitch                     'risemacs-face-default))

  (set-face-attribute 'cursor nil
                      :background (face-foreground 'risemacs-face-default))
  (set-face-attribute 'window-divider nil
                      :foreground (face-background 'risemacs-face-default))
  (set-face-attribute 'window-divider-first-pixel nil
                      :foreground risemacs-color-background)
  ;;                  :foreground (face-background 'risemacs-face-subtle))
  (set-face-attribute 'window-divider-last-pixel nil
                      :foreground risemacs-color-background)
  ;;                  :foreground (face-background 'risemacs-face-subtle)))
  (set-face-foreground 'vertical-border risemacs-color-subtle)

  ;; Semantic
  (set-face 'shadow                                    'risemacs-face-faded)
  (set-face 'success                                 'risemacs-face-salient)
  (set-face 'warning                                  'risemacs-face-popout)
  (set-face 'error                                  'risemacs-face-critical)
  (set-face 'match                                    'risemacs-face-popout)

  ;; General
  (set-face 'buffer-menu-buffer                       'risemacs-face-strong)
  (set-face 'minibuffer-prompt                        'risemacs-face-strong)
  (set-face 'link                                    'risemacs-face-salient)
  (set-face 'fringe                                    'risemacs-face-faded)
  (set-face-attribute 'fringe nil
                      :foreground (face-background 'risemacs-face-subtle)
                      :background (face-background 'default))
  (set-face 'isearch                                  'risemacs-face-strong)
  (set-face 'isearch-fail                              'risemacs-face-faded)
  (set-face 'lazy-highlight                           'risemacs-face-subtle)
  (set-face 'trailing-whitespace                      'risemacs-face-subtle)
  (set-face 'show-paren-match                         'risemacs-face-popout)
  (set-face 'show-paren-mismatch                           'face-normal)
  (set-face-attribute 'tooltip nil                         :height 0.85)
  (set-face 'secondary-selection                      'risemacs-face-subtle)
  (set-face 'completions-common-part                   'risemacs-face-faded)
  (set-face 'completions-first-difference            'risemacs-face-default))
(defun risemacs-theme--font-lock ()
  "Derive font-lock faces from risemacs-faces."
  (set-face 'font-lock-comment-face                    'risemacs-face-faded)
  (set-face 'font-lock-doc-face                        'risemacs-face-faded)
  (set-face 'font-lock-string-face                    'risemacs-face-popout)
  (set-face 'font-lock-constant-face                 'risemacs-face-salient)
  (set-face 'font-lock-warning-face                   'risemacs-face-popout)
  (set-face 'font-lock-function-name-face             'risemacs-face-strong)
  (set-face 'font-lock-variable-name-face             'risemacs-face-strong)
  (set-face 'font-lock-builtin-face                  'risemacs-face-salient)
  (set-face 'font-lock-type-face                     'risemacs-face-salient)
  (set-face 'font-lock-keyword-face                  'risemacs-face-salient))


(defun risemacs-theme--mode-line ()
  "Derive mode-line and header-line faces from risemacs-faces."
  (set-face-attribute 'mode-line nil
                      :height 0.1
                      :foreground (if (display-graphic-p)
                                      (face-background 'risemacs-face-default)
                                    (face-foreground 'risemacs-face-default))
                      :background (face-background 'risemacs-face-default)
                      :underline  (if (display-graphic-p)
                                      (face-background 'risemacs-face-subtle)
                                    t)
                      :overline nil
                      :box nil)
  (set-face-attribute 'mode-line-inactive nil
                      :height 0.1
                      :foreground (if (display-graphic-p)
                                      (face-background 'risemacs-face-default)
                                    (face-foreground 'risemacs-face-default))
                      :background (face-background 'risemacs-face-default)
                      :underline (if (display-graphic-p)
                                     (face-background 'risemacs-face-subtle)
                                   t)
                      :overline nil
                      :inherit nil
                      :box nil)
  
  ;;(when (display-graphic-p)
  (set-face-attribute 'header-line nil
                       :weight 'light
                       :foreground (face-foreground 'risemacs-face-default)
                       :background (face-background 'risemacs-face-default)

                       :overline nil
                       :underline nil
                       :box nil
                       :box `(:line-width 1
                                          :color ,(face-background 'risemacs-face-default)
                                          :style nil)
                       :inherit nil)

  ;; (when (not (display-graphic-p))
  ;;   (set-face-attribute 'header-line nil
  ;;                    :weight 'light
  ;;                       :foreground (face-foreground 'risemacs-face-default)
  ;;                       :background (face-background 'risemacs-face-subtle)
  ;;                       :inverse-video t
  ;;                       :overline nil
  ;;                       :underline nil
  ;;                       :box nil
  ;;                            :inherit nil))

  ;; (set-face-attribute 'internal-border nil
  ;;                     :background (face-foreground 'risemacs-face-default))

  (set-face-attribute 'internal-border nil
                       :background (face-background 'risemacs-face-default)))


(defun risemacs-theme--minibuffer ()
  "Derive minibuffer / echo area faces from risemacs faces."
  ;; Minibuffer / echo area
  (dolist (buffer (list " *Minibuf-0*" " *Echo Area 0*"
                        " *Minibuf-1*" " *Echo Area 1*"))
    (when (get-buffer buffer)
      (with-current-buffer buffer
        (face-remap-add-relative 'default 'risemacs-face-faded)))))


(defun risemacs-theme--hl-line ()
  "Derive hl-line faces from risemacs faces."
  (with-eval-after-load 'hl-line
    (set-face-attribute 'hl-line nil
                         :background risemacs-color-highlight)))



(defun risemacs-theme--buttons ()
  "Derive button faces from risemacs faces."
  ;; Buttons
  (with-eval-after-load 'cus-edit
    (set-face-attribute 'custom-button nil
                         :foreground (face-foreground 'risemacs-face-faded)
                         :background (face-background 'risemacs-face-default)
                         :box `(:line-width 1
                                :color ,(face-foreground 'risemacs-face-faded)
                                :style nil))
    (set-face-attribute 'custom-button-mouse nil
                         ;;                      :inherit 'custom-button
                         :foreground (face-foreground 'risemacs-face-faded)
                         :background (face-background 'risemacs-face-subtle)
                         :box `(:line-width 1
                                            :color ,(face-foreground 'risemacs-face-faded)
                                            :style nil))
    (set-face-attribute 'custom-button-pressed nil
                         :foreground (face-background 'default)
                         :background (face-foreground 'risemacs-face-salient)
                         :inherit 'risemacs-face-salient
                         :box `(:line-width 1
                                            :color ,(face-foreground 'risemacs-face-salient)
                                            :style nil)
                         :inverse-video nil)))


(defun risemacs-theme--info ()
  "Derive info faces from risemacs faces."
  (with-eval-after-load 'info
    (set-face 'info-menu-header                       'risemacs-face-strong)
    (set-face 'info-header-node                      'risemacs-face-default)
    (set-face 'info-index-match                      'risemacs-face-salient)
    (set-face 'Info-quoted                             'risemacs-face-faded)
    (set-face 'info-title-1                           'risemacs-face-strong)
    (set-face 'info-title-2                           'risemacs-face-strong)
    (set-face 'info-title-3                           'risemacs-face-strong)
    (set-face 'info-title-4                           'risemacs-face-strong)))


(defun risemacs-theme--speedbar ()
  "Derive speedbar faces from risemacs faces "
  (with-eval-after-load 'speedbar
    (set-face 'speedbar-button-face                    'risemacs-face-faded)
    (set-face 'speedbar-directory-face                'risemacs-face-strong)
    (set-face 'speedbar-file-face                    'risemacs-face-default)
    (set-face 'speedbar-highlight-face             'risemacs-face-highlight)
    (set-face 'speedbar-selected-face                 'risemacs-face-subtle)
    (set-face 'speedbar-separator-face                 'risemacs-face-faded)
    (set-face 'speedbar-tag-face                       'risemacs-face-faded)))


(defun risemacs-theme--bookmark ()
  "Derive bookmark faces from risemacs faces."
  (with-eval-after-load 'bookmark
    (set-face 'bookmark-menu-heading                  'risemacs-face-strong)
    (set-face 'bookmark-menu-bookmark                'risemacs-face-salient)))


(defun risemacs-theme--message ()
  "Derive message faces from risemacs faces."
  (with-eval-after-load 'message
    (unless (version< emacs-version "27.0")
      (set-face 'message-cited-text-1                  'risemacs-face-faded)
      (set-face 'message-cited-text-2                  'risemacs-face-faded)
      (set-face 'message-cited-text-3                  'risemacs-face-faded)
      (set-face 'message-cited-text-4                 'risemacs-face-faded))
    (set-face 'message-cited-text                      'risemacs-face-faded)
    (set-face 'message-header-cc                     'risemacs-face-default)
    (set-face 'message-header-name                    'risemacs-face-strong)
    (set-face 'message-header-newsgroups             'risemacs-face-default)
    (set-face 'message-header-other                  'risemacs-face-default)
    (set-face 'message-header-subject                'risemacs-face-salient)
    (set-face 'message-header-to                     'risemacs-face-salient)
    (set-face 'message-header-xheader                'risemacs-face-default)
    (set-face 'message-mml                            'risemacs-face-popout)
    (set-face 'message-separator                       'risemacs-face-faded)))


(defun risemacs-theme--outline ()
  "Derive outline faces from risemacs faces."
  (with-eval-after-load 'outline
    (set-face 'outline-1                              'risemacs-face-strong)
    (set-face 'outline-2                              'risemacs-face-strong)
    (set-face 'outline-3                              'risemacs-face-strong)
    (set-face 'outline-4                              'risemacs-face-strong)
    (set-face 'outline-5                              'risemacs-face-strong)
    (set-face 'outline-6                              'risemacs-face-strong)
    (set-face 'outline-7                              'risemacs-face-strong)
    (set-face 'outline-8                              'risemacs-face-strong)))


(defun risemacs-theme--customize ()
  "Derive customize faces from risemacs faces."
  (with-eval-after-load 'cus-edit
    (set-face 'widget-field                           'risemacs-face-subtle)
    (set-face 'widget-button                          'risemacs-face-strong)
    (set-face 'widget-single-line-field               'risemacs-face-subtle)
    (set-face 'custom-group-subtitle                  'risemacs-face-strong)
    (set-face 'custom-group-tag                       'risemacs-face-strong)
    (set-face 'custom-group-tag-1                     'risemacs-face-strong)
    (set-face 'custom-comment                          'risemacs-face-faded)
    (set-face 'custom-comment-tag                      'risemacs-face-faded)
    (set-face 'custom-changed                        'risemacs-face-salient)
    (set-face 'custom-modified                       'risemacs-face-salient)
    (set-face 'custom-face-tag                        'risemacs-face-strong)
    (set-face 'custom-variable-tag                    'risemacs-face-strong)
    (set-face 'custom-invalid                         'risemacs-face-popout)
    (set-face 'custom-visibility                     'risemacs-face-salient)
    (set-face 'custom-state                          'risemacs-face-salient)
    (set-face 'custom-link                           'risemacs-face-salient)))

(defun risemacs-theme--package ()
  "Derive package faces from risemacs faces."
  (with-eval-after-load 'package
    (set-face 'package-description                   'risemacs-face-default)
    (set-face 'package-help-section-name             'risemacs-face-default)
    (set-face 'package-name                          'risemacs-face-salient)
    (set-face 'package-status-avail-obso               'risemacs-face-faded)
    (set-face 'package-status-available              'risemacs-face-default)
    (set-face 'package-status-built-in               'risemacs-face-salient)
    (set-face 'package-status-dependency             'risemacs-face-salient)
    (set-face 'package-status-disabled                 'risemacs-face-faded)
    (set-face 'package-status-external               'risemacs-face-default)
    (set-face 'package-status-held                   'risemacs-face-default)
    (set-face 'package-status-incompat                 'risemacs-face-faded)
    (set-face 'package-status-installed              'risemacs-face-salient)
    (set-face 'package-status-new                    'risemacs-face-default)
    (set-face 'package-status-unsigned               'risemacs-face-default))

  ;; Button face is hardcoded, we have to redefine the relevant
  ;; function
  (defun package-make-button (text &rest properties)
    "Insert button labeled TEXT with button PROPERTIES at point.
PROPERTIES are passed to `insert-text-button', for which this
function is a convenience wrapper used by `describe-package-1'."
    (let ((button-text (if (display-graphic-p)
                           text (concat "[" text "]")))
          (button-face (if (display-graphic-p)
                           `(:box `(:line-width 1
                                    :color ,risemacs-color-subtle
                                    :style nil)
                                  :foreground ,risemacs-color-faded
                                  :background ,risemacs-color-subtle)
                         'link)))
      (apply #'insert-text-button button-text
               'face button-face 'follow-link t properties))))


(defun risemacs-theme--flyspell ()
  "Derive flyspell faces from risemacs faces."
  (with-eval-after-load 'flyspell
    (set-face 'flyspell-duplicate                     'risemacs-face-popout)
    (set-face 'flyspell-incorrect                     'risemacs-face-popout)))


(defun risemacs-theme--ido ()
  "Derive ido faces from risemacs faces."
  (with-eval-after-load 'ido
    (set-face 'ido-first-match                       'risemacs-face-salient)
    (set-face 'ido-only-match                          'risemacs-face-faded)
    (set-face 'ido-subdir                             'risemacs-face-strong)))


(defun risemacs-theme--diff ()
  "Derive diff faces from risemacs faces."
  (with-eval-after-load 'diff-mode
    (set-face 'diff-header                             'risemacs-face-faded)
    (set-face 'diff-file-header                       'risemacs-face-strong)
    (set-face 'diff-context                          'risemacs-face-default)
    (set-face 'diff-removed                            'risemacs-face-faded)
    (set-face 'diff-changed                           'risemacs-face-popout)
    (set-face 'diff-added                            'risemacs-face-salient)
    (set-face 'diff-refine-added                    '(risemacs-face-salient
                                                      risemacs-face-strong))
    (set-face 'diff-refine-changed                    'risemacs-face-popout)
    (set-face 'diff-refine-removed                    'risemacs-face-faded)
    (set-face-attribute     'diff-refine-removed nil :strike-through t)))


(defun risemacs-theme--term ()
  "Derive term faces from risemacs faces, and material theme colors."
  (with-eval-after-load 'term
    ;; (setq eterm-256color-disable-bold nil)
    (set-face 'term-bold                                   'risemacs-face-strong)
    (set-face-attribute 'term-color-black nil
                         :foreground (face-foreground 'risemacs-face-default)
                         :background (face-foreground 'risemacs-face-default))
    (set-face-attribute 'term-color-white nil
                         :foreground (face-background 'risemacs-face-default)
                         :background (face-background 'risemacs-face-default))
    (set-face-attribute 'term-color-blue nil
                         :foreground "#42A5F5"   ;; material color blue L400
                         :background "#BBDEFB")  ;; material color blue L100
    (set-face-attribute 'term-color-cyan nil
                         :foreground "#26C6DA"   ;; material color cyan L400
                         :background "#B2EBF2")  ;; material color cyan L100
    (set-face-attribute 'term-color-green nil
                         :foreground "#66BB6A"   ;; material color green L400
                         :background "#C8E6C9")  ;; material color green L100
    (set-face-attribute 'term-color-magenta nil
                         :foreground "#AB47BC"   ;; material color purple L400
                         :background "#E1BEE7")  ;; material color purple L100
    (set-face-attribute 'term-color-red nil
                         :foreground "#EF5350"   ;; material color red L400
                         :background "#FFCDD2")  ;; material color red L100
    (set-face-attribute 'term-color-yellow nil
                         :foreground "#FFEE58"    ;; material color yellow L400
                         :background "#FFF9C4"))) ;; material color yellow L100


(defun risemacs-theme--calendar ()
  "Derive calendar faces from risemacs faces."
  (with-eval-after-load 'calendar
    (set-face 'calendar-today                         'risemacs-face-strong)))


(defun risemacs-theme--agenda ()
  "Derive agenda faces from risemacs faces."
  (with-eval-after-load 'org-agenda
    (set-face 'org-agenda-calendar-event             'risemacs-face-default)
    (set-face 'org-agenda-calendar-sexp              'risemacs-face-salient)
    (set-face 'org-agenda-clocking                     'risemacs-face-faded)
    (set-face 'org-agenda-column-dateline              'risemacs-face-faded)
    (set-face 'org-agenda-current-time                'risemacs-face-strong)
    (set-face 'org-agenda-date                       'risemacs-face-salient)
    (set-face 'org-agenda-date-today                '(risemacs-face-salient
                                                       risemacs-face-strong))
    (set-face 'org-agenda-date-weekend                 'risemacs-face-faded)
    (set-face 'org-agenda-diary                        'risemacs-face-faded)
    (set-face 'org-agenda-dimmed-todo-face             'risemacs-face-faded)
    (set-face 'org-agenda-done                         'risemacs-face-faded)
    (set-face 'org-agenda-filter-category              'risemacs-face-faded)
    (set-face 'org-agenda-filter-effort                'risemacs-face-faded)
    (set-face 'org-agenda-filter-regexp                'risemacs-face-faded)
    (set-face 'org-agenda-filter-tags                  'risemacs-face-faded)
    ;;  (set-face 'org-agenda-property-face                'risemacs-face-faded)
    (set-face 'org-agenda-restriction-lock             'risemacs-face-faded)
    (set-face 'org-agenda-structure                   'risemacs-face-strong)))


(defun risemacs-theme--org ()
  "Derive org faces from risemacs faces."
  (with-eval-after-load 'org
    (set-face 'org-archived                            'risemacs-face-faded)

    (set-face 'org-block                                       'hl-line)
    (set-face 'org-block-begin-line                    'risemacs-face-faded)
    (set-face 'org-block-end-line                      'risemacs-face-faded)
    (unless (version< emacs-version "27.0")
      (set-face-attribute 'org-block nil                      :extend t)
      (set-face-attribute 'org-block-begin-line nil           :extend t)
      (set-face-attribute 'org-block-end-line nil             :extend t))

    (set-face 'org-checkbox                            'risemacs-face-faded)
    (set-face 'org-checkbox-statistics-done            'risemacs-face-faded)
    (set-face 'org-checkbox-statistics-todo            'risemacs-face-faded)
    (set-face 'org-clock-overlay                       'risemacs-face-faded)
    (set-face 'org-code                                'risemacs-face-faded2)
    (set-face 'org-column                              'risemacs-face-faded)
    (set-face 'org-column-title                        'risemacs-face-faded)
    (set-face 'org-date                                'risemacs-face-faded)
    (set-face 'org-date-selected                       'risemacs-face-faded)
    (set-face 'org-default                             'risemacs-face-default)
    (set-face 'org-document-info                       'risemacs-face-faded)
    (set-face 'org-document-info-keyword               'risemacs-face-faded)
    (set-face 'org-document-title                      'risemacs-face-faded)
    (set-face 'org-done                              'risemacs-face-default)
    (set-face 'org-drawer                              'risemacs-face-faded)
    (set-face 'org-ellipsis                            'risemacs-face-faded)
    (set-face 'org-footnote                            'risemacs-face-faded)
    (set-face 'org-formula                             'risemacs-face-faded)
    (set-face 'org-headline-done                       'risemacs-face-faded)
    ;; (set-face 'org-hide                             'risemacs-face-faded)
    ;; (set-face 'org-indent                           'risemacs-face-faded)
    (set-face 'org-latex-and-related                   'risemacs-face-faded)
    (set-face 'org-level-1                            'risemacs-face-strong)
    (set-face 'org-level-2                            'risemacs-face-strong2)
    (set-face 'org-level-3                            'risemacs-face-strong3)
    (set-face 'org-level-4                            'risemacs-face-strong4)
    (set-face 'org-level-5                            'risemacs-face-strong4)
    (set-face 'org-level-6                            'risemacs-face-strong4)
    (set-face 'org-level-7                            'risemacs-face-strong4)
    (set-face 'org-level-8                            'risemacs-face-strong4)
    (set-face 'org-link                              'risemacs-face-salient)
    (set-face 'org-list-dt                             'risemacs-face-faded)
    (set-face 'org-macro                               'risemacs-face-faded)
    (set-face 'org-meta-line                           'risemacs-face-faded)
    (set-face 'org-mode-line-clock                     'risemacs-face-faded)
    (set-face 'org-mode-line-clock-overrun             'risemacs-face-faded)
    (set-face 'org-priority                            'risemacs-face-faded)
    (set-face 'org-property-value                      'risemacs-face-faded)
    (set-face 'org-quote                               'risemacs-face-faded)
    (set-face 'org-scheduled                           'risemacs-face-faded)
    (set-face 'org-scheduled-previously                'risemacs-face-faded)
    (set-face 'org-scheduled-today                   '(risemacs-face-salient
+                                                      risemacs-face-strong))
    (set-face 'org-sexp-date                           'risemacs-face-faded)
    (set-face 'org-special-keyword                     'risemacs-face-faded)
    (set-face 'org-table                               'risemacs-face-faded)
    (set-face 'org-tag                                'risemacs-face-popout)
    (set-face 'org-tag-group                           'risemacs-face-faded)
    (set-face 'org-target                              'risemacs-face-faded)
    (set-face 'org-time-grid                           'risemacs-face-faded)
    (set-face 'org-todo                              'risemacs-face-salient)
    (set-face 'org-upcoming-deadline                 'risemacs-face-default)
    (set-face 'org-verbatim                           'risemacs-face-popout)
    (set-face 'org-verse                               'risemacs-face-faded)
    (set-face 'org-warning                            'risemacs-face-popout)))

(defun risemacs-theme--markdown ()
  "Derive markdown faces from risemacs faces."
  (with-eval-after-load 'markdown-mode
    (set-face 'markdown-blockquote-face              'risemacs-face-default)
    (set-face 'markdown-bold-face                     'risemacs-face-strong)
    (set-face 'markdown-code-face                    'risemacs-face-default)
    (set-face 'markdown-comment-face                   'risemacs-face-faded)
    (set-face 'markdown-footnote-marker-face         'risemacs-face-default)
    (set-face 'markdown-footnote-text-face           'risemacs-face-default)
    (set-face 'markdown-gfm-checkbox-face            'risemacs-face-default)
    (set-face 'markdown-header-delimiter-face          'risemacs-face-faded)
    (set-face 'markdown-header-face                   'risemacs-face-strong)
    (set-face 'markdown-header-face-1                 'risemacs-face-strong)
    (set-face 'markdown-header-face-2                 'risemacs-face-strong)
    (set-face 'markdown-header-face-3                 'risemacs-face-strong)
    (set-face 'markdown-header-face-4                 'risemacs-face-strong)
    (set-face 'markdown-header-face-5                 'risemacs-face-strong)
    (set-face 'markdown-header-face-6                'risemacs-face-strong)
    (set-face 'markdown-header-rule-face             'risemacs-face-default)
    (set-face 'markdown-highlight-face               'risemacs-face-default)
    (set-face 'markdown-hr-face                      'risemacs-face-default)
    (set-face 'markdown-html-attr-name-face          'risemacs-face-default)
    (set-face 'markdown-html-attr-value-face         'risemacs-face-default)
    (set-face 'markdown-html-entity-face             'risemacs-face-default)
    (set-face 'markdown-html-tag-delimiter-face      'risemacs-face-default)
    (set-face 'markdown-html-tag-name-face           'risemacs-face-default)
    (set-face 'markdown-inline-code-face              'risemacs-face-popout)
    (set-face 'markdown-italic-face                    'risemacs-face-faded)
    (set-face 'markdown-language-info-face           'risemacs-face-default)
    (set-face 'markdown-language-keyword-face        'risemacs-face-default)
    (set-face 'markdown-line-break-face              'risemacs-face-default)
    (set-face 'markdown-link-face                    'risemacs-face-salient)
    (set-face 'markdown-link-title-face              'risemacs-face-default)
    (set-face 'markdown-list-face                      'risemacs-face-faded)
    (set-face 'markdown-markup-face                    'risemacs-face-faded)
    (set-face 'markdown-math-face                    'risemacs-face-default)
    (set-face 'markdown-metadata-key-face              'risemacs-face-faded)
    (set-face 'markdown-metadata-value-face            'risemacs-face-faded)
    (set-face 'markdown-missing-link-face            'risemacs-face-default)
    (set-face 'markdown-plain-url-face               'risemacs-face-default)
    (set-face 'markdown-pre-face                     'risemacs-face-default)
    (set-face 'markdown-reference-face               'risemacs-face-salient)
    (set-face 'markdown-strike-through-face            'risemacs-face-faded)
    (set-face 'markdown-table-face                   'risemacs-face-default)
    (set-face 'markdown-url-face                     'risemacs-face-salient)))

(defun risemacs-theme--ivy ()
  "Derive ivy faces from risemacs faces."
  (with-eval-after-load 'ivy
    (set-face 'ivy-action                              'risemacs-face-faded)
    (set-face 'ivy-completions-annotations             'risemacs-face-faded)
    (set-face 'ivy-confirm-face                        'risemacs-face-faded)
    (set-face 'ivy-current-match    '(risemacs-face-strong risemacs-face-subtle))
    (set-face 'ivy-cursor                             'risemacs-face-strong)
    (set-face 'ivy-grep-info                          'risemacs-face-strong)
    (set-face 'ivy-grep-line-number                    'risemacs-face-faded)
    (set-face 'ivy-highlight-face                     'risemacs-face-strong)
    (set-face 'ivy-match-required-face                 'risemacs-face-faded)
    (set-face 'ivy-minibuffer-match-face-1             'risemacs-face-faded)
    (set-face 'ivy-minibuffer-match-face-2             'risemacs-face-faded)
    (set-face 'ivy-minibuffer-match-face-3             'risemacs-face-faded)
    (set-face 'ivy-minibuffer-match-face-4             'risemacs-face-faded)
    (set-face 'ivy-minibuffer-match-highlight         'risemacs-face-strong)
    (set-face 'ivy-modified-buffer                    'risemacs-face-popout)
    (set-face 'ivy-modified-outside-buffer            'risemacs-face-strong)
    (set-face 'ivy-org                                 'risemacs-face-faded)
    (set-face 'ivy-prompt-match                        'risemacs-face-faded)
    (set-face 'ivy-remote                            'risemacs-face-default)
    (set-face 'ivy-separator                           'risemacs-face-faded)
    (set-face 'ivy-subdir                              'risemacs-face-faded)
    (set-face 'ivy-virtual                             'risemacs-face-faded)
    (set-face 'ivy-yanked-word                         'risemacs-face-faded)))

;; (defun risemacs-theme--helm ()
;;   "Derive helm faces from risemacs faces."
;;   (with-eval-after-load 'helm
;;     (set-face 'helm-selection                '(risemacs-face-strong risemacs-face-subtle))
;;     (set-face 'helm-match                                       'risemacs-face-strong)
;;     (set-face 'helm-source-header                              'risemacs-face-salient)
;;     (set-face 'helm-visible-mark                                'risemacs-face-strong)))

;; (defun risemacs-theme--helm-swoop ()
;;   "Derive helm faces from risemacs faces."
;;   (with-eval-after-load 'helm-swoop
;;     (set-face 'helm-swoop-target-line-face   '(risemacs-face-strong risemacs-face-subtle))))

;; (defun risemacs-theme--helm-occur ()
;;   "Derive helm faces from risemacs faces."
;;   (with-eval-after-load 'helm-occur
;;     (set-face 'helm-moccur-buffer                               'risemacs-face-strong)))

;; (defun risemacs-theme--helm-ff ()
;;   "Derive helm faces from risemacs faces."
;;   (with-eval-after-load 'helm-ff
;;     (set-face 'helm-ff-file                                      'risemacs-face-faded)
;;     (set-face 'helm-ff-prefix                                   'risemacs-face-strong)
;;     (set-face 'helm-ff-dotted-directory                          'risemacs-face-faded)
;;     (set-face 'helm-ff-directory                                'risemacs-face-strong)
;;     (set-face 'helm-ff-executable                               'risemacs-face-popout)))

;; (defun risemacs-theme--helm-grep ()
;;   "Derive helm faces from risemacs faces."
;;   (with-eval-after-load 'helm-grep
;;     (set-face 'helm-grep-match                                  'risemacs-face-strong)
;;     (set-face 'helm-grep-file                                    'risemacs-face-faded)
;;     (set-face 'helm-grep-lineno                                  'risemacs-face-faded)
;;     (set-face 'helm-grep-finish                                'risemacs-face-default)))

(defun risemacs-theme--company ()
  "Derive company tooltip window from risemacs faces."
  (with-eval-after-load 'company
    (set-face 'company-tooltip-selection                   '(risemacs-face-strong risemacs-face-subtle))
    (set-face-attribute 'company-tooltip-selection nil :background risemacs-color-popout)
    
    (set-face 'company-tooltip                                               'risemacs-face-subtle)

    (set-face 'company-scrollbar-fg                                          'risemacs-face-faded)
    (set-face-attribute 'company-scrollbar-fg nil :background risemacs-color-foreground)
    
    (set-face 'company-scrollbar-bg                                          'risemacs-face-default)
    (set-face-attribute 'company-scrollbar-bg nil :background risemacs-color-faded)

    (set-face 'company-tooltip-common                                        'risemacs-face-faded)
    (set-face 'company-tooltip-common-selection            '(risemacs-face-strong risemacs-face-subtle))
    (set-face-attribute 'company-tooltip-common-selection nil :background risemacs-color-popout)
    
    (set-face 'company-tooltip-annotation                                    'risemacs-face-default)
    (set-face 'company-tooltip-annotation-selection        '(risemacs-face-strong risemacs-face-subtle))))

(defun risemacs-theme ()
  "Derive many, many faces from the core risemacs faces."
  (risemacs-theme--basics)
  (risemacs-theme--font-lock)
  (risemacs-theme--mode-line)
  (risemacs-theme--minibuffer)
  (risemacs-theme--buttons)
  (risemacs-theme--info)
  (risemacs-theme--bookmark)
  (risemacs-theme--speedbar)
  (risemacs-theme--message)
  (risemacs-theme--outline)
  (risemacs-theme--customize)
  (risemacs-theme--package)
  (risemacs-theme--flyspell)
  (risemacs-theme--ido)
  (risemacs-theme--diff)
  (risemacs-theme--calendar)
  (risemacs-theme--agenda)
  (risemacs-theme--org)
  (risemacs-theme--markdown)
  (risemacs-theme--ivy)
  (risemacs-theme--hl-line)
  (risemacs-theme--company))

(defun risemacs-refresh-theme ()
  "Convenience function which refreshes the risemacs-theme.
Calls \(risemacs-faces\) and \(risemacs-theme\) sequentially."
  (interactive)
  (progn
    (risemacs-faces)
    (risemacs-theme)))


(defun risemacs-toggle-theme ()
  "Function to interactively toggle between light and dark risemacs themes.
Requires both to be loaded in order to work."
  (interactive)
  (cond ((string= risemacs-theme-var "light")
         (risemacs-theme-set-dark))
         ((string= risemacs-theme-var "dark")
          (risemacs-theme-set-light))
         (t nil))
  (risemacs-refresh-theme))

(provide 'risemacs-theme)
