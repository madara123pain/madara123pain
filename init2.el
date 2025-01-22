;; -------------------------------------
;; Basic Configurations
;; -------------------------------------

(setq inhibit-splash-screen t)
(setq initial-buffer-choice "*scratch*")
(add-to-list 'default-frame-alist '(alpha-background . 100))

(tool-bar-mode -1)
(menu-bar-mode -1)
(tooltip-mode -1)
(scroll-bar-mode -1)
(set-face-attribute 'default nil :height 150)
(global-set-key (kbd "C-S-f") 'toggle-frame-fullscreen)
(electric-indent-mode 1)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; -------------------------------------
;; Package Management
;; -------------------------------------

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Use-package Bootstrapping
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; -------------------------------------
;; Appearance
;; -------------------------------------

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'kanagawa-wave t t)
(enable-theme 'kanagawa-wave)

(use-package all-the-icons :ensure t)

;; Doom Modeline
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom
  (doom-modeline-height 25)
  (doom-modeline-buffer-file-name-style 'auto)
  (doom-modeline-icon t)
  (doom-modeline-lsp t)
  (doom-modeline-project-name t))

;; If non-nil, cause imenu to see `doom-modeline' declarations.
;; This is done by adjusting `lisp-imenu-generic-expression' to
;; include support for finding `doom-modeline-def-*' forms.
;; Must be set before loading doom-modeline.
(setq doom-modeline-support-imenu t)

;; How tall the mode-line should be. It's only respected in GUI.
;; If the actual char height is larger, it respects the actual height.
(setq doom-modeline-height 25)

;; How wide the mode-line bar should be. It's only respected in GUI.
(setq doom-modeline-bar-width 4)

;; Whether to use hud instead of default bar. It's only respected in GUI.
(setq doom-modeline-hud nil)

;; The limit of the window width.
;; If `window-width' is smaller than the limit, some information won't be
;; displayed. It can be an integer or a float number. `nil' means no limit."
(setq doom-modeline-window-width-limit 85)

;; Override attributes of the face used for padding.
;; If the space character is very thin in the modeline, for example if a
;; variable pitch font is used there, then segments may appear unusually close.
;; To use the space character from the `fixed-pitch' font family instead, set
;; this variable to `(list :family (face-attribute 'fixed-pitch :family))'.
(setq doom-modeline-spc-face-overrides nil)

;; How to detect the project root.
;; nil means to use `default-directory'.
;; The project management packages have some issues on detecting project root.
;; e.g. `projectile' doesn't handle symlink folders well, while `project' is unable
;; to hanle sub-projects.
;; You can specify one if you encounter the issue.
(setq doom-modeline-project-detection 'auto)

;; Determines the style used by `doom-modeline-buffer-file-name'.
;;
;; Given ~/Projects/FOSS/emacs/lisp/comint.el
;;   auto => emacs/l/comint.el (in a project) or comint.el
;;   truncate-upto-project => ~/P/F/emacs/lisp/comint.el
;;   truncate-from-project => ~/Projects/FOSS/emacs/l/comint.el
;;   truncate-with-project => emacs/l/comint.el
;;   truncate-except-project => ~/P/F/emacs/l/comint.el
;;   truncate-upto-root => ~/P/F/e/lisp/comint.el
;;   truncate-all => ~/P/F/e/l/comint.el
;;   truncate-nil => ~/Projects/FOSS/emacs/lisp/comint.el
;;   relative-from-project => emacs/lisp/comint.el
;;   relative-to-project => lisp/comint.el
;;   file-name => comint.el
;;   file-name-with-project => FOSS|comint.el
;;   buffer-name => comint.el<2> (uniquify buffer name)
;;
;; If you are experiencing the laggy issue, especially while editing remote files
;; with tramp, please try `file-name' style.
;; Please refer to https://github.com/bbatsov/projectile/issues/657.
(setq doom-modeline-buffer-file-name-style 'auto)

;; Whether display icons in the mode-line.
;; While using the server mode in GUI, should set the value explicitly.
(setq doom-modeline-icon t)

;; Whether display the icon for `major-mode'. It respects option `doom-modeline-icon'.
(setq doom-modeline-major-mode-icon t)

;; Whether display the colorful icon for `major-mode'.
;; It respects `nerd-icons-color-icons'.
(setq doom-modeline-major-mode-color-icon t)

;; Whether display the icon for the buffer state. It respects option `doom-modeline-icon'.
(setq doom-modeline-buffer-state-icon t)

;; Whether display the modification icon for the buffer.
;; It respects option `doom-modeline-icon' and option `doom-modeline-buffer-state-icon'.
(setq doom-modeline-buffer-modification-icon t)

;; Whether display the lsp icon. It respects option `doom-modeline-icon'.
(setq doom-modeline-lsp-icon t)

;; Whether display the time icon. It respects option `doom-modeline-icon'.
(setq doom-modeline-time-icon t)

;; Whether display the live icons of time.
;; It respects option `doom-modeline-icon' and option `doom-modeline-time-icon'.
(setq doom-modeline-time-live-icon t)

;; Whether to use an analogue clock svg as the live time icon.
;; It respects options `doom-modeline-icon', `doom-modeline-time-icon', and `doom-modeline-time-live-icon'.
(setq doom-modeline-time-analogue-clock t)

;; The scaling factor used when drawing the analogue clock.
(setq doom-modeline-time-clock-size 0.7)

;; Whether to use unicode as a fallback (instead of ASCII) when not using icons.
(setq doom-modeline-unicode-fallback nil)

;; Whether display the buffer name.
(setq doom-modeline-buffer-name t)

;; Whether highlight the modified buffer name.
(setq doom-modeline-highlight-modified-buffer-name t)

;; When non-nil, mode line displays column numbers zero-based.
;; See `column-number-indicator-zero-based'.
(setq doom-modeline-column-zero-based t)

;; Specification of \"percentage offset\" of window through buffer.
;; See `mode-line-percent-position'.
(setq doom-modeline-percent-position '(-3 "%p"))

;; Format used to display line numbers in the mode line.
;; See `mode-line-position-line-format'.
(setq doom-modeline-position-line-format '("L%l"))

;; Format used to display column numbers in the mode line.
;; See `mode-line-position-column-format'.
(setq doom-modeline-position-column-format '("C%c"))

;; Format used to display combined line/column numbers in the mode line. See `mode-line-position-column-line-format'.
(setq doom-modeline-position-column-line-format '("%l:%c"))

;; Whether display the minor modes in the mode-line.
(setq doom-modeline-minor-modes nil)

;; If non-nil, a word count will be added to the selection-info modeline segment.
(setq doom-modeline-enable-word-count nil)

;; Major modes in which to display word count continuously.
;; Also applies to any derived modes. Respects `doom-modeline-enable-word-count'.
;; If it brings the sluggish issue, disable `doom-modeline-enable-word-count' or
;; remove the modes from `doom-modeline-continuous-word-count-modes'.
(setq doom-modeline-continuous-word-count-modes '(markdown-mode gfm-mode org-mode))

;; Whether display the buffer encoding.
(setq doom-modeline-buffer-encoding t)

;; Whether display the indentation information.
(setq doom-modeline-indent-info nil)

;; Whether display the total line number。
(setq doom-modeline-total-line-number nil)

;; Whether display the icon of vcs segment. It respects option `doom-modeline-icon'."
(setq doom-modeline-vcs-icon t)

;; The maximum displayed length of the branch name of version control.
(setq doom-modeline-vcs-max-length 15)

;; The function to display the branch name.
(setq doom-modeline-vcs-display-function #'doom-modeline-vcs-name)

;; Whether display the icon of check segment. It respects option `doom-modeline-icon'.
(setq doom-modeline-check-icon t)

;; If non-nil, only display one number for check information if applicable.
(setq doom-modeline-check-simple-format nil)

;; The maximum number displayed for notifications.
(setq doom-modeline-number-limit 99)

;; Whether display the project name. Non-nil to display in the mode-line.
(setq doom-modeline-project-name t)

;; Whether display the workspace name. Non-nil to display in the mode-line.
(setq doom-modeline-workspace-name t)

;; Whether display the perspective name. Non-nil to display in the mode-line.
(setq doom-modeline-persp-name t)

;; If non nil the default perspective name is displayed in the mode-line.
(setq doom-modeline-display-default-persp-name nil)

;; If non nil the perspective name is displayed alongside a folder icon.
(setq doom-modeline-persp-icon t)

;; Whether display the `lsp' state. Non-nil to display in the mode-line.
(setq doom-modeline-lsp t)

;; Whether display the GitHub notifications. It requires `ghub' package.
(setq doom-modeline-github nil)

;; The interval of checking GitHub.
(setq doom-modeline-github-interval (* 30 60))

;; Whether display the modal state.
;; Including `evil', `overwrite', `god', `ryo' and `xah-fly-keys', etc.
(setq doom-modeline-modal t)

;; Whether display the modal state icon.
;; Including `evil', `overwrite', `god', `ryo' and `xah-fly-keys', etc.
(setq doom-modeline-modal-icon t)

;; Whether display the modern icons for modals.
(setq doom-modeline-modal-modern-icon t)

;; When non-nil, always show the register name when recording an evil macro.
(setq doom-modeline-always-show-macro-register nil)


;; Whether display the gnus notifications.
(setq doom-modeline-gnus t)

;; Whether gnus should automatically be updated and how often (set to 0 or smaller than 0 to disable)
(setq doom-modeline-gnus-timer 2)

;; Wheter groups should be excludede when gnus automatically being updated.
(setq doom-modeline-gnus-excluded-groups '("dummy.group"))

;; Whether display the IRC notifications. It requires `circe' or `erc' package.
(setq doom-modeline-irc t)

;; Function to stylize the irc buffer names.
(setq doom-modeline-irc-stylize 'identity)

;; Whether display the battery status. It respects `display-battery-mode'.
(setq doom-modeline-battery t)

;; Whether display the time. It respects `display-time-mode'.
(setq doom-modeline-time t)

;; Whether display the misc segment on all mode lines.
;; If nil, display only if the mode line is active.
(setq doom-modeline-display-misc-in-all-mode-lines t)

;; The function to handle `buffer-file-name'.
(setq doom-modeline-buffer-file-name-function #'identity)

;; The function to handle `buffer-file-truename'.
(setq doom-modeline-buffer-file-truename-function #'identity)

;; Whether display the environment version.
(setq doom-modeline-env-version t)
;; Or for individual languages
(setq doom-modeline-env-enable-python t)
(setq doom-modeline-env-enable-ruby t)
(setq doom-modeline-env-enable-perl t)
(setq doom-modeline-env-enable-go t)
(setq doom-modeline-env-enable-elixir t)
(setq doom-modeline-env-enable-rust t)

;; Change the executables to use for the language version string
(setq doom-modeline-env-python-executable "python") ; or `python-shell-interpreter'
(setq doom-modeline-env-ruby-executable "ruby")
(setq doom-modeline-env-perl-executable "perl")
(setq doom-modeline-env-go-executable "go")
(setq doom-modeline-env-elixir-executable "iex")
(setq doom-modeline-env-rust-executable "rustc")

;; What to display as the version while a new one is being loaded
(setq doom-modeline-env-load-string "...")

;; By default, almost all segments are displayed only in the active window. To
;; display such segments in all windows, specify e.g.
(setq doom-modeline-always-visible-segments '(mu4e irc))

;; Hooks that run before/after the modeline version string is updated
(setq doom-modeline-before-update-env-hook nil)
(setq doom-modeline-after-update-env-hook nil)

;; Don’t compact font caches during GC.
(setq inhibit-compacting-font-caches t)

;; -------------------------------------
;; Python Development
;; -------------------------------------

(use-package eglot
  :ensure t
  :hook (python-mode . eglot-ensure))

(use-package flycheck
  :ensure t
  :hook (python-mode . flycheck-mode))

;; -------------------------------------
;; Code Completion and Navigation
;; -------------------------------------

(use-package corfu
  :ensure t
  :hook (prog-mode . corfu-mode)
  :config
  (setq corfu-auto t)
  (setq corfu-quit-no-match 'separator))

(use-package vertico
  :ensure t
  :init (vertico-mode))

(use-package marginalia
  :ensure t
  :init (marginalia-mode))

;; -------------------------------------
;; Undo and File Tree
;; -------------------------------------

;; Define M-SPC as a prefix key
(define-prefix-command 'my-custom-prefix)
(global-set-key (kbd "M-SPC") 'my-custom-prefix)

;; Compile Shortcut
(global-set-key (kbd "M-SPC c")
                (lambda ()
                  (interactive)
                  (let ((file (read-file-name "Enter the file to compile: ")))
                    (compile (format "gcc %s -o %s"
                                     file
                                     (file-name-sans-extension file))))))


;; Undo Tree
(use-package undo-tree
  :ensure t
  :init (global-undo-tree-mode)
  :bind (("M-SPC z" . undo-tree-visualize)))

;; Treemacs
(use-package treemacs
  :ensure t
  :bind (("M-SPC t" . treemacs)))
;; -------------------------------------
;; Additional Configurations
;; -------------------------------------

;; Add other customizations or settings here...
;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;;'(highlight-indent-guides-character-face ((t (:foreground "gray")))))
 ;; Lighter gray for 'character' method



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("42d116236094bbb32033705237877aa3e83d436649c92e541e941347f0a7e605" "daa27dcbe26a280a9425ee90dc7458d85bd540482b93e9fa94d4f43327128077" "ae9ce658bc67b3c57145237ca5d565d46dc852633a6b576afea8f2356b6d9c2f" "d2ab3d4f005a9ad4fb789a8f65606c72f30ce9d281a9e42da55f7f4b9ef5bfc6" "0ec7094cc0a201c1d6f7c37f2414595d6684403b89b6fd74dcc714b5d41cd338" "4c8372c68b3eab14516b6ab8233de2f9e0ecac01aaa859e547f902d27310c0c3" "0ea5731605469a81203311ad7b4b3db03d6d7249ce621e3f2793ae3613d165ed" "be2c1a78f42783eab9ff068c3f09e81a7908a77a1d288ce8d704491165ef448b" "9939e735844cb24144d29ddf03fadf86a2d455758afeeee30372258e8a6401bb" "026eff18f1c0fda8f9bf5738343019a8ebe8db55c1bd9bcbd4536d8ed112d5df" "d3c9e352f83ce4cd3ded6219797b0d389a69e42e94ce8664f974b1cb780f00fa" "de91ca749d94ed6109ea1425e7e38286e1e7a97f947b375133357bbc7f87c4b7" "3e89095e1645f2f295913833ce9bc756868d304c62430c085a53b7c5d9df2ce0" "1d14782c4a36e1429e2eb1c79a5c7ff75fb6d569a8ae4cc4864a2249750a35fa" "b0fa71bba7c84b6b8aaaabb56f1adb244edc63836f9eb942032686be902cece5" "f95479182d418f2c56a58db4838db03b2d12fa5f7b86d3ad8ce675f8b3b04454" "bc8de92702dba965f3462bd10b8324a7e1d12b2ab4ba98ef32de0b935b7d1edd" "6fd9709cc345374052a408a74ec779e2db5e2e7475d416b53d7b26c6bbf8f691" "02b38155e12fdcb74fa8d1d6828a589025a5b312febf9f9f27a3f241b04df405" "8e5f723fc78532cfe9d76fd804dcd05ed5ea1eeea65507e25723b9e5934b1cbd" "922f930fc5aeec220517dbf74af9cd2601d08f8250e4a15c385d509e22629cac" "32b75b124f7f84517d3803a13a807189bae717b9d28e68e5a327a8ba55b7a6ee" "39f0ac86b012062fed46469cc5ea1b00aa534db587ad21d55a9717a1bac99a27" "8c867d38498653a86c1071714502d01eabb8d8c9ec976a7ddc4d04c23a991a97" "60e17fd6969316b3fbe44a3163f70fb474a4fdf560c2a7f080de6db4bc531d6d" "1a5c931c8cad2bbe452a51b8d2718a501019d69e8e1f7385e528b45e09813861" "0a61a2f4de7cbe1b2914ead1c91c831be16ec24fa4d90bb0096ca06c787100a3" "695bf4843e55f3d69e8ebd0db436a1a11dcdd35b88482daf1cd725a7edf26dbf" "9ce4b3ac37b674701fb3339b9581b1085b01bfd1892f63c95365205d16481b36" "51fa6edfd6c8a4defc2681e4c438caf24908854c12ea12a1fbfd4d055a9647a3" "f7c3488946694f912be7edcb0a6ba554829226293e755e75689b44e23e680660" "c0f5e28638d29ba60d32905b8764bb143439ddc40cd26f4d19378f64dc92e780" "0ee1af0187cd3a9236bebcd7536407a211710082b1d34dddef2680b7c6c2032e" "336d96feb94d15ce9ce6451b218f8501b1e329e94e07bd571b269b403a360211" "5aedf993c7220cbbe66a410334239521d8ba91e1815f6ebde59cecc2355d7757" "8363207a952efb78e917230f5a4d3326b2916c63237c1f61d7e5fe07def8d378" "8310462f5008fe10661e27ceab164e05c509343641cc262134fc623422b5999d" "0c5204945ca5cdf119390fe7f0b375e8d921e92076b416f6615bbe1bd5d80c88" "6a2cc07c407e8321f0df155988e60b39fe6f2488d2c79a6b14211854ea6fbc52" "3a3be00b3338b24525945e374423f5bb1a45eb17f0095dbe8f945e02251bf40f" "526a079fd20fce7190f813429028111c906bde86bfecad5b26d14bbdb7b539d0" "a4ef58c2fb31b065ad09fa3029adba5eb518e42ef104cf9acf7c409abf40ca55" "39a854967792547c704cbff8ad4f97429f77dfcf7b3b4d2a62679ecd34b608da" "ff8be9ed2696bf7bc999423d909a603cb23a9525bb43135c0d256b0b9377c958" "0a33634487515fe4cb38c0281ba517730c2ddc11731a47a2a2e93cebb430d32d" "5b0a501103526e95dc1db72e22ad55f5f9ad1353fbd48726bf36be2e567572ab" "ef0ac6b4b484559f7346148800a2aa43f184eaaf0177be93a4ec6ef30456a803" "9125229883c17442121c800386d9a9e6b10ff8d24bd289061945a57684e6800f" "266f0484a1c25902661cc650561d104acb41645073804960f5acce059cd027cc" "57d7e8b7b7e0a22dc07357f0c30d18b33ffcbb7bcd9013ab2c9f70748cfa4838" "3d9df5511048d0815b1ccc2204cc739117c1a458be92fb26c03451149a1b1c11" "4ca84f9861113f889d505b66c4a9c30b81400f450b54f4c857d3eb44c5bdc601" "499c3dd62c262b0bbb3ea0f5c83e92db5eac4a2a58468b51900e0ca706a7ad12" "011d4421eedbf1a871d1a1b3a4d61f4d0a2be516d4c94e111dfbdc121da0b043" "10551f0a24d0ac97a109f02178e9e34b448ee12a52357911cf3362a6b249cae6" "e624f013e266f41148aa2e445a4b8681b0afb346a9126993e345309c9a829535" default))
 '(package-selected-packages
   '(doom-modeline mood-line kanagawa-theme kanagawa-themes snow-1-theme golden-theme Adventure-time-theme filetree billy-omer4-theme billy-omer3-theme billy-omer2-theme billy-omer-theme purple-pink3-theme purple-pink2-theme purple-pink-theme red-blue-theme treemacs undo-tree doom-themes highlight-indent-guides gruvbox-theme anaconda-mode blacken flycheck marginalia vertico corfu)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
