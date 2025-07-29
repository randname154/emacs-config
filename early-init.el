;; -*- lexical-binding: t; -*-

(defvar desire-gc-cons-threshold (* 16 1024 1024))
(setq gc-cons-threshold most-positive-fixnum)
(setq gc-cons-percentage 0.5)
(add-hook 'emacs-startup-hook
	  (lambda ()
	    (setq gc-cons-threshold desire-gc-cons-threshold)))


(when (eq 'w32 initial-window-system)
  (modify-all-frames-parameters '((font . "YaHei Consolas Hybrid-12"))))
