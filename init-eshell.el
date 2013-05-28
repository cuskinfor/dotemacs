;;; massimo-keyboard.el --- Keybindings specific for the author habits -*- coding: utf-8 -*-

;; Copyright (C) 2010, 2011, 2012, 2013  Massimo Lauria

;; Author: Massimo Lauria <lauria.massimo@gmail.com>
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

;; configuration for Emacs shell

;;; Code:

(global-set-key (kbd "<M-return>") 'eshell)

(defun eshell-my-setup ()
  (define-key eshell-mode-map (kbd "<M-return>") 'bury-buffer))

(add-hook 'eshell-mode-hook 'eshell-my-setup)
  
;;; Commands

(defun eshell/emacs (&rest args)
  "Open a file in emacs. Some habits die hard."
  (if (null args)
      ;; If I just ran "emacs", I probably expect to be launching
      ;; Emacs, which is rather silly since I'm already in Emacs.
      ;; So just pretend to do what I ask.
      (bury-buffer)
    ;; We have to expand the file names or else naming a directory in an
    ;; argument causes later arguments to be looked for in that directory,
    ;; not the starting directory
    (mapc #'find-file (mapcar #'expand-file-name (eshell-flatten-list (reverse args))))))

(defun eshell/ec (&rest args)
  "Invoke `find-file' on the file.
    \"ec +42 foo\" also goes to line 42 in the buffer."
  (while args
    (if (string-match "\\`\\+\\([0-9]+\\)\\'" (car args))
        (let* ((line (string-to-number (match-string 1 (pop args))))
               (file (pop args)))
          (find-file file)
          (goto-line line))
      (find-file (pop args)))))


(eval-after-load "magit" 
  '(defun eshell/git (&rest args)
     "Invoke `magit-status' on the folder."
     (call-interactively 'magit-status)))


(defun eshell-view-file (file)
  "A version of `view-file' which properly respects the eshell prompt."
  (interactive "fView file: ")
  (unless (file-exists-p file) (error "%s does not exist" file))
  (let ((had-a-buf (get-file-buffer file))
        (buffer (find-file-noselect file)))
    (if (eq (with-current-buffer buffer (get major-mode 'mode-class))
            'special)
        (progn
            (switch-to-buffer buffer)
            (message "Not using View mode because the major mode is special"))
      (let ((undo-window (list (window-buffer) (window-start)
                               (+ (window-point)
                                  (length (funcall eshell-prompt-function))))))
        (switch-to-buffer buffer)
        (view-mode-enter (cons (selected-window) (cons nil undo-window))
                         'kill-buffer)))))

(defun eshell/less (&rest args)
  "Invoke `view-file' on a file. \"less +42 foo\" will go to line 42 in
  the buffer for foo."
  (while args
    (if (string-match "\\`\\+\\([0-9]+\\)\\'" (car args))
        (let* ((line (string-to-number (match-string 1 (pop args))))
               (file (pop args)))
            (eshell-view-file file)
            (goto-line line))
      (eshell-view-file (pop args)))))

(defalias 'eshell/more 'eshell/less)
(defalias 'eshell/most 'eshell/less)


;; Config
(setq eshell-prompt-function
      (lambda nil
        (concat
         (abbreviate-file-name
          (eshell/pwd))
         (if
             (=
              (user-uid)
              0)
             " # " " $ "))))



(provide 'init-eshell)
;;; init-eshell.el ends here
