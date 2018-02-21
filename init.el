;; Melpa setup

(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)


(custom-set-variables
 '(package-selected-packages (quote (magit omnisharp company monokai-theme flycheck))))

(custom-set-faces)


(load-theme 'monokai t)

(require 'whitespace)
(global-whitespace-mode t)

;; Allow resize windows with arrows

(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; Allow select window with arrows

(windmove-default-keybindings)

;; Enable some keybindings

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; Load some other configuration files

(add-to-list 'load-path "~/.emacs.d/lang/")
(load "csharp.el")

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)
