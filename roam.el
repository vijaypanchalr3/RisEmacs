(setq org-roam-directory (file-truename "~/org-roam"))
(use-package org-roam
  :after org
  :config
  (org-roam-db-autosync-enable)
  :custom
  (org-roam-capture-templates
   '(("d" "default" plain
      "\n\n\n%?"
      :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)
     ("b" "book notes" plain
      "\n*Author* : %^{Author} \n*Title* : ${title} \n\n\n\n%?"
      :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+filetags: book")
      :unnarrowed t)))
  :bind (("C-c n f" . org-roam-node-find)
         ("C-c n r" . org-roam-node-random)		    
         (:map org-mode-map
               (("C-c n i" . org-roam-node-insert)
                ("C-c n o" . org-id-get-create)
                ("C-c n t" . org-roam-tag-add)
                ("C-c n a" . org-roam-alias-add)
                ("C-c n l" . org-roam-buffer-toggle)))))
(setq org-roam-completion-everywhere t)
(setq org-roam-capture-templates '(("d" "default" plain "%?"
                                    :if-new
                                    (file+head "${slug}.org"
                                               "#+title: ${title}\n#+date: %u\n#+lastmod: \n\n")
                                    :immediate-finish t))
      time-stamp-start "#\\+lastmod: [\t]*")

