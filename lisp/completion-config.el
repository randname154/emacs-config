;; -*- lexical-binding: t; -*-

(use-package prescient
  :config
  (setq prescient-sort-full-matches-first t))

(use-package company
  :ensure t
  :hook prog-mode
  :bind
  (:map company-mode-map
	([remap completion-at-point] . company-manual-begin))
  :config
  (setq company-require-match nil)
  (setq company-async-timeout 5)
  (setq company-backends
	'((company-capf company-yasnippet)
          company-files
          (company-dabbrev-code company-dabbrev))))





(use-package company-prescient
  :ensure t
  :after company
  :config
  (company-prescient-mode))

(use-package company-quickhelp
  :ensure t
  :after company
  :bind
  (:map company-active-map
	("C-c h" . company-quickhelp-manual-begin)))

(use-package company-box
  :after company
  :if (display-graphic-p)
  :config
  (company-box-mode))
