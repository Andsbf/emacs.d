;; My Emacs Configs
;; Install Package Manager

(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
;; keep the installed packages in .emacs.d
(setq package-user-dir (expand-file-name "elpa" user-emacs-directory))
(package-initialize)
;; update the package metadata is the local cache is missing
(unless package-archive-contents
  (package-refresh-contents))

(setq user-full-name "Anderson Saunders"
      user-mail-address "andsbf@gmail.com")

;; Always load newest byte code
(setq load-prefer-newer t)

;; reduce the frequency of garbage collection by making it happen on
;; each 50MB of allocated data (the default is on every 0.76MB)
(setq gc-cons-threshold 50000000)

;; warn when opening files bigger than 100MB
(setq large-file-warning-threshold 100000000)

(defconst ando-savefile-dir (expand-file-name "savefile" user-emacs-directory))

;; create the savefile dir if it doesn't exist
(unless (file-exists-p ando-savefile-dir)
  (make-directory ando-savefile-dir))

;; the toolbar is just a waste of valuable screen estate
;; in a tty tool-bar-mode does not properly auto-load, and is
;; already disabled anyway
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

;; the blinking cursor is nothing, but an annoyance
(blink-cursor-mode -1)

;; disable the annoying bell ring
(setq ring-bell-function 'ignore)

;; disable startup screen
(setq inhibit-startup-screen t)

;; nice scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;; ;; Show line numbers with some padding
(global-linum-mode t)
(setq linum-format "%d ")

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; more useful frame title, that show either a file or a
;; buffer name (if the buffer isn't visiting a file)
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

;; Emacs modes typically provide a standard means to change the
;; indentation width -- eg. c-basic-offset: use that to adjust your
;; personal indentation width, while maintaining the style (and
;; meaning) of any files you load.
(setq-default indent-tabs-mode nil)   ;; don't use tabs to indent
(setq-default tab-width 2)            ;; but maintain correct appearance
(setq js-indent-level 2)
(setq typescript-indent-level 2)
(setq typescript-expr-indent-offset 2)
(setq css-indent-offset 2)

;; newline at end of file
(setq require-final-newline t)

;; Show white space
(setq-default show-trailing-whitespace t)

;; Remove Whitespace trailing
 (add-hook 'before-save-hook 'delete-trailing-whitespace)

;; delete the selection with a keypress
(delete-selection-mode t)

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `(("." . ,(concat user-emacs-directory "backups"))))

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; revert buffers automatically when underlying files are changed externally
(global-auto-revert-mode t)

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;; hippie expand is dabbrev expand on steroids
;; first I define a function for substring matching, so it can match
(defun try-my-dabbrev-substring (old)
  (let ((old-fun (symbol-function 'he-dabbrev-search)))
    (fset 'he-dabbrev-search (symbol-function 'my-dabbrev-substring-search))
    (unwind-protect
        (try-expand-dabbrev old)
      (fset 'he-dabbrev-search old-fun))))


(defun my-dabbrev-substring-search (pattern &optional reverse limit)
  (let ((result ())
	(regpat (cond ((not hippie-expand-dabbrev-as-symbol)
		       (concat (regexp-quote pattern) "\\sw+"))
		      ((eq (char-syntax (aref pattern 0)) ?_)
		       (concat (regexp-quote pattern) "\\(\\sw\\|\\s_\\)+"))
		      (t
		       (concat (regexp-quote pattern)
			       "\\(\\sw\\|\\s_\\)+")))))
    (while (and (not result)
		(if reverse
		     (re-search-backward regpat limit t)
		     (re-search-forward regpat limit t)))
      (setq result (buffer-substring-no-properties (save-excursion
                                                     (goto-char (match-beginning 0))
                                                     (skip-syntax-backward "w_")
                                                     (point))
						   (match-end 0)))
      (if (he-string-member result he-tried-table t)
	  (setq result nil)))     ; ignore if bad prefix or already in table
    result))

;; define flexiable macth expansion
;; https://www.emacswiki.org/emacs/HippieExpand#toc8

(defun try-expand-flexible-abbrev (old)
  "Try to complete word using flexible matching.

Flexible matching works by taking the search string and then
interspersing it with a regexp for any character. So, if you try
to do a flexible match for `foo' it will match the word
`findOtherOtter' but also `fixTheBoringOrange' and
`ifthisisboringstopreadingnow'.

The argument OLD has to be nil the first call of this function, and t
for subsequent calls (for further possible completions of the same
string).  It returns t if a new completion is found, nil otherwise."
  (if (not old)
      (progn
	      (he-init-string (he-lisp-symbol-beg) (point))
	      (if (not (he-string-member he-search-string he-tried-table))
	          (setq he-tried-table (cons he-search-string he-tried-table)))
	      (setq he-expand-list
	            (and (not (equal he-search-string ""))
		               (he-flexible-abbrev-collect he-search-string)))))
  (while (and he-expand-list
	            (he-string-member (car he-expand-list) he-tried-table))
    (setq he-expand-list (cdr he-expand-list)))
  (if (null he-expand-list)
      (progn
	      (if old (he-reset-string))
	      ())
    (progn
	    (he-substitute-string (car he-expand-list))
	    (setq he-expand-list (cdr he-expand-list))
	    t)))

(defun he-flexible-abbrev-collect (str)
  "Find and collect all words that flex-matches STR.
See docstring for `try-expand-flexible-abbrev' for information
about what flexible matching means in this context."
  (let ((collection nil)
        (regexp (he-flexible-abbrev-create-regexp str)))
    (save-excursion
      (goto-char (point-min))
      (while (search-forward-regexp regexp nil t)
        ;; Is there a better or quicker way than using
        ;; `thing-at-point' here?
        (setq collection (cons (thing-at-point 'word) collection))))
    collection))

(defun he-flexible-abbrev-create-regexp (str)
  "Generate regexp for flexible matching of STR.
See docstring for `try-expand-flexible-abbrev' for information
about what flexible matching means in this context."
  (concat "\\b" (mapconcat (lambda (x) (concat "\\w*" (list x))) str "")
          "\\w*" "\\b"))

(setq hippie-expand-try-functions-list '(try-my-dabbrev-substring
                                         try-expand-flexible-abbrev
                                         try-expand-dabbrev
                                         try-expand-dabbrev-all-buffers
                                         try-expand-dabbrev-from-kill
                                         try-complete-file-name-partially
                                         try-complete-file-name
                                         try-expand-all-abbrevs
                                         try-expand-list
                                         try-expand-line
                                         try-complete-lisp-symbol-partially
                                         try-complete-lisp-symbol))

;; use hippie-expand instead of dabbrev
(global-set-key (kbd "M-/") #'hippie-expand)
(global-set-key (kbd "s-/") #'hippie-expand)

;; replace buffer-menu with ibuffer
(global-set-key (kbd "C-x C-b") #'ibuffer)

;; smart tab behavior - indent or complete
(setq tab-always-indent 'complete)

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-verbose t)

;;; built-in packages

;; enable narrow region
(put 'narrow-to-region 'disabled nil)

(use-package s)

(use-package paren
  :config
  (show-paren-mode +1))

;; highlight the current line
(use-package hl-line
  :config
  (global-hl-line-mode +1))

(use-package abbrev
  :config
  (setq save-abbrevs 'silently)
  (setq-default abbrev-mode t))

(use-package uniquify
  :config
  (setq uniquify-buffer-name-style 'forward)
  (setq uniquify-separator "/")
  ;; rename after killing uniquified
  (setq uniquify-after-kill-buffer-p t)
  ;; don't muck with special buffers
  (setq uniquify-ignore-buffers-re "^\\*"))

(use-package savehist
  :config
  (setq savehist-additional-variables
        ;; search entries
        '(search-ring regexp-search-ring)
        ;; save every minute
        savehist-autosave-interval 60
        ;; keep the home clean
        savehist-file (expand-file-name "savehist" ando-savefile-dir))
  (savehist-mode +1))

(use-package recentf
  :config
  (setq recentf-save-file (expand-file-name "recentf" ando-savefile-dir)
        recentf-max-saved-items 500
        recentf-max-menu-items 15
        ;; disable recentf-cleanup on Emacs start, because it can cause
        ;; problems with remote files
        recentf-auto-cleanup 'never)
  (recentf-mode +1))

(use-package windmove
  :config
  ;; use shift + arrow keys to switch between visible buffers
  (windmove-default-keybindings))

(use-package dired
  :config
  ;; dired - reuse current buffer by pressing 'a'
  (put 'dired-find-alternate-file 'disabled nil)

  ;; always delete and copy recursively
  (setq dired-recursive-deletes 'always)
  (setq dired-recursive-copies 'always)

  ;; if there is a dired buffer displayed in the next window, use its
  ;; current subdir, instead of the current subdir of this dired buffer
  (setq dired-dwim-target t)

  ;; enable some really cool extensions like C-x C-j(dired-jump)
  (require 'dired-x))

;;; third-party packages
(use-package zenburn-theme
  :ensure t
  :config )
  ;; (load-theme 'zenburn t))

(zenburn-with-color-variables
  (custom-theme-set-faces
   'zenburn
;;;;; hl-line-mode
   `(hl-line-face ((t (:background ,zenburn-bg+2 ))))
   `(hl-line ((t (:background ,zenburn-bg+2 ))))
   ))

;; temporarily highlight changes from yanking, etc;;
(use-package volatile-highlights
  :ensure t
  :config
  (volatile-highlights-mode +1))

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status))
  :config
  (setq magit-save-repository-buffers nil))

(use-package projectile
  :ensure t
  :init
  (setq projectile-completion-system 'ivy)
  :config
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (global-set-key (kbd "C-x f") #'projectile-find-file-dwim-other-window))

(use-package ivy
  :ensure t
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-re-builders-alist
      '((t . ivy--regex-ignore-order)))
  (setq enable-recursive-minibuffers t)
  (global-set-key (kbd "C-c C-r") 'ivy-resume))

(use-package expand-region
  :ensure t
  :bind (("C-c e" . er/expand-region)))

(use-package web-mode
  :ensure t
  :config
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-indent-style 2)

  (setq web-mode-tag-auto-close-style t)
  (setq web-mode-enable-auto-closing t)
  (setq web-mode-enable-auto-pairing t)
  (setq web-mode-enable-auto-opening t)
  (setq web-mode-enable-auto-quoting nil)

  (setq web-mode-content-types-alist
		   '(("jsx" . "\\.js[x]?\\'")))

  (add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode)))

(add-to-list 'web-mode-indentation-params '("lineup-args" . nil))
(add-to-list 'web-mode-indentation-params '("lineup-calls" . nil))
(add-to-list 'web-mode-indentation-params '("lineup-concats" . nil))
(add-to-list 'web-mode-indentation-params '("lineup-ternary" . nil))

(use-package enh-ruby-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.rb\\'" . enh-ruby-mode)))

;; config changes made through the customize UI will be stored here
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(when (file-exists-p custom-file)
  (load custom-file))

;; My Functions

(defun save-macro (name)
  "save a macro. Take a name as argument
     and save the last defined macro under
     this name at the end of your .emacs"
  (interactive "SName of the macro: ")  ; ask for the name of the macro
  (kmacro-name-last-macro name)         ; use this name for the macro
  (find-file user-init-file)            ; open ~/.emacs or other user init file
  (goto-char (point-max))               ; go to the end of the .emacs
  (newline)                             ; insert a newline
  (insert-kbd-macro name)               ; copy the macro
  (newline)                             ; insert a newline
  (switch-to-buffer nil))               ; return to the initial buffer

(defun scaffold-react-component (name dir type)
  "Scafollds a React component, creates Folder, file.js and index.js"
  (interactive
   (list
    (read-string "Component Name: ")
    (read-directory-name "Directory:")
    (let ((completion-ignore-case  t))
      (completing-read "Choose: " '("Function" "Pure" "Component") nil t))
    )
   )

  (setq react-file-template-fn (concat"\
import React from \"react\";
import style from \"./style.module.css\";
import PropTypes from \"prop-types\";

const " name " = () => {

};"

"\n\n"name ".displayName = \""name "\";"

"\n\n"name ".propTypes = {};

export default " name ";"))

  (setq react-file-template-pure (concat"\
import React, { PureComponent } from \"react\";
import style from \"./style.module.css\";
import PropTypes from \"prop-types\";

class " name " extends PureComponent {
  render() {
    return(
      <div> </div>
    );
  }
};"

"\n\n"name ".displayName =  \""name "\";"

"\n\n"name ".propTypes = {};

export default " name ";"))

  (setq react-file-template-class (concat"\
import React, { Component } from \"react\";
import style from \"./style.module.css\";
import PropTypes from \"prop-types\";

class " name " extends Component {
  constructor(props) {
    super(props);

    this.state = {

    };
  }

  render() {
    return(
      <div> </div>
    );
  }
};"

"\n\n"name ".displayName = \""name "\";"

"\n\n"name ".propTypes = {};

export default " name ";"))

  (cond
   ((string= type "Function") (setq react-file-template react-file-template-fn))
   ((string= type "Pure") (setq react-file-template react-file-template-pure))
   ((string= type "Component") (setq react-file-template react-file-template-class))
   (t (setq react-file-template react-file-template-class)))

  (let* ((dir-expanded-file-name (concat dir name))
	 (file-name-with-extension (concat name ".js"))
	 (export (concat "export { default } from \"./" name "\";")))
    (make-directory dir-expanded-file-name)
    (cd dir-expanded-file-name)
    (write-region react-file-template nil file-name-with-extension)
    (write-region "" nil "style.module.css")
    (write-region export nil "index.js")
    (find-file dir-expanded-file-name))
  )

;;My  Macros

(defun copy-current-buffer-file-name ()
  (interactive)
  (shell-command (concat "echo " (buffer-file-name) " | pbcopy")))

(global-set-key (kbd "C-x M-f") 'copy-current-buffer-file-name)

(fset 'make-props
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("	 fw={}" 0 "%d")) arg)))
(global-set-key (kbd "C-c m p") 'make-props)

(fset 'bind-this
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("	this. w = this..bind(this);" 0 "%d")) arg)))
(global-set-key (kbd "C-c m b") 'bind-this)

;; set upcase-region function on
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(defun sort-words (reverse beg end)
  "Sort words in region alphabetically, in REVERSE if negative.
    Prefixed with negative \\[universal-argument], sorts in reverse.

    The variable `sort-fold-case' determines whether alphabetic case
    affects the sort order.

    See `sort-regexp-fields'."
  (interactive "*P\nr")
  (sort-regexp-fields reverse "\\w+" "\\&" beg end))

;; toggle maximize buffer
(defun toggle-maximize-buffer () "Maximize buffer"
  (interactive)
  (if (= 1 (length (window-list)))
      (jump-to-register '_)
    (progn
      (window-configuration-to-register '_)
      (delete-other-windows))))

;; Bind it to a key.
(global-set-key (kbd "C-c m b") 'toggle-maximize-buffer)
(put 'erase-buffer 'disabled nil)

;; remove hash files from projectile search
(add-to-list 'projectile-globally-ignored-files ".#*")

;; dired defaults
(setq dired-listing-switches "-aBhl")

;; (defun setup-tide-mode ()
;;   (interactive)
;;   (tide-setup)
;;   (flycheck-mode +1)
;;   (setq flycheck-check-syntax-automatically '(save mode-enabled))
;;   (eldoc-mode +1)
;;   (tide-hl-identifier-mode +1)
;;   ;; company is an optional dependency. You have to
;;   ;; install it separately via package-install
;;   ;; `M-x package-install [ret] company`
;;   (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
;; (add-hook 'before-save-hook 'tide-format-before-save)

;; (add-hook 'typescript-mode-hook #'setup-tide-mode)


(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
;; (add-hook 'web-mode-hook
;;           (lambda ()
;;             (when (string-equal "tsx" (file-name-extension buffer-file-name))
;;               (setup-tide-mode))))
;; ;; enable typescript-tslint checker
;; (flycheck-add-mode 'typescript-tslint 'web-mode)
(put 'set-goal-column 'disabled nil)


;; <Color theme initialization code>

(defun disable-all-themes ()
  "disable all active themes."
  (dolist (i custom-enabled-themes)
    (disable-theme i)))

(defadvice load-theme (before disable-themes-first activate)
  (disable-all-themes))

(defun synchronize-theme ()
  (setq hour
        (string-to-number
         (substring (current-time-string) 11 13)))
  (if (member hour (number-sequence 6 17))
      (load-theme 'adwaita t)
    (load-theme 'zenburn t) ) )

  (run-with-timer 0 3600 'synchronize-theme)

;; LSP
(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (rust-mode . lsp)
         (enh-ruby-mode . lsp)
         (web-mode . lsp))

  :commands lsp)

;; optionally
(use-package lsp-ui :commands lsp-ui-mode)
;; if you are ivy user
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
;; which-key integration
(use-package which-key
    :config
    (which-key-mode))


(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)

(global-set-key (kbd "C-c y") '(lambda ()
                                 (interactive)
                                 (popup-menu 'yank-menu)))
