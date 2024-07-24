;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Eduardo Lucca"
      user-mail-address "lucca.ed@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "monospace" :size 14 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "sans" :size 15))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-gruvbox)
(setq scroll-margin 20)
;; (setq fancy-splash-image "~/.doom.d/robot.png")
 ;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/")
(setq org-agenda-files '("~/Dropbox/agenda.org"))
;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)
(setq confirm-kill-emacs nil)
(setq package-enable-at-startup nil)
;; (setq toggle-full-screen t)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
;; Here are some additional functions/macros that could help you configure Doom:

;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c m c") 'mc/edit-lines)

;;(setq inhibit-splash-screen t)
;;(setq inhibit-startup-screen t)
;;(setq inhibit-startup-message t)
;; (add-hook 'after-init-hook 'find-file "~/Dropbox/agenda.org")
;; (desktop-save-mode 1)
;; (add-hook 'emacs-startup-hook
;;           (lambda ()
;;             (find-file "~/Dropbox/Daily/tasks.org")
;;             (split-window-horizontally)
;;             (find-file-other-window "~/Dropbox/Daily/Projetos.org")))

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

(setq calendar-mark-diary-entries-flag t)
(setq calendar-mark-holidays-flag nil)
(setq calendar-mode-line-format nil)
(setq calendar-time-display-form
      '(24-hours ":" minutes
                 (if time-zone " (") time-zone (if time-zone ")" time-zone)))
(setq calendar-date-style 'iso)
(setq calendar-set-date-style 'iso)
(setq diary-set-date-style 'iso)
(setq org-agenda-include-diary t)
(setq org-log-done t)
(setq org-agenda-files '("~/Dropbox/agenda.org"
                         "~/Dropbox/todo.org"
                         "~/Dropbox/journal.org"))

(setq org-agenda-span 7)
(setq org-agenda-skip-deadline-if-done t)
(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-start-on-weekday nil)

;;==============================Ivy Postframe===================================

(use-package ivy-posframe
  :init
  (setq ivy-posframe-display-functions-alist
    '((swiper                     . ivy-posframe-display-at-window-center)
      (complete-symbol            . ivy-posframe-display-at-window-center)
      (counsel-M-x                . ivy-posframe-display-at-window-center)
      (counsel-esh-history        . ivy-posframe-display-at-window-center)
      (counsel-describe-function  . ivy-posframe-display-at-window-center)
      (counsel-describe-variable  . ivy-posframe-display-at-window-center)
      (counsel-find-file          . ivy-posframe-display-at-window-center)
      (counsel-recentf            . ivy-posframe-display-at-window-center)
      (counsel-register           . ivy-posframe-display-at-window-center)
      (dmenu                      . ivy-posframe-display-at-window-center)
      (nil                        . ivy-posframe-display))
    ivy-posframe-height-alist
    '((swiper . 20)
      (dmenu . 20)
      (t . 20)))
  :config
  (ivy-posframe-mode 1)) ; 1 enables posframe-mode, 0 disables it.

;;==============================Deft============================================

(after! deft
    (setq deft-directory "~/Dropbox/")
    (setq deft-recursive t)
)

;;==============================Org roam========================================

