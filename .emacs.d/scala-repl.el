(defun eval-scala (stmt)
  ;; start scala if it hasn't started yet
  (unless (get-process "scala-repl")
    (message "starting scala ...")
    (let ((process-connection-type nil))  ; use a pipe
      (start-process "scala-repl" "*scala*"  "scala"))
    )
  ;; execute
  (process-send-string "scala-repl" (concat stmt "\n"))
  ;;display buffer
  (display-buffer 
   (get-buffer "*scala*")
   '((display-buffer-reuse-window
      display-buffer-pop-up-window
      display-buffer-pop-up-frame)
     (reusable-frames . 0)
     (window-height . 8) (window-width . nil)     
   )
  )
)

(eval-scala "List(1,2,3,4).sum")
