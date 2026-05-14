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
(setq straight-built-in-pseudo-packages '(emacs python project eglot use-package flymake))

;; Configure straight.el to use use-package
(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

;; Update recipe repositories periodically (every 7 days)
(let ((stamp-file (expand-file-name "straight/last-recipe-pull" user-emacs-directory)))
  (when (or (not (file-exists-p stamp-file))
            (> (float-time (time-subtract (current-time)
                                          (nth 5 (file-attributes stamp-file))))
               (* 7 24 60 60)))
    (straight-pull-recipe-repositories)
    (with-temp-file stamp-file (insert (current-time-string)))))

;; Load org-mode via straight.el BEFORE org-babel-load-file
;; This prevents built-in org from loading and causing version mismatch
(straight-use-package 'org)

;; Load main configuration
(org-babel-load-file "~/.emacs.d/config.org")

