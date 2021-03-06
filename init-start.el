;;; init-start.el --- Main configuration file -*- coding: utf-8 -*-

;; Copyright (C) 2010, 2011, 2012, 2013, 2014  Massimo Lauria
;; Time-stamp: "2014-12-01, 01:17 (CET) Massimo Lauria"

;; Author: Massimo Lauria
;; Keywords: convenience

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;
;;  This is the entry point of my main configuration. It requires
;;  Emacs 24.  In case Emacs is older, this file should not be loaded
;;  and the fallback `init-minimal.el' should.



;; Fallback configuration
(when (< emacs-major-version 24)
  (error "Emacs <24 not supported by default configuration. Use fallback one"))

;; Stop on errors.
(setq debug-on-error t)
(add-hook 'after-init-hook '(lambda () (setq debug-on-error nil)))


;;; Setup Emacs environment --------------------------------------------

(setq default-elisp-path        "~/config/emacs")             ;; configuration files
(setq default-elisp-3rdparties  "~/config/emacs/3rdparties")  ;; 3rd parties conf. packages
(setq load-path (cons 	default-elisp-path        load-path))
(setq load-path (cons 	default-elisp-3rdparties  load-path))

(require 'init-discover-runtime) ; Discover emacs version and runtime
(require 'init-environment)      ; setup running environment



(require 'init-functions)        ; Utility functions for configuration
(require 'init-elpa)

;; Sometimes the system does not contains important packages as Org or
;; BBDB, which cannot be installed using ELPA (either because Emacs <
;; 24 or because BBDB is not on ELPA).
;;
;; If there is an user installation of those packages, those will be
;; found first. I guess ELPA will overload them. Anyway everything
;; lives in the user local installation which can be tuned for the
;; specific system.
;;
(setq additional-elisp-paths (list
                              "~/Library/site-lisp/"   ;; macosx user site-lisp
                              "~/.emacs.d/site-lisp/"  ;; standard user path
                              "~/.local/share/emacs/site-lisp/" ;; local fs hierarchy
                              ;; non local paths
                              "/usr/share/emacs/site-lisp/"
                              "/usr/local/share/emacs/site-lisp/"
                              "/opt/local/share/emacs/site-lisp/"
                              ))

(setq additional-elisp-packages (list
                              ""
                              "mu4e"
                              ;; "bbdb/lisp"        ;; main bbdb in Melpa
                              ;; "bbdb/bits"        ;; bbdb contributed utilities
                              "org/lisp"         ;; main org-mode
                              "org/contrib/lisp" ;; org-mode contributed utilities
                              ))

(dolist (path additional-elisp-paths)
  (dolist (package additional-elisp-packages)
    (let ((pp (concat path package)))
      (if (file-directory-p pp)
              (setq load-path (cons pp load-path))))))


;;; Module(s) initialization -------------------------------------------

;; Work environment customization
(require 'init-coding)
(require 'init-italian-l10n)
(require 'init-local-preferences) ; Host based and personal configuration
(require 'init-preferences)       ; Basic editor preferences -- check for speed
(require 'init-modeline)          ; modeline preferences -- check for speed
(require 'init-backup)            ; Autosaves and backups behaviour


;; Editor behaviour customization
(require 'init-textmode)          ; Preferences for text editing
(require 'init-terminal-fix)      ; Fix some keys combinations in terminals
(require 'init-eshell)            ; Emacs shell
(require 'init-clipboard)         ; Clipboard managing
(require 'init-autotype)          ; Automatic file filling
(require 'init-auto-complete)     ; Completion configuration -- check for speed
(require 'init-spellcheck)        ; Spellchecking -- check for speed

;; Keyboard settings
(require 'massimo-keyboard)       ; basic keyboard settings
(require 'init-global-keys)       ; global keys
(require 'init-hyperlink)         ; keys for opening links

;; Programming
(require 'init-magit)
(require 'init-cc-mode)
(require 'init-python)
(require 'init-java-mode)

;; Math packages
(require 'init-latex)        ; AucTeX
(require 'init-sage)         ; SageMath
(require 'init-imaxima)      ; Imaxima and Imath (from SageMath)
(require 'init-singular)     ; Singular (not from SageMath!)

;; Applications
(require 'init-mail)       ; Mail + Contacts
(require 'init-org-mode)   ; Organizer
(require 'init-websearch)  ; Search the Web

;; Other stuff
(require 'init-unsorted-elisp)  ; various setups -- check for speed


;;; Customized settings -------------------------------------------------
(setq custom-file "~/config/emacs/custom.el")
(load custom-file 'noerror)
;;; Enabled/Disabled commands
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'iconify-or-deiconify-frame 'disabled t)

;;; Start server --------------------------------------------------------
(require 'init-server)

;;; Start editing -------------------------------------------------------
(init-scratch-buffer)


(provide 'init-start)
;; Local Variables:
;; mode: emacs-lisp
;; End:
