;;;
;;; Utilities for robust and safe emacs usage.
;;;
;;; In Emacs 22 or in some terminals the keybindings may not work properly.
;;;
;;;------------------------------------------------------------------

(when running-MacOSX
  (setq MacUser-org-path (concat MacUser-site-lisp "/org/lisp/"))
  (setq MacUser-org-contrib-path (concat MacUser-site-lisp "/org/contrib/lisp"))
  (if (file-directory-p MacUser-org-path)
      (setq load-path (cons MacUser-org-path load-path)))
  (if (file-directory-p MacUser-org-contrib-path)
      (setq load-path (cons MacUser-org-contrib-path load-path)))
)

(require 'org)

(setq org-directory "~/personal/agenda/")
(setq org-default-notes-file (concat org-directory "notes.org"))
(setq org-default-journal-file (concat org-directory "journal.org"))

(when (not (boundp 'org-agenda-files))
  (setq org-agenda-files (list org-directory))
  )


(when (<= (string-to-number org-version) 5) ;; Older versions of Org mode (like the one inside Emacs22)
  ;; In old version of ORG mode only one DONE state is allowed in a sequence
  (setq org-todo-keywords '("TODO" "FEEDBACK" "WAIT" "DONE"))
  (setq org-todo-interpretation 'type)
  )

(when (> (string-to-number org-version) 5) ;; Newer versions of Org-mode
  (setq org-todo-keywords '((sequence "TODO" "FEEDBACK" "WAIT" "|" "DONE" "CANCELED" "DELEGATED")))
  )


;;;-------------------------------------------------------------------

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cr" 'org-remember)

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(setq
 org-log-done t
 org-CUA-compatible t
 org-support-shift-select t
 org-cycle-emulate-tab nil
 org-cycle-global-at-bob t
 org-highlight-latex-fragments-and-specials t
)


;; ;; Org-mode Keys
(setq org-replace-disputed-keys t)
(setq org-disputed-keys '(
                         ([(tab)]      . [(meta tab)])
                         ([(shift up)]      . [(control è)])
                         ([(shift down)]    . [(control à)])
                         ([(shift left)]    . [(control ò) ])
                         ([(shift right)]   . [(control ù) ])
                         ([(meta  up)]      . [(meta è) ])
                         ([(meta  down)]    . [(meta à) ])
                         ([(meta  left)]    . [(meta ò) ])
                         ([(meta  right)]   . [(meta ù) ])
                         ([(meta  shift up)]      . [(control meta è) ])
                         ([(meta  shift down)]    . [(control meta à) ])
                         ([(meta  shift left)]    . [(control meta ò) ])
                         ([(meta  shift right)]   . [(control meta ù) ])
                         ([(control shift right)] . [(meta shift +)])
                         ([(control shift left)] . [(meta shift -)])
                         ))


(defun org-mode-setup-local-keys()
  "Define/>Undefine of org-mode keys"
  (interactive)
  (local-unset-key "\t")                     ; Use Tab for more decent things (auto-complete or yasnippet)
  (local-unset-key [tab])
  (local-unset-key [(tab)])

  (local-set-key (kbd "M-<tab>")    'org-cycle)  ; Use M-Tab for
                                                 ; org-cycle, which
                                                 ; avoid to use the
                                                 ; overloaded TAB key

  (local-set-key (kbd "M-SPC")      'org-cycle)  ; Use M-Space for
                                                 ; org-cycle, which is
                                                 ; similar to what I
                                                 ; use for
                                                 ; folding-toggle-show-hide


  ;; Seems to work in X window
  (local-set-key (kbd "C-è") 'org-shiftup    )
  (local-set-key (kbd "C-à") 'org-shiftdown  )
  (local-set-key (kbd "C-ò") 'org-shiftleft  )
  (local-set-key (kbd "C-ù") 'org-shiftright )

  ;; Seems to work in my Xterm
  (local-set-key "\e[27;5;232~" 'org-shiftup)
  (local-set-key "\e[27;5;224~" 'org-shiftdown)
  (local-set-key "\e[27;5;242~" 'org-shiftleft)
  (local-set-key "\e[27;5;249~" 'org-shiftright)

  (local-set-key (kbd "M-è") 'org-metaup    )
  (local-set-key (kbd "M-à") 'org-metadown  )
  (local-set-key (kbd "M-ò") 'org-metaleft  )
  (local-set-key (kbd "M-ù") 'org-metaright )

  ;; Xterm apparently does not generate such sequences.
  (local-set-key (kbd "C-M-è") 'org-shiftmetaup    )
  (local-set-key (kbd "C-M-à") 'org-shiftmetadown  )
  (local-set-key (kbd "C-M-ò") 'org-shiftmetaleft  )
  (local-set-key (kbd "C-M-ù") 'org-shiftmetaright )

  ;; Disable the S-Arrow keys, to support CUA-mode.
  (local-unset-key (kbd "<S-up>")    )
  (local-unset-key (kbd "<S-down>")  )
  (local-unset-key (kbd "<S-left>")  )
  (local-unset-key (kbd "<S-right>") )
  (local-unset-key (kbd "<C-S-up>")    )
  (local-unset-key (kbd "<C-S-down>")  )
  (local-unset-key (kbd "<C-S-left>")  )
  (local-unset-key (kbd "<C-S-right>") )

  )


(defun orgtbl-mode-setup-local-keys()
  "Define/>Undefine of orgtbl-mode keys"
  ;; Org Table movements
  (define-key orgtbl-mode-map (kbd "M-ò") 'org-table-move-column-left)
  (define-key orgtbl-mode-map (kbd "M-ù") 'org-table-move-column-right)
  (define-key orgtbl-mode-map (kbd "M-è") 'org-table-move-row-up)
  (define-key orgtbl-mode-map (kbd "M-à") 'org-table-move-row-down)

  (define-key orgtbl-mode-map (kbd "C-M-ò") 'org-table-delete-column)
  (define-key orgtbl-mode-map (kbd "C-M-ù") 'org-table-insert-column)
  (define-key orgtbl-mode-map (kbd "C-M-è") 'org-table-kill-row)
  (define-key orgtbl-mode-map (kbd "C-M-à") 'org-table-insert-row)
  )

(add-hook 'org-mode-hook 'org-mode-setup-local-keys)
(add-hook 'org-mode-hook 'turn-on-org-cdlatex)
;(add-hook 'org-mode-hook 'orgtbl-mode-setup-local-keys)
(add-hook 'orgtbl-mode-hook 'orgtbl-mode-setup-local-keys)

;; Link org-mode to remember-mode (which is not present on Emacs <22)
(when (fboundp 'org-remember-insinuate)
  (org-remember-insinuate)
)

;; Org-protocol to make org-mode to interact with other applications
(require-maybe 'org-protocol)  ;; Do not exists on Emacs22

;; Autofocus and raise the Emacs frame which should get the input.
(add-hook 'org-remember-mode-hook
          (lambda ()(select-frame-set-input-focus (selected-frame))))

;; Normally my private (and translated) configuration is used.
(when (not (boundp 'org-remember-templates))
  (setq org-remember-templates
        '(
          ("journal"        ?j "* %? %t\n\n  %i\n  %a\n\n" "journal.org")
          ("note"           ?n "* %? %T\n\n  %i\n  %a\n\n" "notes.org")
          ("meeting"        ?m "* TODO ⌚ %? %T\n\n  %i\n\n\n" "notes.org")
          ("deadline"       ?d "* TODO ⌚ %? %U\n  DEADLINE: %t\n\n  %i\n\n" "notes.org")
          ("event"          ?e "* %? %t--%t\n\n  %i\n  %a\n\n" "notes.org")
          ("webpage"        ?w "* %^{Title}\n\n  Source: %u, %c\n\n  %i" nil "notes.org")
          )
        )
  )


;; Aquamacs miss some org-agenda keybindings!
(defun org-agenda-mode-setup-local-keys()
  "Define/>Undefine of orgtbl-mode keys"
  ;; Org Agenda Left/Right movements
  (define-key org-agenda-mode-map (kbd "<left>") 'org-agenda-earlier)
  (define-key org-agenda-mode-map (kbd "<right>") 'org-agenda-later)
)
(add-hook 'org-agenda-mode-hook 'org-agenda-mode-setup-local-keys)

;; Wordpress blogging in Org-mode! (with Math!)
(add-to-list 'load-path (concat default-elisp-3rdparties "/org2blog"))
(require-maybe 'org2blog)



;; Patch org-bibtex-store-link to manage Capitalized Fields.
(require 'org-bibtex)
(defun org-bibtex-store-link ()
  "Store a link to a BibTeX entry."
  (when (eq major-mode 'bibtex-mode)
    (let* ((search (org-create-file-search-in-bibtex))
	   (link (concat "file:" (abbreviate-file-name buffer-file-name)
			 "::" search))
	   (entry (mapcar ; repair strings enclosed in "..." or {...}
		   (lambda(c)
		     (if (string-match
			  "^\\(?:{\\|\"\\)\\(.*\\)\\(?:}\\|\"\\)$" (cdr c))
			 (cons (car c) (match-string 1 (cdr c))) c))
		   (save-excursion
		     (bibtex-beginning-of-entry)
		     (mapcar '(lambda (pair) (cons (downcase (car pair)) (cdr pair)))
               (bibtex-parse-entry))
             ))))
      (org-store-link-props
       :key (cdr (assoc "=key=" entry))
       :author (or (cdr (assoc "author" entry)) "[no author]")
       :editor (or (cdr (assoc "editor" entry)) "[no editor]")
       :title (or (cdr (assoc "title" entry)) "[no title]")
       :booktitle (or (cdr (assoc "booktitle" entry)) "[no booktitle]")
       :journal (or (cdr (assoc "journal" entry)) "[no journal]")
       :publisher (or (cdr (assoc "publisher" entry)) "[no publisher]")
       :pages (or (cdr (assoc "pages" entry)) "[no pages]")
       :url (or (cdr (assoc "url" entry)) "[no url]")
       :year (or (cdr (assoc "year" entry)) "[no year]")
       :month (or (cdr (assoc "month" entry)) "[no month]")
       :address (or (cdr (assoc "address" entry)) "[no address]")
       :volume (or (cdr (assoc "volume" entry)) "[no volume]")
       :number (or (cdr (assoc "number" entry)) "[no number]")
       :annote (or (cdr (assoc "annote" entry)) "[no annotation]")
       :series (or (cdr (assoc "series" entry)) "[no series]")
       :abstract (or (cdr (assoc "abstract" entry)) "[no abstract]")
       :btype (or (cdr (assoc "=type=" entry)) "[no type]")
       :type "bibtex"
       :link link
       :description description))))

(provide 'init-org-mode)
;; Local Variables:
;; mode: emacs-lisp
;; folded-file: t
;; End:

