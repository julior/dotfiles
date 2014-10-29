(defun eval-clojure (start end)
  (interactive (list (point) (mark)))
  ;; start clojure if it hasn't started yet
  (setq cur-buffer (current-buffer))
  (unless (get-process "clojure-repl")
    (let ((process-connection-type t))  ; use a pipe
      (start-process "clojure-repl" "*clojure*" "lein" "repl"))
    (set-buffer "*clojure*")
    (shell-mode)
    (set-buffer cur-buffer)
    )
  ;; execute
  (process-send-region "clojure-repl" start end)
  (process-send-string "clojure-repl" "\n")
  ;;display buffer
  (display-buffer
   (get-buffer "*clojure*")
   '((display-buffer-reuse-window
      display-buffer-below-selected
      display-buffer-use-some-window
      display-buffer-pop-up-window
      display-buffer-pop-up-frame)
     (reusable-frames . 0)
     (window-height . 12) (window-width . nil)
     )
   )
  ;;focus in buffer
  (set-buffer "*clojure*")
  (set-window-point (get-buffer-window "*clojure*") (point-max))
  )


