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
(normal-erase-is-backspace-mode 0)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(setq column-number-mode t)
(setq inhibit-startup-message t)
(setq save-abbrevs nil)
(setq show-trailing-whitespace t)
(setq suggest-key-bindings t)
(setq vc-follow-symlinks t)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit autoface-default :strike-through nil :underline nil :slant normal :weight normal :height 120 :width normal :family "monaco"))))
 '(column-marker-1 ((t (:background "red"))))
 '(diff-added ((t (:foreground "cyan"))))
 '(flymake-errline ((((class color) (background light)) (:background "Red"))))
 '(font-lock-comment-face ((((class color) (min-colors 8) (background light)) (:foreground "red"))))
 '(fundamental-mode-default ((t (:inherit default))))
 '(highlight ((((class color) (min-colors 8)) (:background "white" :foreground "magenta"))))
 '(isearch ((((class color) (min-colors 8)) (:background "yellow" :foreground "black"))))
 '(linum ((t (:foreground "black" :weight bold))))
 '(region ((((class color) (min-colors 8)) (:background "white" :foreground "magenta"))))
 '(secondary-selection ((((class color) (min-colors 8)) (:background "gray" :foreground "cyan"))))
 '(show-paren-match ((((class color) (background light)) (:background "black"))))
 '(vertical-border ((t nil)))
)

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

;; ---------------------------
;; -- JS Mode configuration --
;; ---------------------------
(load "js-config.el")
(add-to-list 'load-path "~/.emacs.d/jade-mode") ;; github.com/brianc/jade-mode
(require 'sws-mode)
(require 'jade-mode)    
(add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))

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
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

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
