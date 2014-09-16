(add-to-list 'load-path "~/.emacs.d/")
;; open
;;M-x universal-coding-system-argument
;; save
;;M-x set-buffer-file-coding-system
;; view
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(setq-default tab-width 2)
;; C-x = what-cursor-position
(setq default-input-method "MacOSX")
(set-language-environment "Japanese")
(setq default-buffer-file-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(set-buffer-file-coding-system 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)
;; (set-clipboard-coding-system 'sjis-dos)

;; refrain auto split window
(setq split-height-threshold nil)

;;M-x describe-coding-system (mule-ucs)
;;(add-to-list 'load-path "~/.emacs.d/mule-ucs/lisp")
;;(require 'un-define)

;; font testing ... ($ xlsfonts)
;; (create-fontset-from-fontset-spec
;; 	"-*-fixed-medium-r-normal--14-*-*-*-*-*-fontset-14,
;; 	ascii:-b&h-lucida-bold-r-normal-sans-14-140-75-75-p-92-iso8859-1,
;; 	japanese-jisx0208:-b&h-lucida-bold-r-normal-sans-14-140-75-75-p-92-iso8859-1,
;; 	katakana-jisx0201:-b&h-lucida-bold-r-normal-sans-14-140-75-75-p-92-iso8859-1")
;(cond (window-system
;; (set-default-font "VL Gothic-8")
;; (set-fontset-font (frame-parameter nil 'font)
;;     'japanese-jisx0208
;;     '("VL Gothic" . "unicode-bmp"))
;; ))

(setq backup-by-copying t)
(defadvice make-backup-file-name
(around modify-file-name activate)
(let ((backup-dir "~/.emacs.b"))
(setq backup-dir (expand-file-name backup-dir))
(unless (file-exists-p backup-dir)(make-directory-internal backup-dir))
(if (file-directory-p backup-dir)(let* ((file-path (expand-file-name file))
(chars-alist '((?/ . (?#))(?# . (?# ?#))(?: . (?\;))(?\; . (?\; ?\;))))
(mapchars(lambda (c) (or (cdr (assq c chars-alist)) (list c)))))
(setq ad-return-value(concat backup-dir "/"(mapconcat 'char-to-string
(apply 'append (mapcar mapchars file-path)) "")))) ad-do-it)))

(global-font-lock-mode t)
(font-lock-mode t)
;;(setq transient-mark-mode t)
(transient-mark-mode t)

(global-set-key "\C-cc" 'compile)
;;(global-set-key "\C-cg" 'grep)
(global-set-key "\C-cj" 'goto-line)
(global-set-key "\C-ch" 'query-replace)
;; (global-set-key "\C-c\C-v" 'cvs-update)
;; (global-set-key "\C-c\C-v" 'svn-status)
(global-set-key "\C-c\C-v" 'git-status)
;; (global-set-key "\C-c\C-v" 'magit-status)
(global-set-key "\C-c\C-c" 'comment-region)
(global-set-key "\C-cm" 'man)
;; (global-set-key [\C-tab] 'dabbrev-expand)

(global-set-key (kbd "<backtab>") 'indent-region)
(global-set-key (kbd "C-c TAB") 'align-entire)
(global-set-key (kbd "C-x <backtab>") 'untabify)
(global-set-key (kbd "C-x TAB") 'tabify)

(global-set-key (kbd "<f12>") 'next-error)
(global-set-key (kbd "ESC <f12>") 'previous-error)

(global-set-key [\C-f12] 'next-error)
(global-set-key [\M-f12] 'previous-error)

(global-set-key (kbd "C-c C-j") 'point-to-register)
(global-set-key (kbd "C-x j") 'jump-to-register)

(global-set-key (kbd "C-c w") 'copy-to-register)
(global-set-key (kbd "C-c y") 'insert-register)

(global-set-key (kbd "C-x M-=") 'count-lines-region)
;;(global-set-key (kbd "C-x =") 'what-cursor-position)

;; (load "escreen")
;; (escreen-install)

;; (global-set-key [\M-right] 'escreen-goto-next-screen)
;; (global-set-key [\M-left] 'escreen-goto-prev-screen)
;; (global-set-key [\M-up] 'escreen-create-screen)
;; (global-set-key [\M-down] 'escreen-goto-screen-0)

;; revive.el
(autoload 'save-current-configuration "revive" "Save status" t)
(autoload 'resume "revive" "Resume Emacs" t)
(autoload 'wipe "revive" "Wipe emacs" t)

;; windows.el
;;   M-x win-resume-menu
;; windows.el
;;   M-x win-resume-menu
(require 'windows)
(win:startup-with-window)
(setq win:use-frame nil)
(define-key ctl-x-map "C" 'see-you-again)
(add-hook 'kill-emacs-hook 'win-save-all-configurations)

(global-set-key (kbd "ESC <right>")  'win-next-window)
(global-set-key (kbd "ESC <left>") 'win-prev-window)
(global-set-key (kbd "ESC <up>") 'win-switch-menu)
(global-set-key (kbd "ESC <down>") 'win-toggle-window)

(global-set-key [\M-right] 'win-next-window)
(global-set-key [\M-left] 'win-prev-window)
(global-set-key [\M-up] 'win-switch-menu)
(global-set-key [\M-down] 'win-toggle-window)

(global-set-key [right] 'win-next-window)
(global-set-key [left] 'win-prev-window)
(global-set-key [up] 'win-switch-menu)
(global-set-key [down] 'win-toggle-window)

(require 'shell-command)
(shell-command-completion-mode)

(require 'session)
(add-hook 'after-init-hook 'session-initialize)

(require 'browse-kill-ring)
(setq kill-ring-max 1000)
(global-set-key (kbd "C-c k") 'browse-kill-ring)

;; (defconst *dmacro-key* [?\M-o] "繰返し指定キー")
(defconst *dmacro-key* "\C-\\" "繰返し指定キー")
(global-set-key *dmacro-key* 'dmacro-exec)
(autoload 'dmacro-exec "dmacro" nil t)

(cond (
       (string-match "^24\." emacs-version)
       ;; nxml : need compile(elc)
       ;; (load "~/.emacs.d/nxml-mode-20041004/rng-auto.el")
       ;; (setq auto-mode-alist
       ;;       (cons '("\\.\\(xml\\|xsl\\|rng\\|xhtml\\)\\'" . nxml-mode)
       ;; 	    auto-mode-alist))
       ;; (unify-8859-on-decoding-mode)
       ;; anything
       (require 'anything-config)
       (setq anything-sources (list anything-c-source-buffers
				    anything-c-source-bookmarks
				    anything-c-source-recentf
				    anything-c-source-file-name-history
				    anything-c-source-locate))
       (define-key anything-map (kbd "C-p") 'anything-previous-line)
       (define-key anything-map (kbd "C-n") 'anything-next-line)
       (define-key anything-map (kbd "C-v") 'anything-next-source)
       (define-key anything-map (kbd "M-v") 'anything-previous-source)
       (global-set-key (kbd "C-;") 'anything)
       (global-set-key (kbd "C-c ;") 'anything)
       )
)

;; tramp
;;(require 'tramp)
;;(add-to-list 'Info-default-directory-list " ~/sfw/share/info/")

;; C
(add-hook 'c-mode-common-hook
	  '(lambda ()
	     (progn
	       (c-toggle-hungry-state 1)
	       (c-set-style "k&r")
	       (setq c-basic-offset 2 indent-tabs-mode nil)
	       (setq c-default-style "k&r")
	      ;(setq c-basic-offset 2 indent-tabs-mode t)
	       )
	     (require 'gtags)
	     )
	  )

;; C++
(add-hook 'c++-mode-common-hook
	  '(lambda ()
	     (progn
	       (c-toggle-hungry-state 1)
	       (c-set-style "k&r")
	       (setq c-basic-offset 2 indent-tabs-mode nil)
	       (setq c-default-style "k&r")
	      ;(setq c-basic-offset 2 indent-tabs-mode t)
	       )
	     (require 'gtags)
	     )
	  )

(setq auto-mode-alist
      (append '(("\\.h$" . c++-mode))
              auto-mode-alist))

;; gtags
(add-hook 'gtags-mode-hook
	  '(lambda ()
	     (local-set-key (kbd "C-.")   'gtags-find-tag)
	     (local-set-key (kbd "C-c .") 'gtags-find-tag)
	     (local-set-key (kbd "C-,")   'gtags-find-rtag)
	     (local-set-key (kbd "C-c ,") 'gtags-find-rtag)
	     (local-set-key (kbd "C->")   'gtags-find-symbol)
	     (local-set-key (kbd "C-c >") 'gtags-find-symbol)
	     (local-set-key (kbd "C-<")   'gtags-pop-stack)
	     (local-set-key (kbd "C-c <") 'gtags-pop-stack)
	     )
	  )

;; ruby
(add-to-list 'load-path "~/.emacs.d/ruby")
(require 'ruby-mode)
(defun ruby-mode-set-encoding () ())
(defun ruby-paren-match (arg)
  "RUBY ."
  (interactive "p")
  (let ((cw (thing-at-point 'word)))
    (cond ((looking-at "[[({]")
	   (forward-sexp 1)
	   (backward-char)
	   )
	  ((looking-at "[])}]")
	   (forward-char)
	   (backward-sexp 1)
	   )
	  ((string-match "^\\(end\\|rescue\\|when\\)$" cw)
	   (ruby-beginning-of-block)
	   )
	  ((string-match "^\\(if\\|class\\|module\\|def\\|begin\\|do\\|case\\)$" cw)
	   (ruby-end-of-block)
	   )
	  (t (self-insert-command arg))
	  )
    )
)

(add-to-list 'load-path "~/.emacs.d/ruby-end")
(require 'ruby-end)
(add-hook 'ruby-mode-hook
          '(lambda ()
						 (setq c-basic-offset 2 indent-tabs-mode nil)
						 (setq ruby-deep-indent-paren-style nil)
						 (abbrev-mode 1)
						 (electric-pair-mode t)
						 (electric-indent-mode t)
						 (electric-layout-mode t)
						 (define-key ruby-mode-map "{" nil)
						 (define-key ruby-mode-map "}" nil)
             (local-set-key "\C-]" 'ruby-paren-match)
             ))
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(defadvice ruby-indent-line (after unindent-closing-paren activate)
  (let ((column (current-column))
        indent offset)
    (save-excursion
      (back-to-indentation)
      (let ((state (syntax-ppss)))
        (setq offset (- column (current-column)))
        (when (and (eq (char-after) ?\))
                   (not (zerop (car state))))
          (goto-char (cadr state))
          (setq indent (current-indentation)))))
    (when indent
      (indent-line-to indent)
      (when (> offset 0) (forward-char offset)))))

(require 'coffee-mode)
(defun coffee-custom ()
  "coffee-mode-hook"
  (and (set (make-local-variable 'tab-width) 2)
       (set (make-local-variable 'coffee-tab-width) 2))
  )

(add-hook 'coffee-mode-hook
  '(lambda() (coffee-custom)))

(add-to-list 'load-path "~/.emacs.d/rspec-mode")
(require 'rspec-mode)
(custom-set-variables '(rspec-use-rake-flag nil))
;; C-c , a : Run all spec
;; C-c , v : Run current file's spec
;; C-c , s : Run current line's spec in the file
;; C-c , t : Toggle back and forth between a spec and it's target


(add-to-list 'load-path "~/.emacs.d/haml-mode")
(require 'haml-mode)
(add-to-list 'auto-mode-alist '("\\.haml$" . haml-mode))

(autoload 'scss-mode "scss-mode")
(setq scss-compile-at-save nil) ;; 自動コンパイルをオフにする
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
(add-hook 'scss-mode-hook
          '(lambda ()
						 (setq c-basic-offset 2 indent-tabs-mode nil)
						 (setq css-indent-offset 2)
             ))

;; python
;; (add-hook 'python-mode-common-hook
;; 	  '(lambda ()
;; 	     (progn
;; 	       (local-set-key (kbd "C-c C-c") 'comment-region)
;; 	     ))
;; 	  )


;; ;; js
;; (add-to-list 'load-path "~/.emacs.d/js2")
;; (autoload 'js2-mode "js2" nil t)
;; (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
;; javascript.el
;; javascript-mode
(add-to-list 'auto-mode-alist (cons  "\\.\\(js\\|as\\|json\\|jsn\\)\\'" 'javascript-mode))
(autoload 'javascript-mode "javascript" nil t)
(setq js-indent-level 2)

;; paren match
(defun paren-match (arg)
  "Go to the matching parenthesis."
  (interactive "p")
  (cond ((looking-at "[[({]")
         (forward-sexp 1)
         (backward-char)
         )
        ((looking-at "[])}]")
         (forward-char)
         (backward-sexp 1)
         )
        (t (self-insert-command arg))
        ))
(global-set-key "\C-]" 'paren-match)
;; invert repository files from grep result
(defun invert-repo-files ()
  "invert .svn/ .git/ files."
  (interactive)
  (replace-regexp "^.*\.svn/.*\n"  "")
  (beginning-of-buffer)
  (replace-regexp "^.*\.git/.*\n"  "")
)
(global-set-key "\C-cv" 'invert-repo-files)
;; truncate line
(defun toggle-truncate-lines ()
  "toggle truncate lines"
  (interactive)
  (if truncate-lines
      (setq truncate-lines nil)
    (setq truncate-lines t))
  (recenter))
(global-set-key "\C-cl" 'toggle-truncate-lines)
;; case-fold
(defun toggle-case-fold-search ()
  "toggle case-fold-search"
  (interactive)
  (if case-fold-search
      (setq case-fold-search nil)
    (setq case-fold-search t))
  (recenter))
(global-set-key "\C-cs" 'toggle-case-fold-search)

(defun grepr()
  "Run grepr"
  (interactive)
  (grep (read-string (format "[%s]$ " (replace-regexp-in-string "^[^ ]+ " "" (pwd))) "grep -n -I -s -r . -e ") )
)
(global-set-key (kbd "C-c g") 'grepr)
(defun grepf()
  "Run grepf"
  (interactive)
  (grep (read-string (format "[%s]$ " (replace-regexp-in-string "^[^ ]+ " "" (pwd))) (format "grep -n -I -s %s -e " (buffer-file-name) )))
)
(global-set-key (kbd "C-x g") 'grepf)



;; table ( use picture-mode for easy )
;;  defun : table-insert
;;(require 'table)
;; keisen
(if window-system
  (autoload 'keisen-mode "keisen-mouse" "MULE版罫線モード＋マウス" t)
	(autoload 'keisen-mode "keisen-mule" "MULE版罫線モード" t))

;; cedet
;;(load-file "~/.emacs.d/cedet-1.0/common/cedet.el")
;; speedber
(global-set-key [f4] 'speedbar-get-focus)
;; ede
;;(require 'ede)
;;(global-ede-mode t)
;; svnx
(require 'psvn)
;; git
;; (add-to-list 'load-path "~/.emacs.d/git-emacs")
;; (require 'git-emacs)
;; (require 'git-emacs-autoloads)
;; (require 'git-status)
(add-to-list 'load-path "~/.emacs.d/git")
(require 'git)
(require 'git-blame)

;; haskell
(add-to-list 'load-path "~/.emacs.d/haskell")
(setq auto-mode-alist
      (append auto-mode-alist
              '(("\\.[hg]s$"  . haskell-mode)
                ("\\.hi$"     . haskell-mode)
                ("\\.l[hg]s$" . literate-haskell-mode))))
(autoload 'haskell-mode "haskell-mode"
   "Major mode for editing Haskell scripts." t)
(autoload 'literate-haskell-mode "haskell-mode"
   "Major mode for editing literate Haskell scripts." t)
(add-hook 'haskell-mode-hook 'turn-on-haskell-decl-scan)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(add-hook 'haskell-mode-hook 'turn-on-haskell-ghci)

(setq haskell-literate-default 'latex)
(setq haskell-doc-idle-delay 0)
(add-hook 'haskell-mode-hook
	  '(lambda ()
	     (local-set-key "\C-cq" 'haskell-hoogle)
     )
	  )

(autoload 'apache-mode "apache-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.htaccess\\'"   . apache-mode))
(add-to-list 'auto-mode-alist '("httpd\\.conf\\'"  . apache-mode))
(add-to-list 'auto-mode-alist '("srm\\.conf\\'"    . apache-mode))
(add-to-list 'auto-mode-alist '("access\\.conf\\'" . apache-mode))
(add-to-list 'auto-mode-alist '("sites-\\(available\\|enabled\\)/" . apache-mode))

;; autoinsert
(setq user-fll-name "Hiroaki Kubota")
(setq user-mail-address "hiroaki.kubota@mail.rakuten.com")
(add-hook 'before-save-hook 'time-stamp)

(setq  auto-insert-directory "~/.emacs.d/ai-template/" )
(load "autoinsert" t)
(setq auto-insert-alist
      (append '(("\\.sh$"  . ["template.sh"   ai-replace])
                ("pom\\.xml$"  . ["template.pom.xml"   ai-replace])
                ("\\.xml$" . ["template.xml"  ai-replace])
                ("\\.html$". ["template.html" ai-replace])
		("\\.cgi$" . ["template.cgi"  ai-replace])
                ("\\.pl$"  . ["template.pl"   ai-replace])
                ("\\.py$"  . ["template.py"   ai-replace])
                ("\\.rb$"  . ["template.rb"   ai-replace])
                ("\\.hs$"  . ["template.hs"   ai-replace])
                ("\\.h$"   . ["template.h"    ai-replace])
                ("\\.hpp$" . ["template.h"    ai-replace])
                ("\\.cc$"  . ["template.cc"   ai-replace])
                ("\\.cpp$" . ["template.cc"   ai-replace])
                ("\\.c$"   . ["template.c"    ai-replace])
                ("\\.php$" . ["template.php"   ai-replace])
                ("\\.js$"  . ["template.js"   ai-replace])
                ("_controller\\.php$" . ["cake_controller.php"   ai-replace])
                ("[Mm]akefile" . ["Makefile" ai-replace]))
	      auto-insert-alist ))
(add-hook 'find-file-hooks 'auto-insert)

(defvar ai-replace-alists
  '(("%file%" . (lambda()(file-name-nondirectory (buffer-file-name))))
    ("%base%" . (lambda()(replace-regexp-in-string "\\..+$" "" (file-name-nondirectory (buffer-file-name)))))
    ("%cap%" . (lambda()(capitalize (replace-regexp-in-string "\\..+$" "" (file-name-nondirectory (buffer-file-name))))))
    ("%def%" . (lambda()(upcase (replace-regexp-in-string "\\." "_" (file-name-nondirectory (buffer-file-name))))))
    ("%name%" . user-full-name)
    ("%mail%" . (lambda()(identity user-mail-address)))
    ("%cyear%" . (lambda()(substring (current-time-string) -4)))
    ("%cdate%" . (lambda()(format-time-string "%Y/%m/%d")))))

(defun ai-replace ()
  (time-stamp)
  (mapc #'(lambda(c)
	    (progn
	      (goto-char (point-min))
	      (replace-string (car c) (funcall (cdr c)) nil)))
	ai-replace-alists)
  (goto-char (point-max))
  (message "done."))



(add-to-list 'load-path "~/.emacs.d/popwin-el")
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)
;;(setq special-display-function 'popwin:special-display-popup-window)

;; text-scale
;;(global-set-key (kbd "<C-mouse-6>") 'text-scale-increase)
;;(global-set-key (kbd "<C-mouse-7>") 'text-scale-decrease)

;; (define-key global-map (kbd "C-0")
;;   '(lambda ()=
;;      (interactive)
;;      (progn (text-scale-mode 0)(buffer-face-mode 0))))
(global-set-key (kbd "<C-mouse-4>") 'text-scale-increase)
(global-set-key (kbd "<C-mouse-5>") 'text-scale-decrease)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C-=") '(lambda ()
     (interactive)
     (progn (text-scale-mode 0)(buffer-face-mode 0))))

(global-set-key (kbd "<M-mouse-4>") 'enlarge-window-horizontally)
(global-set-key (kbd "<M-mouse-5>") 'shrink-window-horizontally)
(global-set-key (kbd "M--") 'enlarge-window-horizontally)
(global-set-key (kbd "M-+") 'shrink-window-horizontally)
(global-set-key (kbd "M-=") 'balance-windows)

(require 'minimap)
(defun toggle-minimap ()
  "toggle minimap create-kill"
  (interactive)
  (if (null minimap-bufname)
      (minimap-create)
      (minimap-kill)
      ))
(global-set-key (kbd "C-x m") 'toggle-minimap)


;; magit
;; TAB: セクションの表示を切り替える
;; M-1, M-2, M-3, M-4: セクション表示の切り替え
;;Section: Untracked file
;;s: ファイルをステージに追加する(git add)
;;i: .gitignoreにファイルを追加する
;;C-u i: ignoreファイルを指定する
;;I: .git/info/excludeにファイルを追加する
;;k: ファイルを削除する*1
;;Section: Unstaged Changing / Staged Changing
;;s: ファイルをステージに追加する(git add)
;;S: 全ファイルをステージに追加する
;;u: ファイルをステージから降ろす
;;U: 全ファイルをステージから降ろす
;;k: 変更を取り消す
;;c: コミットログを書く
;;C: コミットログをチェンジログ形式で書く？
;;C-c C-c: コミットする(git commit)
;;C-c C-a: コミットをやり直す(git commit --amend)
;;Log
;;l: ログ一覧を表示する(git log)
;;L: 詳細ログの一覧を表示する(git log --stat)
;;ログを選択して RET: ログの詳細を表示する(git log -p)
;;a: コミットを今のブランチに適用する(git cherry-pick & NOT commit)
;;A: コミットを今のブランチに適用し、コミットする(git cheery-pick & git commit)
;;v: コミットを取り消す(git revert)
;;C-w: コミットのsha1ハッシュをコピーする
;;=: 今のコミットとの差分を表示する
;;.: コミットをマークする
;;h or H: 今のHEADまでのログを表示する
;;d: ワーキングコピーからあるコミットまでの差分を表示する(git diff)
;;D: 2つのコミットの差分を表示する
;;t or T: タグを作成する(git tag)
;;x: コミットを取り消す(git reset --soft)
;;X: コミットと変更を取り消す(git reset --hard)
;;Stash
;;z: stashを作成する(git stash)
;;a: stashを適用する(git stash apply)
;;A: stashをpopする(git stash pop)
;;k: stashをdropする(git stash drop)
;;b: ブランチを切り替える(git checkout)
;;B: 新規ブランチを作成して切り替える(git checkout -b)
;;w: wazzup?
;;m or M: マージを行う
;;X: 手動マージを中止する
;;e: resolved conflict?
;;R: rebase
;;P: push (default remote, current branch)
;;f: git remote update
;;F: pull
