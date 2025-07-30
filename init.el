;; -*- lexical-binding: t; -*-

(use-package emacs
  :config
  (tool-bar-mode -1)
  (column-number-mode 1)
  (set-language-environment 'Chinese-GB18030)
  (prefer-coding-system 'utf-8)
  (setq delete-selection-mode 1)
  (setq inhibit-startup-screen t)
  (setq initial-major-mode 'fundamental-mode)
  (setq initial-scratch-message nil)
  (setq create-lockfiles nil)
  (setq backup-directory-alist (cons (cons "." (temporary-file-directory)) backup-directory-alist))
  (setq auto-save-default nil)
  (setq package-archives '(("gnu"    . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("nongnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
                         ("melpa"  . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

  :custom
  (context-menu-mode t)
  (enable-recursive-minibuffers t)
  (read-extended-command-predicate #'command-completion-default-include-p))

(load (expand-file-name "lisp/completion-config.el" user-emacs-directory) nil t)
(load (expand-file-name "lisp/minibuffer-config.el" user-emacs-directory) nil t)
(load (expand-file-name "lisp/orgmode-config.el" user-emacs-directory) nil t)
;; Prevent Custom from modifying this file.
(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load custom-file 'noerror 'nomessage)


(setq use-package-compute-statistics t)
(setq use-package-always-ensure t)


(use-package nerd-icons
  :ensure t
  :commands nerd-icons-install-fonts)

(use-package which-key
  :ensure t
  
  :config
  (setq which-key-show-early-on-C-h t)
  (setq which-key-idle-delay most-positive-fixnum)
  (setq which-key-idle-secondary-delay 1e-100)
  
  :hook (after-init . which-key-mode))



(defun display-startup-time ()
  "Display the startup time and number of garbage collections."
  (message "Emacs init loaded in %.2f seconds (Full emacs-startup: %.2fs) with %d garbage collections."
           (float-time (time-subtract after-init-time before-init-time))
           (time-to-seconds (time-since before-init-time))
           gcs-done))

(add-hook 'emacs-startup-hook #'display-startup-time 100)

