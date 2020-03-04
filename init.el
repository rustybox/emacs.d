;; use-package setup
(require 'package)
(setq package-enable-at-startup nil) ; dont do it immediately
(setq package-archives '(
    ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

(setq-default custom-file (expand-file-name ".custom.el" user-emacs-directory))
(setq python-shell-interpreter "/usr/bin/python3")

(global-display-line-numbers-mode)

;; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents) ; update archives
  (package-install 'use-package)) ; grab the newest use-package

;; Define packages
(require 'use-package)

;; Always download if not available
(setq use-package-always-ensure t)

;; Pull in ./lisp/*
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(use-package all-the-icons)
(require 'init-neotree)
(require 'init-theme)
;;(require 'init-ivy)
(require 'init-which-key)

(use-package ace-window
   :config
  (setq aw-dispatch-always t))
(global-set-key (kbd "M-o") 'ace-window)

;; Show whitespace
(setq whitespace-style (quote (face spaces tabs space-mark tab-mark)))
(require 'whitespace)
(global-whitespace-mode t)

;; Allow resize windows with arrows
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; Enable some keybindings
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))


(setq max-mini-window-height 0.5)
