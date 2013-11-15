(add-to-list 'load-path "~/.emacs.d")
(require 'package)
(require 'cl)

(add-to-list 'package-archives
  '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(defvar my-packages '(;; starter-kit
                      ;; starter-kit-lisp
                      clojure-mode
                      clojure-test-mode
                      paredit
                      nrepl))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(when (not package-archive-contents)
  (package-refresh-contents))

;; change meta key. For Ubuntu only!
(setq x-super-keysym 'meta)

;; configuration on faces.
(set-face-font 'default "Liberation Mono")
(set-face-attribute 'default nil :width 'condensed :height 100)

;; add to exec path
(setenv "PATH" (concat (getenv "PATH") (concat ":" (getenv "HOME") "/cmd")))
(setq exec-path (append exec-path '(concat (getenv "HOME") "/cmd")))

;; set tab width
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)

;; starting up options
(setq max-lisp-eval-depth 50000)
(setq max-specpdl-size 100000)
(setq efault-major-mode 'text-mode) ;; set default mode to be text
(show-paren-mode t) ;; show parenthesis matchup
(line-number-mode t) ;; show line number
(column-number-mode t) ;; show column number
(tool-bar-mode -1) ;; show tool bar
(menu-bar-mode t)
(setq x-select-enable-clipboard t) ;; don't know what's this
(auto-fill-mode nil) ;; set auto fill
(setq visible-bell t) ;; turn on visible bell instead of audible one
(setq display-time-day-and-date t) ;; display stuff
(setq global-font-lock-mode t) ;; enable font lock mode on all
(setq inhibit-startup-msg t) ;; disable startup message
(setq make-backup-files -1)
(setq-default show-trailing-whitespace -1)
(hl-line-mode -1)
(setq fill-column 80) ;; 70 -> 80


;; give duplicated buffer name more information
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward
      uniquify-seperator ":")

;; key bindings
(global-set-key "\C-x g" 'goto-line)
(global-set-key (kbd "C-c C-v") 'compile)
(global-set-key (kbd "C-c C-r") 'query-replace)
(global-set-key (kbd "C-c C-e") 'comment-region)


;; aliases
(defalias 'qrr 'query-and-replace)


;; highlight long lines
;; (setq whitespace-style '(trailing lines space-before-tab
;;                                   indentation space-after-tab))
;; (setq whitespace-line-column 80)
;; (global-whitespace-mode 1)

(setq
 display-time-string-forms '(month "/" day (if mail " Mail" ""))
 display-time-mail-file "/var/mail/csun"
 display-time-mail-face 'display-time-mail-face)
(display-time-mode t)

(require 'csun-utils)
(require 'csun-ido)
(require 'csun-org)
(require 'csun-babel)
(require 'csun-sml)
(require 'csun-twelf)
(require 'csun-haskell)
(require 'csun-clisp)
(require 'csun-clojure)
(require 'csun-ruby)
