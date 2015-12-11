function! s:NextSection(backwards)
    let pattern = '\v(\n\n^\S|%^)'

    if a:backwards
        let dir = '?'
    else
        let dir = '/'
    endif

    execute 'silent normal!'.dir.pattern."\r"
endfunction

noremap <script> <buffer> <silent> ]]
        \ :call <SID>NextSection(0)<cr>

noremap <script> <buffer> <silent> [[
        \ :call <SID>NextSection(1)<cr>
