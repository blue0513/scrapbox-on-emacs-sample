# Scrapbox-on-Emacs-sample

A use case of scrapbox on Emacs

## Usage

#### 1. Set the Path to the shellscripts on sample.el

```el
(defun my-index-scrapbox ()
	(interactive)
	(async-shell-command
		"/path/to/get_scrapbox_page_titles.sh"))
```

#### 2. Fill blank on shellscripts

Edit your `get_scrapbox_page.sh`, `get_scrapbox_page_titlets.sh` as follows.

```sh
response=$(curl -s "[Your Request]")
# [Your Request]: "https://scrapbox.io/api/pages/[PROJECT_NAME]/search/titles"
```

#### 3. Execute

```el
M-x my-index-scrapbox
```
