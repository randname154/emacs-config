;; -*- lexical-binding: t; -*-

(use-package org
  :ensure nil
  :defer t
  :mode ("\\.org\\'" . org-mode)
  :config
  (setq org-attach-dir-relative t)
  (setq org-attach-id-dir "assets/"))

(use-package org-download
  :ensure t
  :after org
  :bind
  ("C-c p" . org-download-clipboard)
  :custom
  (org-download-display-inline-images nil)
  (org-download-method 'attach))
  


(use-package org-roam-workspace
  :after org-roam
  :demand t
  :load-path "lisp"
  :bind (("C-c n w" . org-roam-workspace-switch))
  :config
  (org-roam-workspace-setup))

(use-package org-roam
  :bind (("C-c n f" . org-roam-node-find)
	 ("C-c n i" . org-roam-node-insert)
	 ("C-c n l" . org-roam-buffer))
  
  :config
  (org-roam-db-autosync-mode))

(use-package ox-pandoc
  :after org
  :defer 5
  :config
  (add-to-list 'process-coding-system-alist
               '("pandoc" . (utf-8 . gb18030))))
