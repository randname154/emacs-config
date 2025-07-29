;; -*- lexical-binding: t; -*-

(use-package prescient
  :config
  (setq prescient-sort-full-matches-first t))

(use-package company
  :ensure t
  :hook prog-mode
  :config
  (local-set-key [remap completion-at-point] #'company-complete))

(use-package company-prescient
  :ensure t
  :after company
  :config
  (company-prescient-mode))

(use-package company-quickhelp
  :ensure t
  :after company
  :config
  (define-key company-active-map (kbd "C-c h") #'company-quickhelp-manual-begin))

(use-package company-box
  :after company
  :if (display-graphic-p)
  :config
  (company-box-mode))
