;; Set the package installation directory so that packages aren't stored in the
;; ~/.emacs.d/elpa path.
(require 'package)
(setq package-user-dir (expand-file-name "./.packages"))
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

;; Initialize the package system
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Install dependencies
(package-install 'htmlize)

(require 'ox-publish)
(setq org-publish-project-alist
      (list
       (list "org-site:main"
	     :recursive t
	     :author "Lynn Leichtle"
	     :language "English"
	     :base-directory "./content"
	     :publishing-directory "./public"
	     :with-author nil
	     :with-creator t
	     :with-toc nil
	     :with-title nil
	     :with-todo-keywords t
	     :section-numbers nil
	     :time-stamp-file nil
	     :auto-sitemap t
	     :publishing-fuction 'org-html-publish-to-html)))
(setq org-html-validation-link nil            ;; Don't show validation link
      org-html-head-include-scripts nil       ;; Use our own scripts
      org-html-head-include-default-style nil ;; Use our own styles
      org-html-head "<link rel=\"stylesheet\" href=\"https://cdn.simplecss.org/simple.min.css\" />")
(setq org-html-htmlize-output-type 'css)
(org-publish-all t)
(message "Build Complete!")
