(module
  (import "wasi_snapshot_preview1" "fd_write" (func $fd_write (param i32 i32 i32 i32) (result i32)))

  ;; Buffer for the string
  (memory (export "memory") 1)

  ;; iovec struct
  (data (i32.const 0) "\08\00\00\00") ;; this is the offset for the start of the string
  (data (i32.const 4) "\10\00\00\00") ;; length of string
  (data (i32.const 8) "Hello, World!\n\n\n")

  ;; entry point
  (func $main (export "_start")
    ;; Call fd_write
    ;; - file_descriptor: 1 (stdout)
    ;; - *iovs: 0 (pointer to iovec struct)
    ;; - iovs_len: 1 (number of iovec structs)
    ;; - nwritten: 0 (number of bytes written)
    (call $fd_write
      (i32.const 1)  ;; file_descriptor - 1 for stdout
      (i32.const 0)  ;; *iovs - pointer to iovec array
      (i32.const 1)  ;; iovs_len - number of iovec structs
      (i32.const 20) ;; nwritten - where to store number of bytes written
    )
    drop ;; result is not needed
  )
)
