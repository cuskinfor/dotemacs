;;; init-unsorted-elisp.el --- Contains small chunks of elisp code in no particular order

;; Copyright (C) 2010, 2011, 2012, 2013  Massimo Lauria

;; Author: Massimo Lauria <lauria.massimo@gmail.com>
;; Keywords:

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

;; Several functionality of Emacs must be set up with small chunks of
;; codes.  To avoid an excessive amount of clutter in the main init.el
;; file, all such small pieces are collected in this file.

;;; Code:




;; Auto-mode
(setq auto-mode-alist (cons '("\\.zsh" . sh-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.dot" . graphviz-dot-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.yasnippet" . snippet-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.snippet" . snippet-mode) auto-mode-alist))

;; Command line editing
(setq auto-mode-alist (cons '("zshec[0-9]*" . sh-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("bash-fc-[0-9]*" . sh-mode) auto-mode-alist))



(autoload 'graphviz-dot-mode
  "graphviz-dot-mode" "Edit/View Graphviz's dot files" t)

(autoload 'muttrc-mode "muttrc-mode"
  "Mode to edit mutt configuration files")


;; Undo-Tree, much better than default.
(if (require 'undo-tree)
    (progn
      (global-undo-tree-mode 1)
      (defalias 'redo 'undo-tree-redo)
      (defalias 'undo 'undo-tree-undo)
      (global-set-key (kbd "C-S-z") 'redo))) ; 【Ctrl+Shift+z】 to Redo


;; Prepare *scratch buffer*
;; FROM: Morten Welind
;; http://www.geocrawler.com/archives/3/338/1994/6/0/1877802/
(save-excursion
  (set-buffer (get-buffer-create "*scratch*"))
  (if (boundp 'initial-major-mode)
      (eval (cons initial-major-mode ()))
      (lisp-interaction-mode)
    )
  (make-local-variable 'kill-buffer-query-functions)
  (add-hook 'kill-buffer-query-functions 'kill-scratch-buffer))


;; Make buffer names unique
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward
      uniquify-separator ":"
)

;; Ediff customization
; (no external control frame)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
; (use vertical split if there is enough room)
(setq ediff-split-window-function
      (lambda (&optional arg)
        (if (> (frame-width) 150)
            (split-window-horizontally arg)
          (split-window-vertically arg)
          )))



;; Add a message to yank-pop
(defun kill-ring-counters ()
  "Output a cons (pos . len) whenre `len' is the number of the elements
in the kill-ring and `pos' is the position current-kill"
  (interactive)
  (let ((len (length kill-ring))
        (pos (length kill-ring-yank-pointer)))
    (cons pos len)))

(defadvice yank-pop (before print-kill-ring-counter ())
  "Show in the minibuffer what is the current element of the kill-ring"
  (let ((pl (kill-ring-counters)))
    (message (format "(Yank Pop) kill-ring position %d/%d" (car pl) (cdr pl)))))

(ad-activate 'yank-pop)

;; Customize Tramp

; sometimes remote shells are very bad and unusable by TRAMP
; (e.g. some busybox found in NAS) problem is that even if you install
; better commands TRAMP will stick to default ones because of the
; $PATH variable.  With the following setup, the remote path setting
; are taken in consideration.  This allows to fix a remote system to
; be accessed by TRAMP.
(eval-after-load "tramp"
  '(add-to-list 'tramp-remote-path 'tramp-own-remote-path))

;; Save histories across sessions. Not buffers
(savehist-mode 1)

;; Use full featured gdb GUI.
(setq gdb-many-windows t)
(setq gdb-use-separate-io-buffer t)
(add-hook 'gud-mode-hook '(lambda ()
                            (local-set-key (kbd "<f10>") 'gud-nexti)
                            (local-set-key (kbd "<f11>") 'gud-next )
                            (local-set-key (kbd "<f12>") 'gud-cont)

                            (local-set-key (kbd "M-<f10>") 'gud-stepi)
                            (local-set-key (kbd "M-<f11>") 'gud-step )
                            (local-set-key (kbd "M-<f12>") 'gud-until)

                            (local-set-key (kbd "<f9>"  ) 'gud-break)
                            (local-set-key (kbd "M-<f9>"  ) 'gud-tbreak)
                            )
          )


;; IDO mode for selection of file and buffers. VERY GOOD
(require 'ido)

(add-hook 'ido-setup-hook
          (lambda ()
            (define-key ido-completion-map (kbd "<tab>")   'ido-complete)
            (define-key ido-completion-map (kbd "M-<tab>") 'ido-next-match)
            (define-key ido-completion-map (kbd "M-j") 'ido-prev-match)
            (define-key ido-completion-map (kbd "M-l") 'ido-next-match)
            (define-key ido-completion-map (kbd "M-i") 'ido-prev-match)
            (define-key ido-completion-map (kbd "M-k") 'ido-next-match)
            ))

(ido-mode t)

(setq ido-enable-flex-matching t ; fuzzy matching is a must have
      ido-max-prospects 5        ; minibuffer is not saturated
      ido-ignore-buffers ;; ignore these guys
       '("\\` " "^\*Mess" "^\*Back" "^\*scratch" ".*Completion" "^\*Ido")
      ido-everywhere t            ; use for many file dialogs
      ido-case-fold  t            ; be case-insensitive
      ido-auto-merge-werk-directories-length nil) ; all failed, no more digging

;; Recentf with ido-completio.
(require-maybe 'recentf)
; 50 files ought to be enough.
(setq recentf-max-saved-items 50)

(defun ido-recentf-open ()
  "Use `ido-completing-read' to \\[find-file] a recently opened file"
  (interactive)
  (let* ((file-assoc-list
	  (mapcar (lambda (x)
		    (cons (file-name-nondirectory x)
			  x))
		  recentf-list))
	 (filename-list
	  (remove-duplicates (mapcar #'car file-assoc-list)
			     :test #'string=))
	 (filename (ido-completing-read "Recent file: "
					filename-list
					nil
					t)))
    (when filename
      (find-file (cdr (assoc filename
			     file-assoc-list))))))

;; get rid of `find-file-read-only' and replace it with something
;; more useful.
(when-available 'recentf-mode (recentf-mode t))
(when-available 'recentf-mode (global-set-key (kbd "C-x C-r") 'ido-recentf-open))

;; Moving between windows with (M-C-<arrow>)
(require 'windmove)               ; to load the package
(setq windmove-wrap-around t)

;;; Flymake setup --------

;; Overwrite flymake-display-warning to suppress annoying dialog boxs
(defun flymake-display-warning (warning)
  "Display a warning to the user, using minibuffer"
  (message warning))

;; All urls/mails are clickable in comments and strings (Not present in Emacs22)
(when-available 'goto-address-prog-mode
  (add-hook 'find-file-hooks 'goto-address-prog-mode)
  )


;; Eldoc for lisp
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
;;}}}


;; CCLookup documentation of C/C++

;; add pylookup to your loadpath, ex) "~/.lisp/addons/pylookup"
(setq cclookup-dir (concat default-elisp-3rdparties "/cclookup"))
(add-to-list 'load-path cclookup-dir)
;; load pylookup when compile time
(eval-when-compile (require-maybe 'cclookup))

;; set executable file and db file
(setq cclookup-program (concat cclookup-dir "/cclookup.py"))
(setq cclookup-db-file "~/.emacs.d/cclookup.db")
(if (not (file-exists-p cclookup-db-file))
    (message "CClookup database not yet initialized")
    )

;; to speedup, just load it on demand
(autoload 'cclookup-lookup "cclookup"
  "Lookup SEARCH-TERM in the C++ reference indexes." t)
(autoload 'cclookup-update "cclookup"
  "Run cclookup-update and create the database at `cclookup-db-file'." t)


;; Comint keys
(require 'comint)
(add-hook 'comint-mode-hook
          '(lambda()
             (local-set-key (kbd "M-n") 'comint-next-input)
             (local-set-key (kbd "M-p") 'comint-previous-input)
             (local-set-key [down] 'comint-next-matching-input-from-input)
             (local-set-key [up] 'comint-previous-matching-input-from-input)
             ))



;; Tags managements ----------------------------------------
;; Fix the keybindings for Gtags and Etags

;; M-. is for finding the tag
;; M-, is for popping the tag stack
;; The usual binding for popping is M-* which is disabled here.

;; Gtags keys
(add-hook 'gtags-mode-hook
          '(lambda()
             (define-key gtags-mode-map (kbd "M-.") 'gtags-find-tag)
             (define-key gtags-mode-map (kbd "M-,") 'gtags-pop-stack)
             (define-key gtags-mode-map (kbd "M-*") 'nil)
             ))

(eval-after-load 'gtags-mode
  '(add-hook 'c-mode-common-hook 'gtags-mode))


;; Etags keys
(define-key esc-map "." 'find-tag)
(define-key esc-map "," 'pop-tag-mark)
(define-key esc-map "*" 'nil)

(eval-after-load 'winner-mode-hook
  '(progn 
     (define-key winner-mode-map (kbd "C-c C-j") 'winner-undo)
     (define-key winner-mode-map (kbd "C-c C-l") 'winner-redo)
     ))

;; HideShow mode
(defun hs-minor-mode-setup (key)
  "Setup keys for hs-mode."
  (if (not (boundp 'hs-minor-mode-map))
      (setq hs-minor-mode-map (make-sparse-keymap)))
  (define-key hs-minor-mode-map key 'hs-toggle-hiding)
  )
(hs-minor-mode-setup (kbd "M-SPC"))

(eval-after-load 'hs-minor-mode 
  '(defadvice goto-line (after expand-after-goto-line
                               activate compile)
     "hideshow-expand affected block when using goto-line in a collapsed buffer"
     (save-excursion
       (hs-show-block))))

(add-hook 'c-mode-common-hook   'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'java-mode-hook       'hs-minor-mode)
(add-hook 'lisp-mode-hook       'hs-minor-mode)
(add-hook 'perl-mode-hook       'hs-minor-mode)
(add-hook 'python-mode-hook     'hs-minor-mode)
(add-hook 'sh-mode-hook         'hs-minor-mode)





;; Kill buffers with running processes
(setq kill-buffer-query-functions
      (remove 'process-kill-buffer-query-function kill-buffer-query-functions))

;; This is just nice
(require 'which-func)
(add-to-list 'which-func-modes 'org-mode)
(which-func-mode 1)

;; Trailining whitespace removal
(defvar do-delete-whitespace t
  "Local variable to decide whether deleting trailing whitespaces
  when saving.")

(defun delete-trailing-whitespace--conditional ()
  "Call `delete-trailing-whitespace' unless `do-delete-whitespace' in non `nil'"
  (when do-delete-whitespace
    (delete-trailing-whitespace)))

(add-hook 'before-save-hook 'delete-trailing-whitespace--conditional)

;; Powershell facilities
(autoload 'powershell-mode "powershell-mode" "A editing mode for Microsoft PowerShell." t)
(add-to-list 'auto-mode-alist '("\\.ps1\\'" . powershell-mode)) ; PowerShell script
(autoload 'powershell "powershell" "Start a interactive shell of PowerShell." t)


(defadvice fundamental-mode (after add-massimo-keyboard-mode ())
  (when (fboundp 'massimo-keyboard-mode)
    (massimo-keyboard-mode t)))

(ad-activate 'fundamental-mode)


;; Invocation of git
(defun git-commit-file (&optional commit-message file-name)
  "Add the file into the local git repository, then commits.

If there are other files staged for commit, those will be
committed as well. A COMMIT-MESSAGE can be optionally specified."  
  (interactive)
  (let ((msg (or commit-message "Automatic commit by emacs"))
        (fname (or file-name (buffer-file-name)))
        (error-buffer  "*Messages*")
        (output-buffer "*Messages*"))
    (if (file-exists-p (format "%s" fname))
        (progn 
          (vc-toggle-read-only)
          (shell-command (concat "git add " fname)
                         output-buffer 
                         error-buffer)
          (shell-command (concat "git commit -m \"" 
                                 (with-temp-buffer
                                   (insert msg)
                                   (replace-string "\"" "\\\"" nil 
                                                   (point-min) (point-max))
                                   (buffer-string))
                                 "\"")
                         output-buffer 
                         error-buffer)
          (vc-toggle-read-only)))))

(defvar org-capture-commit-message nil
  "A buffer variable to contain the org-capture header")

(add-hook 'org-capture-before-finalize-hook
           '(lambda ()
             (setq org-capture-commit-message (org-get-heading))))

(defun org-mode-auto-commit ()
  "Commit the file in git repository.

The commit message is the heading of the entry where the commit
is invoked."
  (interactive)
  (let ((msg (or org-capture-commit-message 
              (org-get-heading))))  
    (git-commit-file msg)
    (setq org-capture-commit-message nil)))


(provide 'init-unsorted-elisp)
;;; init-unsorted-elisp.el ends here
