(setq onedrive-root "~/")
(if (eq system-type 'windows-nt)
    (setq onedrive-root
	  (expand-file-name
	   "OneDrive"
	   (concat (getenv "HOMEDRIVE") (getenv "HOMEPATH")))))

(setq org-roam-workspace-root (expand-file-name "roam" onedrive-root))
(setq org-roam-workspace-list '("Default"))

(defun org-roam-default-workspace ()
  (car org-roam-workspace-list))

(defun org-roam-workspace-path (name)
  (expand-file-name name org-roam-workspace-root))

(defun org-roam-workspace-switch (name)
  (interactive (list
		(completing-read
		 (format "workspace(%s):" (org-roam-default-workspace))
		 org-roam-workspace-list)))
  (let ((path (org-roam-workspace-path name)))
    (make-directory path t)
    (setq org-roam-db-location (expand-file-name "org-roam.db" path))
    (setq org-roam-directory path)
    (org-roam-db-sync)))

(defun org-roam-workspace-setup ()
  (org-roam-workspace-switch "Default"))

(provide 'org-roam-workspace)
