;; packages
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

(defun require-package (package)
  (setq-default highlight-tabs t)
  "Install given PACKAGE."
  (unless (package-installed-p package)
    (unless (assoc package package-archive-contents)
      (package-refresh-contents))
    (package-install package)))

;; make themes look better
(color-theme-approximate-on)

;; theme
(load-theme 'misterioso t)

;; evil mode
(require 'evil)
(evil-mode 1)

;; evil tabs
(global-evil-tabs-mode t)

(global-evil-leader-mode)
(evil-leader/set-leader ",")

;; evil-surround (like vim-surround)
(require 'evil-surround)
(global-evil-surround-mode 1)

;; powerline
(require 'powerline)
(powerline-default-theme)
(display-time-mode t)

;; jk as esc for evil-mode
(require 'key-chord)
(setq key-chord-two-keys-delay 0.3)
(key-chord-define evil-insert-state-map  "jk" 'evil-normal-state)
(key-chord-mode 1)

;; smooth scrolling
(require 'smooth-scrolling)
(setq smooth-scroll-margin 5)
(setq scroll-conservatively 9999
      scroll-preserve-screen-position t)

;; line numbers
(global-linum-mode 1)

;; spacing to the right of line numbers
(defun linum-format-func (line)
  (let ((w (length (number-to-string (count-lines (point-min) (point-max))))))
     (propertize (format (format "%%%dd " w) line) 'face 'linum)))
(setq linum-format 'linum-format-func)

(require 'projectile)
(projectile-global-mode)

;; helm settings (TAB in helm window for actions over selected items,
;; C-SPC to select items)
(require 'helm-config)
(require 'helm-misc)
(require 'helm-projectile)
(require 'helm-locate)
(setq helm-quick-update t)
(setq helm-bookmark-show-location t)
(setq helm-buffers-fuzzy-matching t)

;; (after 'projectile
;;   (package 'helm-projectile))
(global-set-key (kbd "M-x") 'helm-M-x)

(defun helm-my-buffers ()
  (interactive)
  (helm-other-buffer '(helm-c-source-buffers-list
                       helm-c-source-elscreen
                       helm-c-source-projectile-files-list
                       helm-c-source-ctags
                       helm-c-source-recentf
                       helm-c-source-locate)
                     "*helm-my-buffers*"))

;; trailing whitespace and 80-char column overflow highlighting
(require 'whitespace)
(setq whitespace-style '(face empty tabs lines-tail trailing))
(global-whitespace-mode t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(scala-mode-fontlock:multiline-highlight t)
 '(scala-mode-indent:dot-indent t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
