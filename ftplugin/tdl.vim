" Vim filetype plugin
" Language: tdl
" Maintainer: Sarkian <root@dustus.org>
" Last Change: 2014 Jan 13, 19:34

if exists("b:did_ftplugin")
    finish
endif

if !exists('g:tdl_map_toggle')
    let g:tdl_map_toggle = '<Leader>g'
endif

setlocal tw=0

fu! s:toggle()
    let x = col('.')
    let y = line('.')
    if x == 1
        call cursor(y, 2)
    endif
    if x >= strlen(getline(y)) - 1
        call cursor(y, x - 1)
    endif
    let startl_todo_done = searchpair('^TODO:', '', '\[DONE\] *$', 'nb')
    let endl_todo_done = searchpair('^TODO:', '', '\[DONE\] *$', 'n')
    let startl_todo = searchpair('^TODO:', '', '\(\r\|\n\|\r\n\|\n\r\)[ \t]*\(\r\|\n\|\r\n\|\n\r\)', 'nb')
    let endl_todo = searchpair('^TODO:', '', '\(\r\|\n\|\r\n\|\n\r\)[ \t]*\(\r\|\n\|\r\n\|\n\r\)', 'n')
    let startl_bug_fixed = searchpair('^BUG:', '', '\[FIXED\] *$', 'nb')
    let endl_bug_fixed = searchpair('^BUG:', '', '\[FIXED\] *$', 'n')
    let startl_bug = searchpair('^BUG:', '', '\(\r\|\n\|\r\n\|\n\r\)[ \t]*\(\r\|\n\|\r\n\|\n\r\)', 'nb')
    let endl_bug = searchpair('^BUG:', '', '\(\r\|\n\|\r\n\|\n\r\)[ \t]*\(\r\|\n\|\r\n\|\n\r\)', 'n')
    if endl_todo_done > 0 && startl_todo_done > 0
        exe endl_todo_done.','.endl_todo_done.'s/\s*\[DONE\]\s*$//'
    elseif endl_todo > 0 && startl_todo > 0
        exe endl_todo.','.endl_todo.'s/\s*$//'
        let line = getline(endl_todo)
        let line = line . repeat(' ', 80 - strwidth(line)) . '[DONE]'
        call setline(endl_todo, line)
    elseif endl_bug_fixed > 0 && startl_bug_fixed > 0
        exe endl_bug_fixed.','.endl_bug_fixed.'s/\s*\[FIXED\]\s*$//'
    elseif endl_bug > 0 && startl_bug > 0
        exe endl_bug.','endl_bug.'s/\s*$//'
        let line = getline(endl_bug)
        let line = line . repeat(' ', 80 - strwidth(line)) . '[FIXED]'
        call setline(endl_bug, line)
    endif
    call cursor(y, x)
endfu

exe 'nmap <buffer> <silent> '.g:tdl_map_toggle.' :call <SID>toggle()<Cr>'

