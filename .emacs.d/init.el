;; -*- mode: emacs-lisp -*-
;; Simple .emacs configuration

;; ---------------------
;; -- Global Settings --
;; ---------------------
(add-to-list 'load-path "~/.emacs.d")
(require 'cl)
(require 'ido)
(require 'ffap)
(require 'uniquify)
(require 'ansi-color)
(require 'recentf)
(require 'linum)
(require 'smooth-scrolling)
(require 'whitespace)
(require 'dired-x)
(require 'compile)
(ido-mode t)
(menu-bar-mode -1)
(normal-erase-is-backspace-mode 1)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(setq column-number-mode t)
(setq inhibit-startup-message t)
(setq save-abbrevs nil)
(setq show-trailing-whitespace t)
(setq suggest-key-bindings t)
(setq vc-follow-symlinks t)

;; ------------
;; -- Macros --
;; ------------
(load "defuns-config.el")
(fset 'align-equals "\C-[xalign-regex\C-m=\C-m")
(global-set-key "\M-=" 'align-equals)
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c;" 'comment-or-uncomment-region)
(global-set-key "\M-n" 'next5)
(global-set-key "\M-p" 'prev5)
(global-set-key "\M-o" 'other-window)
(global-set-key "\M-i" 'back-window)
(global-set-key "\C-z" 'zap-to-char)
(global-set-key "\C-h" 'backward-delete-char)
(global-set-key "\M-d" 'delete-word)
(global-set-key "\M-h" 'backward-delete-word)
(global-set-key "\M-u" 'zap-to-char)

;; =========== handle tmux's xterm-keys =======================
;; put the following line in your ~/.tmux.conf:
;;   setw -g xterm-keys on
(if (getenv "TMUX")
    (message "running inside TMUX mapping keys...")
  (progn
    (let ((x 2) (tkey ""))
      (while (<= x 8)
	;; shift
	(if (= x 2)
	    (setq tkey "S-"))
	;; alt
	(if (= x 3)
	    (setq tkey "M-"))
	;; alt + shift
	(if (= x 4)
	    (setq tkey "M-S-"))
	;; ctrl
	(if (= x 5)
	    (setq tkey "C-"))
	;; ctrl + shift
	(if (= x 6)
	    (setq tkey "C-S-"))
	;; ctrl + alt
	(if (= x 7)
	    (setq tkey "C-M-"))
	;; ctrl + alt + shift
	(if (= x 8)
	    (setq tkey "C-M-S-"))



	;; arrows
	(define-key key-translation-map (kbd (format "M-[ 1 ; %d A" x)) (kbd (format "%s<up>" tkey)))
	(define-key key-translation-map (kbd (format "M-[ 1 ; %d B" x)) (kbd (format "%s<down>" tkey)))
	(define-key key-translation-map (kbd (format "M-[ 1 ; %d C" x)) (kbd (format "%s<right>" tkey)))
	(define-key key-translation-map (kbd (format "M-[ 1 ; %d D" x)) (kbd (format "%s<left>" tkey)))
	;; home
	(define-key key-translation-map (kbd (format "M-[ 1 ; %d H" x)) (kbd (format "%s<home>" tkey)))
	;; end
	(define-key key-translation-map (kbd (format "M-[ 1 ; %d F" x)) (kbd (format "%s<end>" tkey)))
	;; page up
	(define-key key-translation-map (kbd (format "M-[ 5 ; %d ~" x)) (kbd (format "%s<prior>" tkey)))
	;; page down
	(define-key key-translation-map (kbd (format "M-[ 6 ; %d ~" x)) (kbd (format "%s<next>" tkey)))
	;; insert
	(define-key key-translation-map (kbd (format "M-[ 2 ; %d ~" x)) (kbd (format "%s<delete>" tkey)))
	;; delete
	(define-key key-translation-map (kbd (format "M-[ 3 ; %d ~" x)) (kbd (format "%s<delete>" tkey)))
	;; f1
	(define-key key-translation-map (kbd (format "M-[ 1 ; %d P" x)) (kbd (format "%s<f1>" tkey)))
	;; f2
	(define-key key-translation-map (kbd (format "M-[ 1 ; %d Q" x)) (kbd (format "%s<f2>" tkey)))
	;; f3
	(define-key key-translation-map (kbd (format "M-[ 1 ; %d R" x)) (kbd (format "%s<f3>" tkey)))
	;; f4
	(define-key key-translation-map (kbd (format "M-[ 1 ; %d S" x)) (kbd (format "%s<f4>" tkey)))
	;; f5
	(define-key key-translation-map (kbd (format "M-[ 15 ; %d ~" x)) (kbd (format "%s<f5>" tkey)))
	;; f6
	(define-key key-translation-map (kbd (format "M-[ 17 ; %d ~" x)) (kbd (format "%s<f6>" tkey)))
	;; f7
	(define-key key-translation-map (kbd (format "M-[ 18 ; %d ~" x)) (kbd (format "%s<f7>" tkey)))
	;; f8
	(define-key key-translation-map (kbd (format "M-[ 19 ; %d ~" x)) (kbd (format "%s<f8>" tkey)))
	;; f9
	(define-key key-translation-map (kbd (format "M-[ 20 ; %d ~" x)) (kbd (format "%s<f9>" tkey)))
	;; f10
	(define-key key-translation-map (kbd (format "M-[ 21 ; %d ~" x)) (kbd (format "%s<f10>" tkey)))
	;; f11
	(define-key key-translation-map (kbd (format "M-[ 23 ; %d ~" x)) (kbd (format "%s<f11>" tkey)))
	;; f12
	(define-key key-translation-map (kbd (format "M-[ 24 ; %d ~" x)) (kbd (format "%s<f12>" tkey)))
	;; f13
	(define-key key-translation-map (kbd (format "M-[ 25 ; %d ~" x)) (kbd (format "%s<f13>" tkey)))
	;; f14
	(define-key key-translation-map (kbd (format "M-[ 26 ; %d ~" x)) (kbd (format "%s<f14>" tkey)))
	;; f15
	(define-key key-translation-map (kbd (format "M-[ 28 ; %d ~" x)) (kbd (format "%s<f15>" tkey)))
	;; f16
	(define-key key-translation-map (kbd (format "M-[ 29 ; %d ~" x)) (kbd (format "%s<f16>" tkey)))
	;; f17
	(define-key key-translation-map (kbd (format "M-[ 31 ; %d ~" x)) (kbd (format "%s<f17>" tkey)))
	;; f18
	(define-key key-translation-map (kbd (format "M-[ 32 ; %d ~" x)) (kbd (format "%s<f18>" tkey)))
	;; f19
	(define-key key-translation-map (kbd (format "M-[ 33 ; %d ~" x)) (kbd (format "%s<f19>" tkey)))
	;; f20
	(define-key key-translation-map (kbd (format "M-[ 34 ; %d ~" x)) (kbd (format "%s<f20>" tkey)))

	(setq x (+ x 1))
	))
    )
  )


;; ================= disable beep ===================
(setq ring-bell-function 'ignore)

;; ---------------------------
;; -- JS Mode configuration --
;; ---------------------------
(load "js-config.el")
(add-to-list 'load-path "~/.emacs.d/jade-mode") ;; github.com/brianc/jade-mode
(require 'sws-mode)
(require 'jade-mode)
(add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))

;; =============== backup configuration =======================
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
      backup-by-copying t    ; Don't delink hardlinks
      version-control t      ; Use version numbers on backups
      delete-old-versions t  ; Automatically delete excess backups
      kept-new-versions 4   ; how many of the newest versions to keep
      kept-old-versions 2    ; and how many of the old
      )

;; ============ extras ====================

(defun iwb ()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil))
;;  (untabify (point-min) (point-max)))
(global-set-key [f12] 'iwb)


;; ========= scala mode repo =============
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; ========= ergoemacs-mode ===========================
;; (unless (package-installed-p 'ergoemacs-mode)
;;   (package-refresh-contents) (package-install 'ergoemacs-mode))
;; (require 'ergoemacs-mode)
;; (setq ergoemacs-theme nil) ;; Uses Standard Ergoemacs keyboard theme
;; (setq ergoemacs-keyboard-layout "us") ;; Assumes QWERTY keyboard layout
;; (ergoemacs-mode 1)

;; ========= install and configure move text ====================
(unless (package-installed-p 'move-text)
  (package-refresh-contents) (package-install 'move-text))

(require 'move-text)
(global-set-key [M-up] 'move-text-up)
(global-set-key [M-down] 'move-text-down)

;; =========== install and configure scala-mode =====================

(unless (package-installed-p 'scala-mode2)
  (package-refresh-contents) (package-install 'scala-mode2))

;; =========== install and configure multiple cursors =================

(unless (package-installed-p 'multiple-cursors)
  (package-refresh-contents) (package-install 'multiple-cursors))

(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key "\C-n" 'mc/mark-next-like-this)
(global-set-key "\C-b" 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-a") 'mc/mark-all-like-this)

;; =========== install and configure yasnippet =================

(unless (package-installed-p 'yasnippet)
  (package-refresh-contents) (package-install 'yasnippet))
(require 'yasnippet)
(yas-global-mode 1)

;; ================= fiplr ====================
(unless (package-installed-p 'fiplr)
  (package-refresh-contents) (package-install 'fiplr))
(require 'fiplr)
(global-set-key (kbd "C-x f") 'fiplr-find-file)
(setq fiplr-ignored-globs '((directories (".git" ".svn" "target" ".idea" "build" "node_modules"))
                            (files ("*.jpg" "*.png" "*.zip" "*~"))))
;; =============== color themes ===================
(unless (package-installed-p 'color-theme)
  (package-refresh-contents) (package-install 'color-theme))
(require 'color-theme)
(color-theme-initialize)
(color-theme-dark-laptop)

;; (unless (package-installed-p 'color-theme-select)
;;   (package-refresh-contents) (package-install 'color-theme-select))

;; ================= multiweb-mode =============
;; (unless (package-installed-p 'multi-web-mode)
;;   (package-refresh-contents) (package-install 'multi-web-mode))
;; (require 'multi-web-mode)
;; (setq mweb-default-major-mode 'html-mode)
;; (setq mweb-tags '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
;;                   (js-mode "<script +\\(type=\"text/javascript\"\\|language=\"javascript\"\\)[^>]*>" "</script>")
;;                   (css-mode "<style +type=\"text/css\"[^>]*>" "</style>")))
;; (setq mweb-filename-extensions '("php" "htm" "html" "ctp" "phtml" "php4" "php5"))
;; (multi-web-global-mode 1)

;; ================ web mode ==================
(unless (package-installed-p 'web-mode)
  (package-refresh-contents)
  (package-install 'web-mode))
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(setq web-mode-enable-auto-pairing t)


;; ============= nxml ==================
(unless (package-installed-p 'nxml)
  (package-refresh-contents) (package-install 'nxml))
(setq nxml-slash-auto-complete-flag t)

;; ============ browse url ============
(unless (package-installed-p 'browse-url)
  (package-refresh-contents) (package-install 'browse-url))

;; ============ magit ==================
(unless (package-installed-p 'magit)
  (package-refresh-contents) (package-install 'magit))
(require 'magit)
(global-set-key (kbd "C-c g") 'magit-status)
(global-set-key (kbd "C-c c") 'magit-checkout)

;; ========== xml formatting ===================
(defun xml-format ()
  (interactive)
  (save-excursion
    (shell-command-on-region (mark) (point) "xmllint --format -" (buffer-name) t)
    )
  )
;; ============== wrap region ===================

(unless (package-installed-p 'wrap-region)
  (package-refresh-contents) (package-install 'wrap-region))
(require 'wrap-region)
(wrap-region-mode t)

;; ================ auto-complete ================
;; (unless (package-installed-p 'auto-complete)
;;   (package-refresh-contents) (package-install 'auto-complete))
;; ;; (require 'auto-complete-config)
;; ;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;; (unless (package-installed-p 'ac-dabbrev)
;;   (package-refresh-contents) (package-install 'ac-dabbrev))
;; (require 'auto-complete)
;; (global-auto-complete-mode nil)

;; =============== zoom in zoom out ======================
(global-set-key [C-mouse-4] 'text-scale-increase)
(global-set-key [C-mouse-5] 'text-scale-decrease)

;; ============= tramp : remote file edit =======================
(unless (package-installed-p 'tramp)
  (package-refresh-contents) (package-install 'tramp))
(require 'tramp)
(setq tramp-default-method "ftp")

;; ============== add time stamp ======================
(add-hook 'before-save-hook 'time-stamp)

;; =============== disable lock files ====================
(setq create-lockfiles nil)

;; ============== markdown mode =====================
(unless (package-installed-p 'markdown-mode)
  (package-refresh-contents) (package-install 'markdown-mode))

;; ============= auto revert buffers if changed in disk ===============
(global-auto-revert-mode t)

;; ============== ensime mode for scala  =====================
;; (unless (package-installed-p 'ensime)
;;   (package-refresh-contents) (package-install 'ensime))
;; (require 'ensime)
;; (add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;; ============= duplicate line shortcut ====================
(global-set-key (kbd "C-c d") (kbd "C-a C-SPC C-n M-w C-y"))

;; ============== scala evaluator ===========================
;;(global-set-key (kbd "C-e") nil)
(load "scala-repl.el")
(add-hook 'scala-mode-hook
	  '(lambda ()
	     (local-set-key (kbd "C-e") 'eval-scala)
	     )
	  )
;;(global-set-key (kbd "C-e") 'eval-scala)
;; (funcall (lambda () (message "hi")) 3)
;; ============== scala evaluator ===========================
(load "clojure-repl.el")
(add-hook 'clojure-mode-hook
	  '(lambda ()
	     (local-set-key (kbd "C-e") 'eval-clojure)
	     )
	  )
;;(global-set-key (kbd "C-x e") 'eval-clojure)

;; ============ clojure ===========================
(defvar clj-packages '(better-defaults
                      projectile
                      clojure-mode
                      cider))

(dolist (p clj-packages)
  (unless (package-installed-p p)
    (package-install p)))

(add-hook 'cider-mode-hook #'eldoc-mode)
(add-hook 'clojure-mode-hook #'paredit-mode)
(setq nrepl-log-messages t)
;; (setq nrepl-hide-special-buffers nil)
;; =========== company mode ===================
(unless (package-installed-p 'company)
  (package-install 'company)
  )
(global-company-mode)

;; ============== auto indent =======================
;; (add-hook 'lisp-mode-hook '(lambda ()
;;   (local-set-key (kbd "RET") 'newline-and-indent)))
(global-set-key (kbd "RET") 'newline-and-indent)
;; ============== auto-close brackets =============
(electric-pair-mode 1)

;; =========== aungularjs yasnippet ============
(unless (package-installed-p 'angular-snippets)
  (package-refresh-contents) (package-install 'angular-snippets)
  )
;; ============= duplicate lines ================
(global-set-key "\C-d" "\C-a\C- \C-e\M-w\n\C-y")

;; ================ tabs as spaces =================
(setq-default indent-tabs-mode nil)

;; =============== haskell ===========================
(unless (package-installed-p 'haskell-mode)
  (package-install 'haskell-mode)
  )
(add-hook 'haskell-mode-hook 'haskell-indent-mode)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

;; ================= emmet-mode ===================
(unless (package-installed-p 'emmet-mode)
  (package-install 'emmet-mode)
  )
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
(add-hook 'web-mode-hook 'emmet-mode)
(setq emmet-move-cursor-between-quotes t) ;; default nil

;; =================== paredit mode ===================
(unless (package-installed-p 'paredit)
  (package-install 'paredit))

(global-set-key "\C-\M-y" "\C-\M-t")

;; =============== projectile ====================
(unless (package-installed-p 'projectile)
  (package-install 'projectile))
(projectile-global-mode)

;; ============== flx-ido (recommended for projectile)=======================

(unless (package-installed-p 'flx-ido)
  (package-install 'flx-ido))

;; =========== line numbers =====================
(unless (package-installed-p 'linum)
  (package-install 'linum))
