if exists("b:current_syntax")
  finish
endif

syn keyword     afegrpKeyword   GROUP_NUMBER STATUS OWNER AFE MASTER_AFE DESCRIPTION JUSTIFICATION BUDGETED BUDGET_AMOUNT
syn match       afegrpBegin      "BEGIN"                     
syn match       afegrpEnd      "END[,]*"                     
syn match       afegrpComment       "^#COMMENT.*"                     
syn match       afegrpParameter       ",.*"                     
"syn region       afegrpParameter start=+,+ skip=++ end=++ oneline

hi link afegrpBegin       Constant
hi link afegrpEnd       Constant
hi link afegrpComment        Comment
hi link afegrpKeyword        Statement
hi link agegrpParameter     Number
let b:current_syntax = "afegrp"
