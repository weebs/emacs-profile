(require 'package)
(add-to-list
 'package-archives
 '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

(defvar my-packages
  '(rainbow-delimiters))

;; On OS X, an Emacs instance started from the graphical user
;; interface will have a different environment than a shell in a
;; terminal window, because OS X does not run a shell during the
;; login. Obviously this will lead to unexpected results when
;; calling external utilities like make from Emacs.
;; This library works around this problem by copying important
;; environment variables from the user's shell.
;; https://github.com/purcell/exec-path-from-shell
(if (eq system-type 'darwin)
    (add-to-list 'my-packages 'exec-path-from-shell))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

; Enable Rainbow Delimiters in all programming related modes
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
;; To create the hook for specific modes, see the following
;(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)

;; Load Path
;(add-to-list 'load-path "~/.emacs.d/somefolder")

;; ========== Misc ==========
;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)
;; Go straight to scratch buffer on startup
(setq inhibit-startup-message t)

;; ========== Editing ==========
(setq-default indent-tabs-mode nil)
;; Highlight matching parens
(show-paren-mode 1)
;; Go to last cursor position when file was open
(setq save-place-file "~/.emacs.d/saveplace")
(require 'saveplace)
(setq-default save-place t)
