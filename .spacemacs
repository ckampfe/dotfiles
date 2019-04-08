;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

;; (defun dotspacemacs/user-init ()
;;   "Initialization function for user code.
;; It is called immediately after `dotspacemacs/init', before layer configuration
;; executes.
;;  This function is mostly useful for variables that need to be set
;; before packages are loaded. If you are unsure, you should try in setting them in
;; `dotspacemacs/user-config' first."
;;   (push '("melpa-stable" . "stable.melpa.org/packages/") configuration-layer--elpa-archives)
;;   (push '(use-package . "melpa-stable") package-pinned-packages)
;;   )


(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(ruby
     go
     yaml
     python
     csv
     javascript
     auto-completion
     (clojure :variables clojure-enable-clj-refactor t)
     colors
     docker
     elfeed
     elixir
     elm
     emacs-lisp
     erlang
     git
     go
     html
     ivy
     lsp
     markdown
     ;; ocaml
     org
     osx
     ;; ruby
     restclient
     rust
     scala
     shell
     spotify
     sql
     syntax-checking
     terraform
     themes-megapack
     twitter
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '()
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; File path pointing to emacs 27.1 executable compiled with support
   ;; for the portable dumper (this is currently the branch pdumper).
   ;; (default "emacs-27.0.50")
   dotspacemacs-emacs-pdumper-executable-file "emacs-27.0.50"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
   ;; (default spacemacs.pdmp)
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update t
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progess in `*Messages*' buffer.
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner nil
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(gruvbox-dark-medium
                         apropospriate-dark
                         leuven
                         material-light
                         spacemacs-light
                         apropospriate-light
                         spacemacs-dark
                         solarized-light
                         material)
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Fira Code Retina"
                              :size 14
                              :weight normal
                              :width normal
                              :slant normal
                              :powerline-scale 1.4)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   )

  ;; espace with jk
  (setq-default evil-escape-key-sequence "jk")
  ;; whitespace
  (setq whitespace-style '(face empty tabs lines-tail trailing))

  ;; org format for agenda
  (setq org-agenda-files (list "~/org/*.org"))

  ;; cider don't switch to error buffer on error
  ;; (setq cider-auto-select-error-buffer nil)

  ;; don't show it
  ;; (setq cider-show-error-buffer 'except-in-repl)

  ;; use unicode arrows for <- and =>
  (setq scala-use-unicode-arrows t)

  (desktop-save-mode 1)
  )

(defun dotspacemacs/config ()
  "Configuration function.
  This function is called at the very end of Spacemacs initialization after
  layers configuration."
  ;; line numbers by default
  (global-linum-mode t)
  ;; global indent guide
  (indent-guide-global-mode t)
  ;; line number spacing
  (setq linum-format " %d ")
  ;; Show the fill column by default
  (set-fill-column 90)
  (setq-default fill-column 90)

  (spacemacs/toggle-fill-column-indicator)
  (spacemacs/toggle-auto-fill-mode)
  ;; 2-space indent
  (setq-default indent-tabs-mode nil)
  ;; tab width as two spaces
  (setq-default tab-width 2)
  ;; start company mode
  (company-mode t)
  ;; enable whitespace (global-whitespace-mode)
  ;; set anything below headline level 2 to be rendered as a list,
  ;; instead of as a headline
  (setq org-export-headline-levels 2)
  ;; wordwrap long lines
  ;; (setq spacemacs/toggle-truncate-lines t)
  ;; automatically wrap words past the fill column
  (add-hook 'org-mode-hook 'turn-on-auto-fill)
  ;; turn on visual line mode in org-mode
  (add-hook 'org-mode-hook 'turn-on-visual-line-mode)

  ;; elixir
  (add-hook 'elixir-mode-hook 'alchemist-mode)
  (add-hook 'alchemist-mode-hook 'company-mode)
  (add-hook 'alchemist-mode-hook 'auto-complete-mode)


  ;; elm
  (setq elm-format-on-save t)

  (seq elm-sort-imports-on-save t)
  ;; (elm :variables elm-sort-imports-on-save t)

  ;; rust
  (setq rust-format-on-save t)
  ;; (add-hook 'rust-mode 'eglot-ensure)
  (with-eval-after-load 'lsp-mode
    (setq lsp-rust-rls-command '("rustup" "run" "stable" "rls"))
    (require 'lsp-rust))

  (add-hook 'rust-mode-hook #'lsp-rust-enable)
  (add-hook 'rust-mode-hook #'flycheck-mode)

  ;; go
  (add-hook 'go-mode-hook #'lsp-go-enable)

  ;; crap ruby indent
  (setq ruby-deep-indent-paren nil)

  ;; default major mode to org
  (setq-default major-mode 'org-mode)

  ;; elfeed
  (elfeed :variables rmh-elfeed-org-files (list "~/.emacs.d/private/elfeed1.org"))

  ;; terraform
  (setq 'terraform-mode-hook 'terraform-format-on-save-mode)

  ;; (require 'clojurescript-mode)
)

(defun cider-make-cljs-repl ()
  "Changes the connection type of the repl buffer at point to CLJS."
  (interactive)
  (setq-local cider-repl-type "cljs"))

;; for elisp, like Clojure/Cider's `, e e'
(defun eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
             (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))

;; https://superuser.com/questions/603421/how-to-remove-smart-quotes-in-copy-paste
(defun ck/replace-smart-quotes (beg end)
  "Replace 'smart quotes' in buffer or region with ascii quotes."
  (interactive "r")
  (format-replace-strings '(("\x201C" . "\"")
                            ("\x201D" . "\"")
                            ("\x2018" . "'")
                            ("\x2019" . "'"))
                          nil beg end))

(defun ck/remove-org-links (beg end)
  "remove org links"
  (interactive "r")
  (while (re-search-forward "<a id.*<\/a>" nil t)
    (replace-match "")))

(defun ck/replace-double-spaces-with-single (beg end)
  "replace double spaces with single space"
  (interactive "r")
  (format-replace-strings '(("  " . " "))
                          nil beg end))

(defun ck/remove-md-h2 (beg end)
  "remove second level headings"
  (interactive "r")
  (format-replace-strings '(("## " . ""))
                          nil beg end))

(defun ck/prep-blog (beg end)
  "prep the markdown document for the blog"
  (interactive "r")
  (let ((b 1)
        (e (buffer-end 1)))
    (ck/replace-smart-quotes b e)
    (ck/replace-double-spaces-with-single b e)
    (ck/remove-md-h2 b e)
    (ck/remove-org-links b e)))

(defun todays-notes ()
  "open notes file for today's date"
  (interactive)
  (thread-first
    (substitute-in-file-name "$HOME/notes/")
    (concat (insert-current-date) ".org")
    (find-file)))

(defun insert-current-date ()
  (shell-command-to-string "echo -n $(date +%Y-%m-%d)"))

(defun capture-selection (start end)
  "capture the current selection using cap"
  (interactive "r")
  (let ((capture-text (get-selected-text start end)))
    (shell-command-to-string (concat "cap " "'" capture-text "'"))))

(defun tweet-selection (start end)
  "tweet the current selection using twirl"
  (interactive "r")
  (let ((tweet-text (get-selected-text start end)))
    (shell-command-to-string (concat "twirl " "'" tweet-text "'"))))

(defun get-selected-text (start end)
  (interactive "r")
  (if (use-region-p)
      (let ((regionp (buffer-substring start end)))
        regionp)))

;;----------------------------------------------------------------------------
;; Reason setup
;;----------------------------------------------------------------------------

(defun shell-cmd (cmd)
  "Returns the stdout output of a shell command or nil if the command returned
   an error"
  (car (ignore-errors (apply 'process-lines (split-string cmd)))))

(defun reason-cmd-where (cmd)
  (let ((where (shell-cmd cmd)))
    (if (not (string-equal "unknown flag ----where" where))
      where)))

;;----------------
;; END REASON
;;----------------

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."

  ;; (let* ((refmt-bin (or (reason-cmd-where "refmt ----where")
  ;;                       (shell-cmd "which refmt")))
  ;;        (merlin-bin (or (reason-cmd-where "ocamlmerlin ----where")
  ;;                        (shell-cmd "which ocamlmerlin")))
  ;;        (merlin-base-dir (when merlin-bin
  ;;                           (replace-regexp-in-string "bin/ocamlmerlin$" "" merlin-bin))))
  ;;   ;; Add merlin.el to the emacs load path and tell emacs where to find ocamlmerlin
  ;;   (when merlin-bin
  ;;     (add-to-list 'load-path (concat merlin-base-dir "share/emacs/site-lisp/"))
  ;;     (setq merlin-command merlin-bin))

  ;;   (when refmt-bin
  ;;     (setq refmt-command refmt-bin)))

  ;; (require 'reason-mode)

  ;; (require 'merlin)

  ;; (add-hook 'reason-mode-hook (lambda ()
  ;;                               (add-hook 'before-save-hook 'refmt-before-save)
  ;;                               (merlin-mode)))

  ;; (setq merlin-ac-setup t)


  (setq explicit-shell-file-name "/usr/local/bin/zsh")

  (defun bb/setup-term-mode ()
    (evil-local-set-key 'insert (kbd "C-r") 'bb/send-C-r))

  (defun bb/send-C-r ()
    (interactive)
    (term-send-raw-string "\C-r"))

  (add-hook 'term-mode-hook 'bb/setup-term-mode)

  ;; set thread first/last for clj/cljs
  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "rtl" 'clojure-thread-last-all)

  (spacemacs/set-leader-keys-for-major-mode 'clojure-mode "rtf" 'clojure-thread-first-all)

  (spacemacs/set-leader-keys-for-major-mode 'clojurescript-mode "rtl" 'clojure-thread-last-all)

  (spacemacs/set-leader-keys-for-major-mode 'clojurescript-mode "rtf" 'clojure-thread-first-all)


  )

;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
;; (default '("rg" "ag" "pt" "ack" "grep"))
dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ahs-case-fold-search nil t)
 '(ahs-default-range (quote ahs-range-whole-buffer) t)
 '(ahs-idle-interval 0.25 t)
 '(ahs-idle-timer 0 t)
 '(ahs-inhibit-face-list nil t)
 '(cider-auto-select-test-report-buffer nil)
 '(cider-boot-command "boot")
 '(cider-boot-parameters "repl -s wait")
 '(cider-cljs-boot-repl
   "(do (require 'cljs.repl.node) (cemerick.piggieback/cljs-repl (cljs.repl.node/repl-env)))")
 '(cider-cljs-lein-repl
   "(do (require 'cljs.repl.node) (cemerick.piggieback/cljs-repl (cljs.repl.node/repl-env)))")
 '(cider-prompt-for-project-on-connect t)
 '(cider-show-error-buffer (quote except-in-repl))
 '(elfeed-feeds (quote (("http://zeroclarkthirty.com/feed"))))
 '(ensime-startup-notification nil)
 '(js-indent-level 2)
 '(org-agenda-files nil)
 '(package-selected-packages
   (quote
    (treepy graphql sesman spotify emojify white-sand-theme rebecca-theme org-mime exotica-theme elfeed-web elfeed-org elfeed-goodies ace-jump-mode elfeed dockerfile-mode docker tablist docker-tramp ghub let-alist terraform-mode hcl-mode ob-restclient company-restclient restclient ob-http know-your-http-well org-category-capture toxi-theme winum solarized-theme madhat2r-theme fuzzy flycheck-credo autothemer phpunit phpcbf php-auto-yasnippets drupal-mode php-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode haml-mode emmet-mode company-web web-completion-data csv-mode ob-elixir minitest hide-comnt go-guru wgrep smex ivy-hydra counsel-projectile counsel swiper ivy web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor js2-mode js-doc company-tern dash-functional tern coffee-mode yapfify uuidgen caml powerline py-isort pcre2el osx-dictionary org-projectile org alert log4e gntp org-download markdown-mode live-py-mode link-hint parent-mode request gitignore-mode github-search gh logito pcache pos-tip flycheck-mix flx eyebrowse evil-visual-mark-mode evil-unimpaired iedit evil-ediff anzu evil goto-chg undo-tree eshell-z sbt-mode dumb-jump diminish darkokai-theme go-mode company-emacs-eclim eclim column-enforce-mode color-identifiers-mode clojure-snippets hydra inflections edn multiple-cursors paredit peg eval-sexp-fu highlight seq spinner queue cargo rust-mode inf-ruby bind-map bind-key yasnippet packed anaconda-mode pythonic f s company elixir-mode pkg-info epl avy async auto-complete popup clojure-mode projectile scala-mode smartparens magit-popup with-editor dash package-build flycheck helm helm-core marshal ht rake cider magit zonokai-theme zenburn-theme zen-and-art-theme yaml-mode xterm-color ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe utop use-package underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tuareg tronesque-theme toml-mode toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme swift-mode sunny-day-theme sublime-themes subatomic256-theme subatomic-theme stekene-theme sql-indent spacemacs-theme spaceline spacegray-theme soothe-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smooth-scrolling smeargle shell-pop seti-theme rvm ruby-tools ruby-test-mode ruby-end rubocop rspec-mode robe reverse-theme reveal-in-osx-finder restart-emacs rbenv rainbow-mode rainbow-identifiers rainbow-delimiters railscasts-theme racer quelpa pyvenv pytest pyenv-mode py-yapf purple-haze-theme projectile-rails professional-theme popwin planet-theme pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pbcopy pastels-on-dark-theme paradox page-break-lines osx-trash orgit organic-green-theme org-repo-todo org-present org-pomodoro org-plus-contrib org-bullets open-junk-file omtose-phellack-theme oldlace-theme ocp-indent occidental-theme obsidian-theme noflet noctilux-theme niflheim-theme neotree naquadah-theme mustang-theme multi-term move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme merlin material-theme markdown-toc majapahit-theme magit-gitflow magit-gh-pulls macrostep lush-theme lorem-ipsum linum-relative light-soap-theme leuven-theme launchctl jbeans-theme jazz-theme ir-black-theme inkpot-theme info+ indent-guide ido-vertical-mode hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation heroku-theme hemisu-theme help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio go-eldoc gnuplot github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-commit gist gh-md gandalf-theme flycheck-rust flycheck-pos-tip flycheck-elm flx-ido flatui-theme flatland-theme firebelly-theme fill-column-indicator feature-mode farmhouse-theme fancy-battery expand-region exec-path-from-shell evil-visualstar evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-args evil-anzu espresso-theme eshell-prompt-extras esh-help erlang ensime emacs-eclim elm-mode elisp-slime-nav dracula-theme django-theme define-word darktooth-theme darkmine-theme darkburn-theme dakrone-theme cython-mode cyberpunk-theme company-statistics company-racer company-quickhelp company-go company-anaconda colorsarenice-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme clj-refactor clean-aindent-mode cider-eval-sexp-fu chruby cherry-blossom-theme busybee-theme bundler buffer-move bubbleberry-theme bracketed-paste birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-compile apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes alchemist aggressive-indent afternoon-theme adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(ring-bell-function (quote ignore)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ahs-case-fold-search nil t)
 '(ahs-default-range (quote ahs-range-whole-buffer) t)
 '(ahs-idle-interval 0.25 t)
 '(ahs-idle-timer 0 t)
 '(ahs-inhibit-face-list nil t)
 '(cider-auto-select-test-report-buffer nil)
 '(cider-boot-command "boot")
 '(cider-boot-parameters "repl -s wait")
 '(cider-cljs-boot-repl
   "(do (require 'cljs.repl.node) (cemerick.piggieback/cljs-repl (cljs.repl.node/repl-env)))")
 '(cider-cljs-lein-repl
   "(do (require 'cljs.repl.node) (cemerick.piggieback/cljs-repl (cljs.repl.node/repl-env)))")
 '(cider-prompt-for-project-on-connect t)
 '(cider-show-error-buffer (quote except-in-repl))
 '(elfeed-feeds (quote (("http://zeroclarkthirty.com/feed"))))
 '(ensime-startup-notification nil)
 '(js-indent-level 2)
 '(org-agenda-files nil)
 '(package-selected-packages
   (quote
    (lv treepy graphql sesman spotify emojify white-sand-theme rebecca-theme org-mime exotica-theme elfeed-web elfeed-org elfeed-goodies ace-jump-mode elfeed dockerfile-mode docker tablist docker-tramp ghub let-alist terraform-mode hcl-mode ob-restclient company-restclient restclient ob-http know-your-http-well org-category-capture toxi-theme winum solarized-theme madhat2r-theme fuzzy flycheck-credo autothemer phpunit phpcbf php-auto-yasnippets drupal-mode php-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode haml-mode emmet-mode company-web web-completion-data csv-mode ob-elixir minitest hide-comnt go-guru wgrep smex ivy-hydra counsel-projectile counsel swiper ivy web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor js2-mode js-doc company-tern dash-functional tern coffee-mode yapfify uuidgen caml powerline py-isort pcre2el osx-dictionary org-projectile org alert log4e gntp org-download markdown-mode live-py-mode link-hint parent-mode request gitignore-mode github-search gh logito pcache pos-tip flycheck-mix flx eyebrowse evil-visual-mark-mode evil-unimpaired iedit evil-ediff anzu evil goto-chg undo-tree eshell-z sbt-mode dumb-jump diminish darkokai-theme go-mode company-emacs-eclim eclim column-enforce-mode color-identifiers-mode clojure-snippets hydra inflections edn multiple-cursors paredit peg eval-sexp-fu highlight seq spinner queue cargo rust-mode inf-ruby bind-map bind-key yasnippet packed anaconda-mode pythonic f s company elixir-mode pkg-info epl avy async auto-complete popup clojure-mode projectile scala-mode smartparens magit-popup with-editor dash package-build flycheck helm helm-core marshal ht rake cider magit zonokai-theme zenburn-theme zen-and-art-theme yaml-mode xterm-color ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe utop use-package underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tuareg tronesque-theme toml-mode toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme swift-mode sunny-day-theme sublime-themes subatomic256-theme subatomic-theme stekene-theme sql-indent spacemacs-theme spaceline spacegray-theme soothe-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smooth-scrolling smeargle shell-pop seti-theme rvm ruby-tools ruby-test-mode ruby-end rubocop rspec-mode robe reverse-theme reveal-in-osx-finder restart-emacs rbenv rainbow-mode rainbow-identifiers rainbow-delimiters railscasts-theme racer quelpa pyvenv pytest pyenv-mode py-yapf purple-haze-theme projectile-rails professional-theme popwin planet-theme pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pbcopy pastels-on-dark-theme paradox page-break-lines osx-trash orgit organic-green-theme org-repo-todo org-present org-pomodoro org-plus-contrib org-bullets open-junk-file omtose-phellack-theme oldlace-theme ocp-indent occidental-theme obsidian-theme noflet noctilux-theme niflheim-theme neotree naquadah-theme mustang-theme multi-term move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme merlin material-theme markdown-toc majapahit-theme magit-gitflow magit-gh-pulls macrostep lush-theme lorem-ipsum linum-relative light-soap-theme leuven-theme launchctl jbeans-theme jazz-theme ir-black-theme inkpot-theme info+ indent-guide ido-vertical-mode hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation heroku-theme hemisu-theme help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio go-eldoc gnuplot github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-commit gist gh-md gandalf-theme flycheck-rust flycheck-pos-tip flycheck-elm flx-ido flatui-theme flatland-theme firebelly-theme fill-column-indicator feature-mode farmhouse-theme fancy-battery expand-region exec-path-from-shell evil-visualstar evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-args evil-anzu espresso-theme eshell-prompt-extras esh-help erlang ensime emacs-eclim elm-mode elisp-slime-nav dracula-theme django-theme define-word darktooth-theme darkmine-theme darkburn-theme dakrone-theme cython-mode cyberpunk-theme company-statistics company-racer company-quickhelp company-go company-anaconda colorsarenice-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme clj-refactor clean-aindent-mode cider-eval-sexp-fu chruby cherry-blossom-theme busybee-theme bundler buffer-move bubbleberry-theme bracketed-paste birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-compile apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes alchemist aggressive-indent afternoon-theme adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(ring-bell-function (quote ignore)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