(after! org-roam
  (setq org-roam-directory "~/Dropbox/org-roam")
  (setq org-roam-completion-everywhere t)
  :config
  (org-roam-setup)
  (org-roam-db-autosync-mode)
  ;;        org-roam-graph-viewer (executable-find "vimb")
  ;; setq org-roam-graph-executable "/usr/bin/neato")

  (setq bibtex-completion-bibliography '("~/Dropbox/bibliography.bib" "~/Dropbox/Referencias.bib")
        bibtex-completion-library-path '(("~/Dropbox/ref-pdfs")("~/Documentos/Livros"))
        ;; bibtex-completion-find-note-functions '(orb-find-note-file)
        )

  (setq org-roam-dailies-capture-templates
        '(("d" "daily" plain
           ;; '(function org-roam-capture--get-point)
           ""
           ;; :immediate-finish t
           :target (file+head "private-%<%Y-%m-%d>.org"
                              "#+TITLE: %<%Y-%m-%d>")
           :unnarrowed t)
          ("t" "today" plain
           ;; '(function org-roam-capture--get-point)
           ""
           ;; :immediate-finish t
           :target (file+head "private-%<%Y-%m-%d>.org"
                              "#+TITLE: %<%Y-%m-%d>")
           :unnarrowed t)))

  (setq orb-preformat-keywords
        '("=key=" "title" "url" "file" "author-or-editor" "keywords" "journal")
        orb-process-file-keyword t
        orb-file-field-extensions '("pdf"))

  (setq org-roam-capture-templates
        '(("a" "artigos" plain "%?"
           :target (file+head "${=key=}.org"
 "#+TITLE: ${=key=}: ${title}
#+ROAM_KEY: ${ref}
#+ROAM_TAGS: article

- tags ::
- keywords :: ${keywords}

* Dados
  :PROPERTIES:
  :Custom_ID: ${=key=}
  :AUTHOR: ${author-or-editor}
  :DOI: ${doi}
  :FILE: [[~/Dropbox/ref-pdfs/${=key=}.pdf]]

* NOTES
")
           :unnarrowed t)
          ("r" "ref" plain "%?"
            :target (file+head "@${slug}.org"
                               "#+title: ${title}\n")
            :unnarrowed t)
          ("l" "livros" plain "%?"
           :target (file+head "${=key=}.org"
"#+TITLE : ${title}
:FILE: [[~/Dropbox/Documentos/Livros/${=key=}.pdf]]
"):unnarrowed t))))

(setq org-re-reveal-klipsify-src t)

;;==============================Org ref=========================================

(use-package! org-ref)
(after! org-ref
    (setq bibtex-completion-bibliography '("~/Dropbox/bibliography.bib" "~/Dropbox/Referencias.bib")
          bibtex-completion-library-path '("~/Dropbox/ref-pdfs/")
          bibtex-completion-notes-template-multiple-files "* TODO %y - %t\n :PROPERTIES:\n  :Custom_ID: %k\n  :NOTER_DOCUMENT: %F\n :ROAM_KEY: cite:%k\n  :AUTHOR: %9a\n  :JOURNAL: %j\n  :YEAR: %y\n  :VOLUME: %v\n  :PAGES: %p\n  :DOI: %D\n  :URL: %U\n :END:\n\n"
          bibtex-completion-notes-path "~/Dropbox/notes/"
          ;; org-ref-notes-function 'orb-edit-notes)
;; (require 'org-ref-ivy)
;; (setq org-ref-insert-link-function 'org-ref-insert-link-hydra/body
;;       org-ref-insert-cite-function 'org-ref-cite-insert-ivy
;;       org-ref-insert-label-function 'org-ref-insert-label-link
;;       org-ref-insert-ref-function 'org-ref-insert-ref-link
;;       org-ref-cite-onclick-function (lambda (_)
;;                                       (org-ref-citation-hydra/body)))

    ))

;;==============================Org roam bibtex=================================
(use-package! org-roam-bibtex
  :after (org-roam)
  :hook (org-roam-mode . org-roam-bibtex-mode)
  :config
  (setq org-roam-server-host "172.16.3.168")
 (require 'org-roam-protocol)
)

(org-roam-bibtex-mode)
;; (use-package! org-roam-server)

;;==============================Org journal=====================================
(use-package! org-journal
  :bind
  ("C-c n j" . org-journal-new-entry)
  ("C-c n t" . org-journal-today)
  :config
  (setq org-journal-date-prefix "#+TITLE: "
        org-journal-time-prefix "* "
        org-journal-file-format "%Y-%m-%d.org"
        org-journal-dir "~/Dropbox/journal"
        org-journal-carryover-items nil
        org-journal-date-format "%Y-%m-%d")
  ;; do not create title for dailies
  (set-file-template! "/private-.*\\.org$"    :trigger ""    :mode 'org-mode)
  (print +file-templates-alist)
  (defun org-journal-today ()
    (interactive)
    (org-journal-new-entry t)))

;;==============================Org noter=======================================

(use-package! org-noter
  :config
  (setq
   org-noter-pdftools-markup-pointer-color "yellow"
   org-noter-notes-search-path '("~/Dropbox/notes/")
   ;; org-noter-insert-note-no-questions t
   org-noter-doc-split-fraction '(0.6 . 04)
   org-noter-always-create-frame nil
   org-noter-hide-other nil
   org-noter-pdftools-free-pointer-icon "Note"
   org-noter-pdftools-free-pointer-color "red"
   org-noter-kill-frame-at-session-end nil
   )
    (map! :map (pdf-view-mode)
        :leader
        (:prefix-map ("n" . "notes")
         :desc "Write notes"                    "w" #'org-noter)
        )
  )

;;=============================Org pdftools=====================================

(use-package! org-pdftools
  :hook (with-eval-after-load . org-pdftools-setup-link))
(use-package! org-noter-pdftools
  :after org-noter
  :config
  (with-eval-after-load 'pdf-annot
    (add-hook 'pdf-annot-activate-handler-functions #'org-noter-pdftools-jump-to-note)))

;;==============================Org roam ui=====================================

(use-package! websocket
  :after org-roam)

(use-package! org-roam-ui
  :after org-roam
  :commands org-roam-ui-open
  :hook (org-roam . org-roam-ui-mode)
  :config
  (require 'org-roam) ; in case autoloaded
  :config (defun org-roam-ui-open ()
            "Ensure the server is active, then open the roam graph."
            (interactive)
            (unless org-roam-ui-mode (org-roam-ui-mode 1))
            (browse-url-xdg-open (format "http://localhost:%d" org-roam-ui-port))))

;;==============================Org Present=====================================

(use-package org-present
  :bind (:map org-present-mode-keymap
         ("C-c C-j" . dw/org-present-next)
         ("C-c C-k" . dw/org-present-prev))
  :hook ((org-present-mode . dw/org-present-hook)
         (org-present-mode-quit . dw/org-present-quit-hook)))

:config (defun dw/org-present-prepare-slide ()
  (org-overview)
  (org-show-entry)
  (show-children))

:config (defun dw/org-present-hook ()
  (setq-local face-remapping-alist '((default (:height 1.5) variable-pitch)
                                     (header-line (:height 4.5) variable-pitch)
                                     (org-code (:height 1.55) org-code)
                                     (org-verbatim (:height 1.55) org-verbatim)
                                     (org-block (:height 1.25) org-block)
                                     (org-block-begin-line (:height 0.7) org-block)))
  (setq header-line-format " ")
  (org-display-inline-images)
  (dw/org-present-prepare-slide))

:config (defun dw/org-present-quit-hook ()
  (setq-local face-remapping-alist '((default variable-pitch default)))
  (setq header-line-format nil)
  (org-present-small)
  (org-remove-inline-images))

:config (defun dw/org-present-prev ()
  (interactive)
  (org-present-prev)
  (dw/org-present-prepare-slide))

:config (defun dw/org-present-next ()
  (interactive)
  (org-present-next)
  (dw/org-present-prepare-slide))

;;==============================Latex===========================================

(setq org-capture-templates
      '(("t" "Tarefas" entry
         (file+headline "~/Dropbox/Daily/tasks.org" "TAREFAS")
         "* [ ] %?")
        ("p" "Projetos Pessoais" entry
         (file+headline "~/Dropbox/Daily/Projetos.org" "MEUS PROJETOS")
         "* Projeto %? [/]")
        ("c" "Coisas a comprar" entry
         (file+headline "~/Dropbox/Daily/compras.org" "LISTA DE DESEJOS")
         "* [ ] %?
Modelo ->
Preço ->
Site 1 ->
Site 2 ->
Site 3 ->")
        ("m" "Lista Mercado" entry
         (file+headline "~/Dropbox/Daily/lista_mercado.org" "LISTA MERCADO")
         "* [ ] %?")))

;;==============================Pomodoro========================================

;; (use-package org-pomodoro
;;   :after org
;;   :config
;;   (setq org-pomodoro-start-sound "~/.doom.d/bell.wav")
;;   ;; (setq org-pomodoro-short-break-sound "~/.dotfiles/.emacs.d/sounds/three_beeps.wav")
;;   ;; (setq org-pomodoro-long-break-sound "~/.dotfiles/.emacs.d/sounds/three_beeps.wav")
;;   (setq org-pomodoro-finished-sound "~/.doom.d/bell.wav"))
(setq org-clock-sound "~/.doom.d/bell.wav")
(map! :leader
      (:prefix "t")
      :desc "Iniciar pomodoro" "1" #'org-timer-set-timer
      :desc "Finalizar pomodoro" "2" #'org-timer-stop)

(setq calendar-date-style 'iso)
(setq calendar-date-display-form calendar-iso-date-display-form)
(remove-hook 'calendar-mode-hook #'org--setup-calendar-bindings)

;;==============================Email===========================================

(with-eval-after-load 'ox-latex
  (add-to-list 'org-latex-classes
               '("org-plain-latex" ;; I use this in base class in all of my org exports.
                 "\\documentclass{extarticle}
         [NO-DEFAULT-PACKAGES]
         [PACKAGES]
         [EXTRA]"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
  (add-to-list 'org-latex-classes
               '("abntex2"
                 "\\documentclass{abntex2}
                  [NO-DEFAULT-PACKAGES]
                  [EXTRA]"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")
                 ("\\maketitle" . "\\imprimircapa")))
(add-to-list 'org-latex-classes
          '("koma-article"
             "\\documentclass{scrartcl}"
             ("\\section{%s}" . "\\section*{%s}")
             ("\\subsection{%s}" . "\\subsection*{%s}")
             ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
             ("\\paragraph{%s}" . "\\paragraph*{%s}")
             ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
(add-to-list 'org-latex-classes
             '("ethz"
               "\\documentclass[a4paper,11pt,titlepage]{memoir}
\\usepackage[utf8]{inputenc}
\\usepackage[T1]{fontenc}
\\usepackage{fixltx2e}
\\usepackage{graphicx}
\\usepackage{longtable}
\\usepackage{float}
\\usepackage{wrapfig}
\\usepackage{rotating}
\\usepackage[normalem]{ulem}
\\usepackage{amsmath}
\\usepackage{textcomp}
\\usepackage{marvosym}
\\usepackage{wasysym}
\\usepackage{amssymb}
\\usepackage{hyperref}
\\usepackage{mathpazo}
\\usepackage{color}
\\usepackage{enumerate}
\\definecolor{bg}{rgb}{0.95,0.95,0.95}
\\tolerance=1000
      [NO-DEFAULT-PACKAGES]
      [PACKAGES]
      [EXTRA]
\\linespread{1.1}
\\hypersetup{pdfborder=0 0 0}"
               ("\\chapter{%s}" . "\\chapter*{%s}")
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
)

;;==============================Org Bullets=====================================
(use-package org-bullets
  ;; :after org
  ;; :hook (org-mode . org-bullets)
  :custom
  ;; (org-superstar-remove-leading-stars t)
  (org-bullets-bullet-list '("֍" "ॐ" "፠" "Ø" "א" "҉" "҈")))
   ;; '("家" "ॐ" "同" "Ø" "א" "҉ " "҈ ")))

;; (require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;;==============================Projectile======================================

(use-package projectile
  :config
  (projectile-global-mode 1))

;;==============================Dashboard=======================================

;;(use-package dashboard
;;  :init      ;; tweak dashboard config before loading it
  ;; (setq dashboard-set-heading-icons t)
  ;; (setq dashboard-set-file-icons t)
;;  (setq dashboard-banner-logo-title "Emacs Is More Than A Text Editor!")
;;  (setq dashboard-startup-banner 'logo) ;; use standard emacs logo as banner
  ;; (setq dashboard-startup-banner "~/.emacs.d/emacs-dash.png")  ;; use custom image as banner
;;  (setq dashboard-center-content t) ;; set to 't' for centered content
;;  (setq dashboard-items '((recents . 5)
;;                          (agenda . 5 )
;;                          (bookmarks . 3)
;;                         (projects . 3)
;;                          (registers . 3)))

;;  :config
;;  (dashboard-setup-startup-hook)
;;  (dashboard-modify-heading-icons '((recents . "file-text")
;;			      (bookmarks . "book"))))

;;==============================Ox extra========================================

;;(use-package ox-extra)
;; (ox-extras-activate '(ignore-headlines))

;; (add-to-list 'load-path (format "%s/dist/jdee-2.4.1/lisp" my-jdee-path))
;;  (autoload 'jde-mode "jde" "JDE mode" t)
;;  (setq auto-mode-alist
;;        (append '(("\\.java\\'" . jde-mode)) auto-mode-alist))
