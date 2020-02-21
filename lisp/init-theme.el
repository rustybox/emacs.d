
(use-package doom-themes
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-dark+ t))

  (setq doom-themes-treemacs-theme "doom-colors") 
  (doom-themes-treemacs-config)

(provide 'init-theme)
