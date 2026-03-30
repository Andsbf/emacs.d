;; Bootstrap straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Tell straight.el to use built-in packages
(setq straight-built-in-pseudo-packages '(emacs python project))

;; Configure straight.el to use use-package
(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

;; Update recipe repositories to get latest package definitions
(straight-pull-recipe-repositories)

;; Load org-mode via straight.el BEFORE org-babel-load-file
;; This prevents built-in org from loading and causing version mismatch
(straight-use-package 'org)

;; Load main configuration
(org-babel-load-file "~/.emacs.d/config.org")

;; Custom settings
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(uniquify-buffer-name-style 'forward nil (uniquify)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
