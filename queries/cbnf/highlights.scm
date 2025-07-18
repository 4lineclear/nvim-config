(char_literal) @character
(string_literal) @string
(raw_string_literal) @string

(boolean_literal) @boolean
(integer_literal) @number
(float_literal) @number.float

(escape_sequence) @string.escape

(identifier) @variable

(syntax_rule
  name: (identifier) @property)

(line_comment) @comment
(block_comment) @comment

(line_comment (doc_comment)) @comment.documentation
(block_comment (doc_comment)) @comment.documentation

"(" @punctuation.bracket
")" @punctuation.bracket
"{" @punctuation.bracket
"}" @punctuation.bracket

(or) @punctuation.delimiter
"nil" @keyword
"except" @keyword
