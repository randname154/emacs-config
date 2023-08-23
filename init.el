(menu-bar-mode -1)
(tool-bar-mode -1)
(set-face-font 'default (font-spec :script 'han :family "幼圆" :size 12.0))

(setq create-lockfiles nil)
(setq backup-directory-alist (cons (cons "." (temporary-file-directory)) backup-directory-alist))


(setq package-archives '(("gnu"    . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("nongnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
                         ("melpa"  . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize)

(require 'use-package)
(setq use-package-verbose t)
(setq use-package-always-ensure t)
(setq use-package-compute-statistics t)

(use-package which-key
  :config
  (which-key-mode))

(use-package org-roam-workspace
  :after org-roam
  :demand t
  :load-path "lisp"
  :bind (("C-c n w" . org-roam-workspace-switch))
  :config
  (org-roam-workspace-setup))

(use-package emacsql-sqlite-builtin
  :defer t)

(use-package org-roam
  :after emacsql-sqlite-builtin
  :bind (("C-c n f" . org-roam-node-find)
	 ("C-c n i" . org-roam-node-insert)
	 ("C-c n l" . org-roam-buffer))
  
  :config
  (org-roam-db-autosync-mode))

(use-package org-roam-ui
  :after org-roam
  :bind (("C-c n u" . org-roam-ui-mode))
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t))

(use-package ox-pandoc
  :after org
  :defer 15)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(ox-pandoc org-roam-ui which-key)))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
