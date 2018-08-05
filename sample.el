;; Create New Page with Selected Text
;; or Insert Selected Text to the Existing Page's Last Row
(defun my-post-scrapbox(beg end string)
  (interactive "r\nsPageName: ")
  (if mark-active
      (progn
	(let* ((body-string (buffer-substring-no-properties beg end))
	       (page-name string))
	  (browse-url
	   (concat "https://scrapbox.io/[Your Project Name]/" page-name
		   "?body=" body-string))))
    (message "No Region Selected")))

;; Show the Page Body
(defun my-get-scrapbox (page-name)
  (interactive "sPageName:")
  (async-shell-command
   (concat "~/shellscript/scrapbox/get_scrapbox_page.sh " page-name)))

;; Show Page Titles
(defun my-index-scrapbox ()
  (interactive)
  (async-shell-command "~/shellscript/scrapbox/get_scrapbox_page_titles.sh"))
