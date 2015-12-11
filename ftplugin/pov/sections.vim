function! s:NextSection(backwards, visual)

    if a:visual
        normal! gv
    endif

    let pattern = '\v(^\S.*\V{\v|%^)'

    if a:backwards
        let dir = '?'
    else
        let dir = '/'
    endif

    execute 'silent normal!'.dir.pattern.dir."e\r"
endfunction

noremap <script> <buffer> <silent> ]]
        \ :call <SID>NextSection(0, 0)<cr>

noremap <script> <buffer> <silent> [[
        \ :call <SID>NextSection(1, 0)<cr>

vnoremap <script> <buffer> <silent> ]]
        \ :<c-u>call <SID>NextSection(0, 1)<cr>

vnoremap <script> <buffer> <silent> [[
        \ :<c-u>call <SID>NextSection(1, 1)<cr>
