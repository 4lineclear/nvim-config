;; Embed sql into rust - requires usage of dummy macro
; ((macro_invocation
;    (identifier) @name (#eq? @name "sql")
;    [(token_tree 
;      (raw_string_literal 
;        (string_content) @injection.content))
;    (token_tree 
;      (string_literal 
;        (string_content) @injection.content))
;    ])
;  (#set! injection.language "sql")
; )

;; Embed sql into rust - requires usage of dummy fn
(call_expression 
  (identifier) @name (#eq? @name "sql")
  (arguments 
    [(raw_string_literal 
      (string_content) @injection.content)
    (string_literal 
      (string_content) @injection.content)])
  (#set! injection.language "sql"))

(macro_invocation 
  (identifier) @name (#eq? @name "sql")
  (token_tree 
    [(raw_string_literal 
      (string_content) @injection.content)
    (string_literal 
      (string_content) @injection.content)])
  (#set! injection.language "sql"))

(macro_invocation 
  (identifier) @name (#eq? @name "sql")
  (token_tree 
    [(raw_string_literal 
      (string_content) @injection.content)
    (string_literal 
      (string_content) @injection.content)])
  (#set! injection.language "sql"))

([(line_comment) (block_comment)] @_comment
  [(raw_string_literal 
     (string_content) @injection.content)
   (string_literal 
     (string_content) @injection.content)]
    (#match? @_comment "(sql|SQL|sqlite|SQLITE)")
    (#set! injection.language "sql"))

([(raw_string_literal 
    (string_content) @injection.content)
  (string_literal 
    (string_content) @injection.content)]
  [(line_comment) (block_comment)] @_comment
    (#match? @_comment "(sql|SQL|sqlite|SQLITE)")
    (#set! injection.language "sql"))

((const_item
  [(raw_string_literal 
    (string_content) @injection.content)
  (string_literal 
    (string_content) @injection.content)])
  .
  [(line_comment) (block_comment)] @_comment
    (#match? @_comment "(sql|SQL|sqlite|SQLITE)")
    (#set! injection.language "sql"))


; ((let_declaration)
;   (line_comment) @_comment
;   (#match? @_comment "sql")
;     (string_literal 
;       (string_content)
;       (#set! injection.language "sql"))
; )

; (line_comment) @_comment
;   (#match? @_comment "sql")
; (string_literal 
;   (string_content)
;   (#set! injection.language "sql"))
 


; Embed sql within topoma
; ((macro_invocation
;    (identifier) @name (#eq? @name "topoma")
;    (token_tree 
;      [(raw_string_literal
; 	(string_content) @injection.content)
;       (token_tree
; 	(raw_string_literal
; 	  (string_content) @injection.content))]))
;  (#set! injection.language "sql")
; )
