(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#839496"])
 '(compilation-message-face 'default)
 '(counsel-projectile-preview-buffers nil)
 '(counsel-switch-buffer-preview-virtual-buffers nil)
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   '("7f1d414afda803f3244c6fb4c2c64bea44dac040ed3731ec9d75275b9e831fe5"
     "4c56af497ddf0e30f65a7232a8ee21b3d62a8c332c6b268c81e9ea99b11da0d3"
     "fee7287586b17efbfda432f05539b58e86e059e78006ce9237b8732fde991b4c" default))
 '(ediff-window-setup-function 'ediff-setup-windows-plain)
 '(eglot-connect-timeout nil)
 '(eldoc-idle-delay 3)
 '(enh-ruby-bounce-deep-indent nil)
 '(enh-ruby-deep-indent-construct nil)
 '(fci-rule-color "#073642")
 '(flymake-no-changes-timeout 0.5)
 '(help-at-pt-timer-delay 3)
 '(highlight-changes-colors '("#d33682" "#6c71c4"))
 '(highlight-symbol-colors
   '("#3b6b40f432d7" "#07b9463d4d37" "#47a3341f358a" "#1d873c4056d5"
     "#2d87441c3362" "#43b7362e3199" "#061e418059d7"))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   '(("#073642" . 0) ("#5b7300" . 20) ("#007d76" . 30) ("#0061a8" . 50)
     ("#866300" . 60) ("#992700" . 70) ("#a00559" . 85) ("#073642" . 100)))
 '(hl-bg-colors
   '("#866300" "#992700" "#a7020a" "#a00559" "#243e9b" "#0061a8" "#007d76"
     "#5b7300"))
 '(hl-fg-colors
   '("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36"
     "#002b36"))
 '(hl-paren-colors '("#2aa198" "#b58900" "#268bd2" "#6c71c4" "#859900"))
 '(ivy-sort-functions-alist
   '((magit-completing-read) (counsel-minor . ivy-string<)
     (counsel-colors-web . ivy-string<) (counsel-unicode-char . ivy-string<)
     (counsel-register . ivy-string<) (counsel-mark-ring . ivy-string<)
     (counsel-file-register . ivy-string<) (counsel-describe-face . ivy-string<)
     (counsel-info-lookup-symbol . ivy-string<) (counsel-apropos . ivy-string<)
     (counsel-describe-symbol . ivy-string<)
     (read-file-name-internal . ivy-sort-file-function-default)
     (t . ivy-string<)))
 '(lsp-auto-guess-root nil)
 '(lsp-completion-provider :none)
 '(lsp-disabled-clients '(ruby-ls rubocop-ls))
 '(lsp-document-sync-method nil)
 '(lsp-eldoc-enable-hover nil)
 '(lsp-eldoc-render-all nil)
 '(lsp-enable-indentation nil)
 '(lsp-file-watch-ignored-directories
   '("[/\\\\]\\.git\\'" "[/\\\\]\\.github\\'" "[/\\\\]\\.gitlab\\'"
     "[/\\\\]\\.circleci\\'" "[/\\\\]\\.hg\\'" "[/\\\\]\\.bzr\\'"
     "[/\\\\]_darcs\\'" "[/\\\\]\\.svn\\'" "[/\\\\]_FOSSIL_\\'"
     "[/\\\\]\\.idea\\'" "[/\\\\]\\.ensime_cache\\'" "[/\\\\]\\.eunit\\'"
     "[/\\\\]node_modules" "[/\\\\]\\.yarn\\'" "[/\\\\]\\.fslckout\\'"
     "[/\\\\]\\.tox\\'" "[/\\\\]\\.nox\\'" "[/\\\\]dist\\'"
     "[/\\\\]dist-newstyle\\'" "[/\\\\]\\.stack-work\\'" "[/\\\\]\\.bloop\\'"
     "[/\\\\]\\.metals\\'" "[/\\\\]target\\'" "[/\\\\]\\.ccls-cache\\'"
     "[/\\\\]\\.vs\\'" "[/\\\\]\\.vscode\\'" "[/\\\\]\\.venv\\'"
     "[/\\\\]\\.mypy_cache\\'" "[/\\\\]\\.pytest_cache\\'" "[/\\\\]\\.build\\'"
     "[/\\\\]__pycache__\\'" "[/\\\\]\\.deps\\'" "[/\\\\]build-aux\\'"
     "[/\\\\]autom4te.cache\\'" "[/\\\\]\\.reference\\'"
     "[/\\\\]bazel-[^/\\\\]+\\'" "[/\\\\]\\.cache[/\\\\]lsp-csharp\\'"
     "[/\\\\]\\.meta\\'" "[/\\\\]\\.nuget\\'" "[/\\\\]Library\\'"
     "[/\\\\]\\.lsp\\'" "[/\\\\]\\.clj-kondo\\'" "[/\\\\]\\.shadow-cljs\\'"
     "[/\\\\]\\.babel_cache\\'" "[/\\\\]\\.cpcache\\'" "[/\\\\]\\checkouts\\'"
     "[/\\\\]\\.gradle\\'" "[/\\\\]\\.m2\\'" "[/\\\\]bin/Debug\\'"
     "[/\\\\]obj\\'" "[/\\\\]_opam\\'" "[/\\\\]_build\\'"
     "[/\\\\]\\.elixir_ls\\'" "[/\\\\]\\.elixir-tools\\'"
     "[/\\\\]\\.terraform\\'" "[/\\\\]\\.terragrunt-cache\\'" "[/\\\\]\\result"
     "[/\\\\]\\result-bin" "[/\\\\]\\.direnv\\'" "[/\\\\]\\.devbox\\'"
     "[/\\\\]\\vendor"))
 '(lsp-signature-auto-activate '(:on-trigger-char :on-server-request))
 '(lsp-signature-doc-lines 20)
 '(lsp-steep-log-level "warn")
 '(lsp-steep-use-bundler t)
 '(lsp-ui-doc-border "#586e75")
 '(lsp-ui-doc-delay 3)
 '(lsp-ui-doc-include-signature t)
 '(lsp-ui-doc-position 'at-point)
 '(lsp-ui-doc-show-with-cursor t)
 '(lsp-ui-peek-always-show t)
 '(lsp-ui-sideline-diagnostic-max-lines 10)
 '(magit-git-executable "git")
 '(magit-list-refs-sortby "-committerdate")
 '(max-mini-window-height 0.25)
 '(nrepl-message-colors
   '("#dc322f" "#cb4b16" "#b58900" "#5b7300" "#b3c34d" "#0061a8" "#2aa198"
     "#d33682" "#6c71c4"))
 '(org-adapt-indentation t)
 '(org-agenda-files
   '("/Users/ando/Documents/journal/20230612.org"
     "/Users/ando/Documents/journal/20220704.org"
     "/Users/ando/Documents/journal/20220705.org"
     "/Users/ando/Documents/journal/20220706.org"
     "/Users/ando/Documents/journal/20220707.org"
     "/Users/ando/Documents/journal/20220711.org"
     "/Users/ando/Documents/journal/20220712.org"
     "/Users/ando/Documents/journal/20220713.org"
     "/Users/ando/Documents/journal/20220714.org"
     "/Users/ando/Documents/journal/20220715.org"
     "/Users/ando/Documents/journal/20220719.org"
     "/Users/ando/Documents/journal/20220804.org"
     "/Users/ando/Documents/journal/20220812.org"
     "/Users/ando/Documents/journal/20220815.org"
     "/Users/ando/Documents/journal/20220816.org"
     "/Users/ando/Documents/journal/20220824.org"
     "/Users/ando/Documents/journal/20220825.org"
     "/Users/ando/Documents/journal/20220826.org"
     "/Users/ando/Documents/journal/20220829.org"
     "/Users/ando/Documents/journal/20220830.org"
     "/Users/ando/Documents/journal/20220831.org"
     "/Users/ando/Documents/journal/20220901.org"
     "/Users/ando/Documents/journal/20220902.org"
     "/Users/ando/Documents/journal/20220905.org"
     "/Users/ando/Documents/journal/20220906.org"
     "/Users/ando/Documents/journal/20220907.org"
     "/Users/ando/Documents/journal/20220908.org"
     "/Users/ando/Documents/journal/20220909.org"
     "/Users/ando/Documents/journal/20220914.org"
     "/Users/ando/Documents/journal/20220915.org"
     "/Users/ando/Documents/journal/20220916.org"
     "/Users/ando/Documents/journal/20220919.org"
     "/Users/ando/Documents/journal/20220920.org"
     "/Users/ando/Documents/journal/20220921.org"
     "/Users/ando/Documents/journal/20220922.org"
     "/Users/ando/Documents/journal/20220923.org"
     "/Users/ando/Documents/journal/20220928.org"
     "/Users/ando/Documents/journal/20220929.org"
     "/Users/ando/Documents/journal/20221004.org"
     "/Users/ando/Documents/journal/20221005.org"
     "/Users/ando/Documents/journal/20221006.org"
     "/Users/ando/Documents/journal/20221007.org"
     "/Users/ando/Documents/journal/20221107.org"
     "/Users/ando/Documents/journal/20221109.org"
     "/Users/ando/Documents/journal/20221110.org"
     "/Users/ando/Documents/journal/20221114.org"
     "/Users/ando/Documents/journal/20221115.org"
     "/Users/ando/Documents/journal/20221123.org"
     "/Users/ando/Documents/journal/20221129.org"
     "/Users/ando/Documents/journal/20221202.org"
     "/Users/ando/Documents/journal/20221205.org"
     "/Users/ando/Documents/journal/20221206.org"
     "/Users/ando/Documents/journal/20221208.org"
     "/Users/ando/Documents/journal/20221214.org"
     "/Users/ando/Documents/journal/20221215.org"
     "/Users/ando/Documents/journal/20221219.org"
     "/Users/ando/Documents/journal/20221220.org"
     "/Users/ando/Documents/journal/20221221.org"
     "/Users/ando/Documents/journal/20221222.org"
     "/Users/ando/Documents/journal/20230103.org"
     "/Users/ando/Documents/journal/20230104.org"
     "/Users/ando/Documents/journal/20230109.org"
     "/Users/ando/Documents/journal/20230111.org"
     "/Users/ando/Documents/journal/20230118.org"
     "/Users/ando/Documents/journal/20230119.org"
     "/Users/ando/Documents/journal/20230207.org"
     "/Users/ando/Documents/journal/20230208.org"
     "/Users/ando/Documents/journal/20230215.org"
     "/Users/ando/Documents/journal/20230216.org"
     "/Users/ando/Documents/journal/20230220.org"
     "/Users/ando/Documents/journal/20230221.org"
     "/Users/ando/Documents/journal/20230222.org"
     "/Users/ando/Documents/journal/20230223.org"
     "/Users/ando/Documents/journal/20230224.org"
     "/Users/ando/Documents/journal/20230227.org"
     "/Users/ando/Documents/journal/20230228.org"
     "/Users/ando/Documents/journal/20230301.org"
     "/Users/ando/Documents/journal/20230302.org"
     "/Users/ando/Documents/journal/20230303.org"
     "/Users/ando/Documents/journal/20230306.org"
     "/Users/ando/Documents/journal/20230307.org"
     "/Users/ando/Documents/journal/20230308.org"
     "/Users/ando/Documents/journal/20230313.org"
     "/Users/ando/Documents/journal/20230314.org"
     "/Users/ando/Documents/journal/20230315.org"
     "/Users/ando/Documents/journal/20230316.org"
     "/Users/ando/Documents/journal/20230320.org"
     "/Users/ando/Documents/journal/20230321.org"
     "/Users/ando/Documents/journal/20230322.org"
     "/Users/ando/Documents/journal/20230323.org"
     "/Users/ando/Documents/journal/20230324.org"
     "/Users/ando/Documents/journal/20230327.org"
     "/Users/ando/Documents/journal/20230328.org"
     "/Users/ando/Documents/journal/20230329.org"
     "/Users/ando/Documents/journal/20230330.org"
     "/Users/ando/Documents/journal/20230331.org"
     "/Users/ando/Documents/journal/20230403.org"
     "/Users/ando/Documents/journal/20230404.org"
     "/Users/ando/Documents/journal/20230405.org"
     "/Users/ando/Documents/journal/20230406.org"
     "/Users/ando/Documents/journal/20230412.org"
     "/Users/ando/Documents/journal/20230413.org"
     "/Users/ando/Documents/journal/20230417.org"
     "/Users/ando/Documents/journal/20230418.org"
     "/Users/ando/Documents/journal/20230419.org"
     "/Users/ando/Documents/journal/20230420.org"
     "/Users/ando/Documents/journal/20230426.org"
     "/Users/ando/Documents/journal/20230427.org"
     "/Users/ando/Documents/journal/20230502.org"
     "/Users/ando/Documents/journal/20230503.org"
     "/Users/ando/Documents/journal/20230509.org"
     "/Users/ando/Documents/journal/20230510.org"
     "/Users/ando/Documents/journal/20230518.org"
     "/Users/ando/Documents/journal/20230522.org"
     "/Users/ando/Documents/journal/20230525.org"
     "/Users/ando/Documents/journal/20230531.org"
     "/Users/ando/Documents/journal/20230601.org"
     "/Users/ando/Documents/journal/20230605.org"
     "/Users/ando/Documents/journal/20230606.org"
     "/Users/ando/Documents/journal/20230607.org"))
 '(org-edit-src-content-indentation 2)
 '(org-excalidraw-directory "~/Documents/notes/drawings")
 '(org-journal-carryover-items "TODO=\"TODO\"-carried")
 '(org-journal-date-format "%A, %d/%m/%Y")
 '(org-journal-file-format "%Y%m%d.org")
 '(org-journal-hide-entries-p t)
 '(org-journal-time-format "%R\12")
 '(org-journal-time-prefix "\12** ")
 '(org-src-lang-modes
   '(("redis" . redis) ("php" . php) ("arduino" . arduino) ("C" . c) ("C++" . c++)
     ("asymptote" . asy) ("bash" . sh) ("beamer" . latex) ("calc" . fundamental)
     ("cpp" . c++) ("ditaa" . artist) ("dot" . fundamental)
     ("elisp" . emacs-lisp) ("ocaml" . tuareg) ("ruby" . ruby)
     ("screen" . shell-script) ("shell" . sh) ("sqlite" . sql)))
 '(org-src-preserve-indentation t)
 '(org-startup-folded 'show3levels)
 '(org-startup-indented t)
 '(package-selected-packages nil)
 '(package-vc-selected-packages
   '((claude-code :url "https://github.com/stevemolitor/claude-code.el")
     (claude-code-ide :url "https://github.com/manzaltu/claude-code-ide.el")
     (copilot :url "https://github.com/copilot-emacs/copilot.el" :branch "main")))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(project-vc-extra-root-markers '("\"~/ca/gs/kotlin-src/.dir-locals.el"))
 '(projectile-indexing-method 'hybrid)
 '(ruby-deep-indent-paren-style 'space)
 '(ruby-method-call-indent nil)
 '(ruby-method-params-indent 0.0)
 '(safe-local-variable-values
   '((eglot-workspace-folders "/Users/ando/ca/goals-service/kotlin-src")
     (magit-refresh-buffers) (lsp-enabled-clients ts-ls)))
 '(scroll-all-mode nil)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(smie-indent-basic 2)
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(tree-sitter-major-mode-language-alist
   '((agda2-mode . agda) (sh-mode . bash) (c-mode . c) (caml-mode . ocaml)
     (clojure-mode . clojure) (csharp-mode . c-sharp) (c++-mode . cpp)
     (d-mode . d) (css-mode . css) (elm-mode . elm) (elixir-mode . elixir)
     (erlang-mode . erlang) (ess-r-mode . r) (fennel-mode . fennel)
     (go-mode . go) (haskell-mode . haskell) (hcl-mode . hcl)
     (terraform-mode . hcl) (html-mode . html) (markdown-mode . markdown)
     (mhtml-mode . html) (nix-mode . nix) (java-mode . java)
     (javascript-mode . javascript) (js-mode . javascript)
     (js2-mode . javascript) (js3-mode . javascript) (json-mode . json)
     (jsonc-mode . json) (julia-mode . julia) (lua-mode . lua)
     (meson-mode . meson) (ocaml-mode . ocaml) (perl-mode . perl)
     (php-mode . php) (prisma-mode . prisma) (python-mode . python)
     (pygn-mode . pgn) (rjsx-mode . javascript) (enh-ruby-mode . ruby)
     (ruby-ts-mode . ruby) (ruby-mode . ruby) (rust-mode . rust)
     (rustic-mode . rust) (scala-mode . scala) (scheme-mode . scheme)
     (swift-mode . swift) (toml-mode . toml) (tuareg-mode . ocaml)
     (typescript-mode . typescript) (verilog-mode . verilog) (yaml-mode . yaml)
     (zig-mode . zig)))
 '(typescript-indent-level 2 t)
 '(uniquify-buffer-name-style 'forward nil (uniquify))
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   '((20 . "#dc322f") (40 . "#cb4466ec20b5") (60 . "#c11679431550")
     (80 . "#b58900") (100 . "#a6ae8f7c0000") (120 . "#9ed992380000")
     (140 . "#96bf94d00000") (160 . "#8e5497440000") (180 . "#859900")
     (200 . "#77689bfc4636") (220 . "#6d449d475bfe") (240 . "#5fc09ea47093")
     (260 . "#4c69a01784aa") (280 . "#2aa198") (300 . "#303598e7affc")
     (320 . "#2fa1947dbb9b") (340 . "#2c889009c736") (360 . "#268bd2")))
 '(vc-annotate-very-old-color nil)
 '(warning-suppress-types
   '((copilot copilot-no-mode-indent) (copilot copilot-no-mode-indent)))
 '(web-mode-enable-comment-annotation t)
 '(weechat-color-list
   '(unspecified "#002b36" "#073642" "#a7020a" "#dc322f" "#5b7300" "#859900"
                 "#866300" "#b58900" "#0061a8" "#268bd2" "#a00559" "#d33682"
                 "#007d76" "#2aa198" "#839496" "#657b83"))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"])
 '(yas-snippet-dirs '("/Users/ando/.emacs.d/snippets" yasnippet-snippets-dir)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
