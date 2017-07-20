(require-package 'reykjavik-theme)
(require-package 'monokai-theme)

;; If you don't customize it, this is the theme you get.
(setq-default custom-enabled-themes '(reykjavik))

;; Ensure that themes will be applied even if they have not been customized
(defun reapply-themes ()
  "Forcibly load the themes listed in `custom-enabled-themes'."
  (dolist (theme custom-enabled-themes)
    (unless (custom-theme-p theme)
      (load-theme theme)))
  (custom-set-variables `(custom-enabled-themes (quote ,custom-enabled-themes))))

(add-hook 'after-init-hook 'reapply-themes)


;;------------------------------------------------------------------------------
;; Toggle between light and dark
;;------------------------------------------------------------------------------
(defun light ()
  "Activate a light color theme."
  (interactive)
  (setq custom-enabled-themes '(monokai))
  (reapply-themes))

(defun dark ()
  "Activate a dark color theme."
  (interactive)
  (setq custom-enabled-themes '(reykjavik))
  (reapply-themes))

(defun safe-load-theme (name)
  (if (fboundp 'load-theme)
      (load-theme name)))

(provide 'init-themes)
