;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;; (setq doom-font (font-spec :family "Fira Code" :size 14 :weight 'normal))
(setq doom-font (font-spec :family "JetBrains Mono" :size 14 :weight 'normal))

;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'tsdh-light)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; Enable smooth scrolling
(setq pixel-scroll-precision-mode t)

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(after! cider
  (set-popup-rules!
    '(("^\\*cider-repl"
       :side left
       :width 75
       :quit nil
       :ttl nil))))

(after! rustic
  (setq lsp-idle-delay 0.250 ;; how often lsp will refresh highlights/definitions while typing, in seconds
        lsp-rust-analyzer-server-display-inlay-hints t
        lsp-rust-analyzer-cargo-watch-command "clippy"
        lsp-rust-analyzer-display-chaining-hints t
        lsp-rust-analyzer-display-closure-return-type-hints t))

;; my custom functions

(setq notes-dir-macos "~/Library/Mobile Documents/com~apple~CloudDocs/notes/"
      notes-timestamp-format "%Y%m%d%H%M%S%3N")

(defun ck/new-note (&optional prefix)
  "make a new note"
  (interactive)
  (let* ((dir notes-dir-macos)
         (now (format-time-string notes-timestamp-format (current-time) t))
         (filename (if prefix
                       (concat prefix "-" now ".md")
                     (concat now ".md")))
         (buf (create-file-buffer filename)))
    (switch-to-buffer buf)
    (setq-local default-directory dir)
    (markdown-mode)
    filename))

(defun ck/new-note-with-region (start end &optional prefix)
  "make a new note with the current region as its contents"
  (interactive "r") ;; "r" for region, which adds the start and end params
  (let* ((dir notes-dir-macos)
         (now (format-time-string notes-timestamp-format (current-time) t))
         (filename (if prefix
                       (concat prefix "-" now ".md")
                     (concat now ".md")))
         (buf (create-file-buffer filename))
         (s (buffer-substring-no-properties start end)))
    (switch-to-buffer buf)
    (setq-local default-directory dir)
    (markdown-mode)
    (insert s)))

(defmacro ck/comment (&rest _body)
  "Comment out one or more s-expressions."
  nil)

(defun ck/range (start &optional end step)
  "like clojure's, but not infinite https://clojuredocs.org/clojure.core/range"
  (if end
      (cond ((> end 0) (number-sequence start (- end 1) step))
            ((= end 0) (number-sequence start (- end (or step 1)) step))
            (t         (number-sequence start (+ end 1) step)))
    (number-sequence 0 (- start 1) step)))

(ert-deftest ck/range-test ()
  (should (equal (ck/range 0) nil))
  (should (equal (ck/range 5) '(0 1 2 3 4)))
  (should (equal (ck/range 0 4 2) '(0 2)))
  (should (equal (ck/range 0 5 2) '(0 2 4)))
  (should (equal (ck/range 0 6 2) '(0 2 4)))
  (should (equal (ck/range 0 7 2) '(0 2 4 6)))
  (should (equal (ck/range -5 5) '(-5 -4 -3 -2 -1 0 1 2 3 4)))
  (should (equal (ck/range -5 0) '(-5 -4 -3 -2 -1)))
  (should (equal (ck/range 10 -10 -1)
                 '(10 9 8 7 6 5 4 3 2 1 0 -1 -2 -3 -4 -5 -6 -7 -8 -9)))
  (should (equal (ck/range 100 0 -10)
                 '(100 90 80 70 60 50 40 30 20 10)))
  (should (equal (ck/range -100 100 10)
                 '(-100 -90 -80 -70 -60 -50 -40 -30 -20 -10 0 10 20 30 40 50 60 70 80 90))))
