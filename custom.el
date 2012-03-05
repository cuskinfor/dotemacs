
;; File containing M-x customize data

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ac-auto-show-menu 0.3)
 '(ac-delay 0.1)
 '(ac-disable-on-comment nil)
 '(ac-quick-help-delay 0.5)
 '(ac-quick-help-prefer-pos-tip nil)
 '(ac-sources (quote (ac-source-yasnippet ac-source-imenu ac-source-abbrev ac-source-words-in-buffer ac-source-files-in-current-dir ac-source-filename)) t)
 '(ac-stop-flymake-on-completing t)
 '(aquamacs-additional-fontsets nil t)
 '(aquamacs-autoface-mode nil)
 '(aquamacs-customization-version-id 215 t)
 '(aquamacs-save-options-on-quit t)
 '(aquamacs-tool-bar-user-customization nil t)
 '(backup-by-copying t)
 '(backup-by-copying-when-linked t)
 '(before-save-hook (quote (copyright-update time-stamp delete-trailing-whitespace)))
 '(bibtex-entry-field-alist (quote (("Article" ((("author" "Author1 [and Author2 ...] [and others]") ("title" "Title of the article (BibTeX converts it to lowercase)") ("journal" "Name of the journal (use string, remove braces)") ("year" "Year of publication")) (("volume" "Volume of the journal") ("number" "Number of the journal (only allowed if entry contains volume)") ("pages" "Pages in the journal") ("month" "Month of the publication as a string (remove braces)") ("note" "Remarks to be put at the end of the \\bibitem"))) ((("author" "Author1 [and Author2 ...] [and others]") ("title" "Title of the article (BibTeX converts it to lowercase)")) (("pages" "Pages in the journal") ("journal" "Name of the journal (use string, remove braces)") ("year" "Year of publication") ("volume" "Volume of the journal") ("number" "Number of the journal") ("month" "Month of the publication as a string (remove braces)") ("note" "Remarks to be put at the end of the \\bibitem")))) ("Book" ((("author" "Author1 [and Author2 ...] [and others]" nil t) ("editor" "Editor1 [and Editor2 ...] [and others]" nil t) ("title" "Title of the book") ("publisher" "Publishing company") ("year" "Year of publication")) (("volume" "Volume of the book in the series") ("number" "Number of the book in a small series (overwritten by volume)") ("series" "Series in which the book appeared") ("address" "Address of the publisher") ("edition" "Edition of the book as a capitalized English word") ("month" "Month of the publication as a string (remove braces)") ("note" "Remarks to be put at the end of the \\bibitem"))) ((("author" "Author1 [and Author2 ...] [and others]" nil t) ("editor" "Editor1 [and Editor2 ...] [and others]" nil t) ("title" "Title of the book")) (("publisher" "Publishing company") ("year" "Year of publication") ("volume" "Volume of the book in the series") ("number" "Number of the book in a small series (overwritten by volume)") ("series" "Series in which the book appeared") ("address" "Address of the publisher") ("edition" "Edition of the book as a capitalized English word") ("month" "Month of the publication as a string (remove braces)") ("note" "Remarks to be put at the end of the \\bibitem")))) ("Booklet" ((("title" "Title of the booklet (BibTeX converts it to lowercase)")) (("author" "Author1 [and Author2 ...] [and others]") ("howpublished" "The way in which the booklet was published") ("address" "Address of the publisher") ("month" "Month of the publication as a string (remove braces)") ("year" "Year of publication") ("note" "Remarks to be put at the end of the \\bibitem")))) ("Conference" ((("author" "Author1 [and Author2 ...] [and others]") ("title" "Title of the article in proceedings (BibTeX converts it to lowercase)") ("booktitle" "Name of the conference proceedings") ("year" "Year of publication")) (("editor" "Editor1 [and Editor2 ...] [and others]") ("volume" "Volume of the conference proceedings in the series") ("number" "Number of the conference proceedings in a small series (overwritten by volume)") ("series" "Series in which the conference proceedings appeared") ("pages" "Pages in the conference proceedings") ("address" "Location of the Proceedings") ("month" "Month of the publication as a string (remove braces)") ("organization" "Sponsoring organization of the conference") ("publisher" "Publishing company, its location") ("note" "Remarks to be put at the end of the \\bibitem"))) ((("author" "Author1 [and Author2 ...] [and others]") ("title" "Title of the article in proceedings (BibTeX converts it to lowercase)")) (("booktitle" "Name of the conference proceedings") ("pages" "Pages in the conference proceedings") ("year" "Year of publication") ("editor" "Editor1 [and Editor2 ...] [and others]") ("volume" "Volume of the conference proceedings in the series") ("number" "Number of the conference proceedings in a small series (overwritten by volume)") ("series" "Series in which the conference proceedings appeared") ("address" "Location of the Proceedings") ("month" "Month of the publication as a string (remove braces)") ("organization" "Sponsoring organization of the conference") ("publisher" "Publishing company, its location") ("note" "Remarks to be put at the end of the \\bibitem")))) ("InBook" ((("author" "Author1 [and Author2 ...] [and others]" nil t) ("editor" "Editor1 [and Editor2 ...] [and others]" nil t) ("title" "Title of the book") ("chapter" "Chapter in the book") ("publisher" "Publishing company") ("year" "Year of publication")) (("volume" "Volume of the book in the series") ("number" "Number of the book in a small series (overwritten by volume)") ("series" "Series in which the book appeared") ("type" "Word to use instead of \"chapter\"") ("address" "Address of the publisher") ("edition" "Edition of the book as a capitalized English word") ("month" "Month of the publication as a string (remove braces)") ("pages" "Pages in the book") ("note" "Remarks to be put at the end of the \\bibitem"))) ((("author" "Author1 [and Author2 ...] [and others]" nil t) ("editor" "Editor1 [and Editor2 ...] [and others]" nil t) ("title" "Title of the book") ("chapter" "Chapter in the book")) (("pages" "Pages in the book") ("publisher" "Publishing company") ("year" "Year of publication") ("volume" "Volume of the book in the series") ("number" "Number of the book in a small series (overwritten by volume)") ("series" "Series in which the book appeared") ("type" "Word to use instead of \"chapter\"") ("address" "Address of the publisher") ("edition" "Edition of the book as a capitalized English word") ("month" "Month of the publication as a string (remove braces)") ("note" "Remarks to be put at the end of the \\bibitem")))) ("InCollection" ((("author" "Author1 [and Author2 ...] [and others]") ("title" "Title of the article in book (BibTeX converts it to lowercase)") ("booktitle" "Name of the book") ("publisher" "Publishing company") ("year" "Year of publication")) (("editor" "Editor1 [and Editor2 ...] [and others]") ("volume" "Volume of the book in the series") ("number" "Number of the book in a small series (overwritten by volume)") ("series" "Series in which the book appeared") ("type" "Word to use instead of \"chapter\"") ("chapter" "Chapter in the book") ("pages" "Pages in the book") ("address" "Address of the publisher") ("edition" "Edition of the book as a capitalized English word") ("month" "Month of the publication as a string (remove braces)") ("note" "Remarks to be put at the end of the \\bibitem"))) ((("author" "Author1 [and Author2 ...] [and others]") ("title" "Title of the article in book (BibTeX converts it to lowercase)") ("booktitle" "Name of the book")) (("pages" "Pages in the book") ("publisher" "Publishing company") ("year" "Year of publication") ("editor" "Editor1 [and Editor2 ...] [and others]") ("volume" "Volume of the book in the series") ("number" "Number of the book in a small series (overwritten by volume)") ("series" "Series in which the book appeared") ("type" "Word to use instead of \"chapter\"") ("chapter" "Chapter in the book") ("address" "Address of the publisher") ("edition" "Edition of the book as a capitalized English word") ("month" "Month of the publication as a string (remove braces)") ("note" "Remarks to be put at the end of the \\bibitem")))) ("InProceedings" ((("author" "Author1 [and Author2 ...] [and others]") ("title" "Title of the article in proceedings (BibTeX converts it to lowercase)") ("booktitle" "Name of the conference proceedings") ("year" "Year of publication")) (("editor" "Editor1 [and Editor2 ...] [and others]") ("volume" "Volume of the conference proceedings in the series") ("number" "Number of the conference proceedings in a small series (overwritten by volume)") ("series" "Series in which the conference proceedings appeared") ("pages" "Pages in the conference proceedings") ("address" "Location of the Proceedings") ("month" "Month of the publication as a string (remove braces)") ("organization" "Sponsoring organization of the conference") ("publisher" "Publishing company, its location") ("note" "Remarks to be put at the end of the \\bibitem"))) ((("author" "Author1 [and Author2 ...] [and others]") ("title" "Title of the article in proceedings (BibTeX converts it to lowercase)")) (("booktitle" "Name of the conference proceedings") ("pages" "Pages in the conference proceedings") ("year" "Year of publication") ("editor" "Editor1 [and Editor2 ...] [and others]") ("volume" "Volume of the conference proceedings in the series") ("number" "Number of the conference proceedings in a small series (overwritten by volume)") ("series" "Series in which the conference proceedings appeared") ("address" "Location of the Proceedings") ("month" "Month of the publication as a string (remove braces)") ("organization" "Sponsoring organization of the conference") ("publisher" "Publishing company, its location") ("note" "Remarks to be put at the end of the \\bibitem")))) ("Manual" ((("title" "Title of the manual")) (("author" "Author1 [and Author2 ...] [and others]") ("organization" "Publishing organization of the manual") ("address" "Address of the organization") ("edition" "Edition of the manual as a capitalized English word") ("month" "Month of the publication as a string (remove braces)") ("year" "Year of publication") ("note" "Remarks to be put at the end of the \\bibitem")))) ("MastersThesis" ((("author" "Author1 [and Author2 ...] [and others]") ("title" "Title of the master's thesis (BibTeX converts it to lowercase)") ("school" "School where the master's thesis was written") ("year" "Year of publication")) (("type" "Type of the master's thesis (if other than \"Master's thesis\")") ("address" "Address of the school (if not part of field \"school\") or country") ("month" "Month of the publication as a string (remove braces)") ("note" "Remarks to be put at the end of the \\bibitem")))) ("Misc" (nil (("author" "Author1 [and Author2 ...] [and others]") ("title" "Title of the work (BibTeX converts it to lowercase)") ("howpublished" "The way in which the work was published") ("month" "Month of the publication as a string (remove braces)") ("year" "Year of publication") ("note" "Remarks to be put at the end of the \\bibitem")))) ("PhdThesis" ((("author" "Author1 [and Author2 ...] [and others]") ("title" "Title of the PhD. thesis") ("school" "School where the PhD. thesis was written") ("year" "Year of publication")) (("type" "Type of the PhD. thesis") ("address" "Address of the school (if not part of field \"school\") or country") ("month" "Month of the publication as a string (remove braces)") ("note" "Remarks to be put at the end of the \\bibitem")))) ("Proceedings" ((("title" "Title of the conference proceedings") ("year" "Year of publication")) (("booktitle" "Title of the proceedings for cross references") ("editor" "Editor1 [and Editor2 ...] [and others]") ("volume" "Volume of the conference proceedings in the series") ("number" "Number of the conference proceedings in a small series (overwritten by volume)") ("series" "Series in which the conference proceedings appeared") ("address" "Location of the Proceedings") ("month" "Month of the publication as a string (remove braces)") ("organization" "Sponsoring organization of the conference") ("publisher" "Publishing company, its location") ("note" "Remarks to be put at the end of the \\bibitem")))) ("TechReport" ((("author" "Author1 [and Author2 ...] [and others]") ("title" "Title of the technical report (BibTeX converts it to lowercase)") ("institution" "Sponsoring institution of the report") ("year" "Year of publication")) (("type" "Type of the report (if other than \"technical report\")") ("number" "Number of the technical report") ("address" "Address of the institution (if not part of field \"institution\") or country") ("month" "Month of the publication as a string (remove braces)") ("note" "Remarks to be put at the end of the \\bibitem")))) ("Unpublished" ((("author" "Author1 [and Author2 ...] [and others]") ("title" "Title of the unpublished work (BibTeX converts it to lowercase)") ("note" "Remarks to be put at the end of the \\bibitem")) (("month" "Month of the publication as a string (remove braces)") ("year" "Year of publication")))))))
 '(blink-cursor-mode nil)
 '(colon-double-space t)
 '(copyright-query nil)
 '(cua-enable-cua-keys t)
 '(cua-enable-cursor-indications t)
 '(cua-enable-modeline-indications t)
 '(cua-normal-cursor-color (quote (bar . "white")))
 '(cua-overwrite-cursor-color (quote (box . "red")))
 '(cua-read-only-cursor-color (quote (hollow . "yellow")))
 '(default-input-method "TeX")
 '(default-justification (quote left))
 '(delete-old-versions t)
 '(display-hourglass t)
 '(ebib-index-display-fields (quote (year author title)))
 '(ebib-print-multiline t)
 '(ebib-sort-order (quote ((year) (author editor) (title))))
 '(flyspell-highlight-flag t)
 '(flyspell-mode-line-string " Fly")
 '(flyspell-persistent-highlight nil)
 '(flyspell-use-meta-tab nil)
 '(initial-major-mode (quote lisp-interaction-mode))
 '(kept-new-versions 5)
 '(kept-old-versions 5)
 '(make-backup-files t)
 '(ns-right-alternate-modifier nil)
 '(ns-tool-bar-display-mode (quote both) t)
 '(ns-tool-bar-size-mode (quote regular) t)
 '(org-modules (quote (org-bbdb org-bibtex org-docview org-gnus org-info org-jsinfo org-irc org-mew org-mhe org-rmail org-vm org-wl org-w3m org-mac-protocol)))
 '(require-final-newline (quote t))
 '(safe-local-variable-values (quote ((default-justification . full) (TeX-source-correlate-method-active . source-specials) (ispell-default-dictionary . american) (TeX-PDF-mode . t) (folded-file . t))))
 '(save-place t nil (saveplace))
 '(save-place-file "~/.emacs.d/places")
 '(time-stamp-format "%:y-%02m-%02d, %02H:%02M (%Z) %U")
 '(version-control t)
 '(visual-line-mode nil t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(flymake-errline ((((class color)) (:underline "red"))))
 '(flymake-warnline ((((class color)) (:underline "yellow"))))
 '(flyspell-duplicate ((t (:underline "red"))))
 '(flyspell-incorrect ((t (:underline "red"))))
 '(writegood-duplicates-face ((t (:underline "DeepPink"))))
 '(writegood-passive-voice-face ((t (:underline "DeepPink"))))
 '(writegood-weasels-face ((((class color) (background dark)) (:underline "DeepPink")))))
