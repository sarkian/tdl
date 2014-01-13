" Vim syntax file
" Language: tdl
" Maintainer: Sarkian <root@dustus.org>
" Last Change: 2013 Nov 24, 16:33

if version < 600
    syntax clear
elseif exists("b:current_syntax")
    "finish 
endif

syn sync fromstart


" Over
syn match tdlOvertext "\%>79v.\+"

" Headers
syn match tdlH1Wrapper "^.\+\(\r\|\n\|\r\n\|\n\r\)=\+$" contains=tdlH1,tdlOvertext
syn match tdlH2Wrapper "^.\+\(\r\|\n\|\r\n\|\n\r\)-\+$" contains=tdlH2,tdlOvertext
syn match tdlH1 "^[^=].*\(\r\|\n\|\r\n\|\n\r\)" contained contains=tdlOvertext
syn match tdlH2 "^[^-].*\(\r\|\n\|\r\n\|\n\r\)" contained contains=tdlOvertext

" Link
syn match tdlUrl "\(http\|https\|ftp\)://[^ ]\+" contains=tdlOvertext
syn match tdlUrl "\(http\|https\|ftp\)://[^ ]\+" contained contains=tdlOvertext

" Bug
syn match tdlBug
    \ '^BUG:\(.\+\(\[FIXED\]\)\@<!\(\r\|\n\|\r\n\|\n\r\)\s*\)\+\s*\(\r\|\n\|\r\n\|\n\r\)\s*'
    \ contains=tdlBugSign,tdlUrl,tdlOvertext
syn match tdlBugFixed 
    \ '^BUG:\(.\+\(\r\|\n\|\r\n\|\n\r\)\)*.\+\[FIXED\]\s*\(\r\|\n\|\r\n\|\n\r\)\s*\(\r\|\n\|\r\n\|\n\r\)\s*'
    \ contains=tdlBugFixedSign,tdlBugFixedMarkWrapper,tdlUrl,tdlOvertext
syn match tdlBugSign    "^BUG:" contained contains=tdlBugSignUnder
syn match tdlBugSignUnder "^BUG" contained
syn match tdlBugFixedSign "^BUG:" contained contains=tdlBugFixedSignUnder
syn match tdlBugFixedSignUnder "^BUG" contained
syn match tdlBugFixedMarkWrapper " \[FIXED\][ \t]*\(\r\|\n\|\r\n\|\n\r\)[ \t]*\(\r\|\n\|\r\n\|\n\r\)"
    \ contained contains=tdlBugFixedMark
syn match tdlBugFixedMark "\[FIXED\]" contained

" Todo
syn match tdlTodo 
    \ "^TODO:\(.\+\(\[DONE\]\)\@<!\(\r\|\n\|\r\n\|\n\r\)[ \t]*\)\+[ \t]*\(\r\|\n\|\r\n\|\n\r\)[ \t]*"
    \ contains=tdlTodoSign,tdlUrl,tdlOvertext
syn match tdlTodoDone
    \ "^TODO:\(.\+\(\r\|\n\|\r\n\|\n\r\)\)*.\+\[DONE\][ \t]*\(\r\|\n\|\r\n\|\n\r\)[ \t]*\(\r\|\n\|\r\n\|\n\r\)"
    \ contains=tdlTodoDoneSign,tdlTodoDoneMarkWrapper,tdlUrl,tdlOvertext
syn match tdlTodoSign   "^TODO:" contained contains=tdlTodoSignUnder
syn match tdlTodoSignUnder "^TODO" contained
syn match tdlTodoDoneSign "^TODO:" contained contains=tdlTodoDoneSignUnder
syn match tdlTodoDoneSignUnder "^TODO" contained
syn match tdlTodoDoneMarkWrapper " \[DONE\][ \t]*\(\r\|\n\|\r\n\|\n\r\)[ \t]*\(\r\|\n\|\r\n\|\n\r\)"
    \ contained contains=tdlTodoDoneMark
syn match tdlTodoDoneMark "\[DONE\]" contained

" Comment
syn region tdlComment start="#" end="$" contains=tdlOvertext




hi tdlH1                    gui=bold
hi tdlH2                    gui=italic
hi tdlUrl                   guifg=#aaaaff gui=underline

hi tdlTask                  guifg=#999999

hi tdlBug                   guifg=#ff6464
hi tdlBugFixed              guifg=#44aa44
hi tdlBugSign               guifg=#ff6464   gui=bold
hi tdlBugSignUnder          guifg=#ff6464   gui=bold,underline
hi tdlBugFixedSign          guifg=#88dd88   gui=bold
hi tdlBugFixedSignUnder     guifg=#88dd88   gui=bold,underline
hi tdlBugFixedMark          guifg=#88dd88

hi tdlTodo                  guifg=#e5e35e
hi tdlTodoDone              guifg=#44aa44
hi tdlTodoSign              guifg=#e5e35e   gui=bold
hi tdlTodoSignUnder         guifg=#e5e35e   gui=bold,underline
hi tdlTodoDoneSign          guifg=#88dd88   gui=bold
hi tdlTodoDoneSignUnder     guifg=#88dd88   gui=bold,underline
hi tdlTodoDoneMark          guifg=#88dd88

hi tdlComment               guifg=#75715E

hi tdlOvertext              guifg=#ffffff   guibg=#ff0000   gui=bold

" f5fe69 - todo

let b:current_syntax = 'tdl'

" vim:foldmethod=marker
