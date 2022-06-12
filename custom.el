(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#657b83"])
 '(compilation-message-face 'default)
 '(counsel-projectile-preview-buffers nil)
 '(counsel-switch-buffer-preview-virtual-buffers nil)
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   '("4c56af497ddf0e30f65a7232a8ee21b3d62a8c332c6b268c81e9ea99b11da0d3" "fee7287586b17efbfda432f05539b58e86e059e78006ce9237b8732fde991b4c" default))
 '(enh-ruby-bounce-deep-indent nil)
 '(enh-ruby-deep-indent-construct nil)
 '(fci-rule-color "#073642")
 '(highlight-changes-colors '("#d33682" "#6c71c4"))
 '(highlight-symbol-colors
   '("#3b6b40f432d7" "#07b9463d4d37" "#47a3341f358a" "#1d873c4056d5" "#2d87441c3362" "#43b7362e3199" "#061e418059d7"))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   '(("#073642" . 0)
     ("#5b7300" . 20)
     ("#007d76" . 30)
     ("#0061a8" . 50)
     ("#866300" . 60)
     ("#992700" . 70)
     ("#a00559" . 85)
     ("#073642" . 100)))
 '(hl-bg-colors
   '("#866300" "#992700" "#a7020a" "#a00559" "#243e9b" "#0061a8" "#007d76" "#5b7300"))
 '(hl-fg-colors
   '("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36"))
 '(hl-paren-colors '("#2aa198" "#b58900" "#268bd2" "#6c71c4" "#859900"))
 '(ivy-sort-functions-alist
   '((magit-completing-read)
     (counsel-minor . ivy-string<)
     (counsel-colors-web . ivy-string<)
     (counsel-unicode-char . ivy-string<)
     (counsel-register . ivy-string<)
     (counsel-mark-ring . ivy-string<)
     (counsel-file-register . ivy-string<)
     (counsel-describe-face . ivy-string<)
     (counsel-info-lookup-symbol . ivy-string<)
     (counsel-apropos . ivy-string<)
     (counsel-describe-symbol . ivy-string<)
     (read-file-name-internal . ivy-sort-file-function-default)
     (t . ivy-string<)))
 '(lsp-auto-guess-root nil)
 '(lsp-eldoc-enable-hover nil)
 '(lsp-eldoc-render-all nil)
 '(lsp-enable-indentation nil)
 '(lsp-signature-auto-activate ''(:on-trigger-char :on-server-request))
 '(lsp-signature-doc-lines 20)
 '(lsp-ui-doc-border "#93a1a1")
 '(lsp-ui-doc-position 'at-point)
 '(lsp-ui-peek-always-show t)
 '(magit-list-refs-sortby "-committerdate")
 '(max-mini-window-height 0.25)
 '(nrepl-message-colors
   '("#dc322f" "#cb4b16" "#b58900" "#5b7300" "#b3c34d" "#0061a8" "#2aa198" "#d33682" "#6c71c4"))
 '(org-adapt-indentation t)
 '(org-capture-templates
   '(("p" "Personal Notes" entry
      (file+headline "~/.notes" "Notes")
      "
* %? - %U" :prepend t :empty-lines-after 1)) t)
 '(org-journal-date-format "%A, %d/%m/%Y")
 '(org-src-lang-modes
   '(("redis" . redis)
     ("php" . php)
     ("arduino" . arduino)
     ("C" . c)
     ("C++" . c++)
     ("asymptote" . asy)
     ("bash" . sh)
     ("beamer" . latex)
     ("calc" . fundamental)
     ("cpp" . c++)
     ("ditaa" . artist)
     ("dot" . fundamental)
     ("elisp" . emacs-lisp)
     ("ocaml" . tuareg)
     ("ruby" . ruby)
     ("screen" . shell-script)
     ("shell" . sh)
     ("sqlite" . sql)))
 '(package-selected-packages
   '(lsp-docker dockerfile-mode yafolding flycheck-plantuml plantuml-mode csv-mode string-inflection yasnippet-snippets lsp-mode ace-window diff-hl avy exec-path-from-shell which-key enh-ruby-mode web-mode expand-region counsel ivy projectile magit volatile-highlights org-journal dired uniquify abbrev s auto-package-update auto-compile use-package))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(ruby-deep-indent-paren-style 'space)
 '(scroll-all-mode nil)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(smie-indent-basic 2)
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(uniquify-buffer-name-style 'forward nil (uniquify))
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   '((20 . "#dc322f")
     (40 . "#cb4466ec20b5")
     (60 . "#c11679431550")
     (80 . "#b58900")
     (100 . "#a6ae8f7c0000")
     (120 . "#9ed992380000")
     (140 . "#96bf94d00000")
     (160 . "#8e5497440000")
     (180 . "#859900")
     (200 . "#77689bfc4636")
     (220 . "#6d449d475bfe")
     (240 . "#5fc09ea47093")
     (260 . "#4c69a01784aa")
     (280 . "#2aa198")
     (300 . "#303598e7affc")
     (320 . "#2fa1947dbb9b")
     (340 . "#2c889009c736")
     (360 . "#268bd2")))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   '(unspecified "#002b36" "#073642" "#a7020a" "#dc322f" "#5b7300" "#859900" "#866300" "#b58900" "#0061a8" "#268bd2" "#a00559" "#d33682" "#007d76" "#2aa198" "#839496" "#657b83"))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"])
 '(yas-global-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
