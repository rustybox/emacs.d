
(use-package neotree
  :init
  (setq neo-theme 'icons)
  :config
  (global-set-key [f8] 'neotree-toggle)
  (add-hook 'neo-after-create-hook (lambda (&optional dummy) (display-line-numbers-mode -1))))
(provide 'init-neotree)
