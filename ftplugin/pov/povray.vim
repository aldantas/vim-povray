if !empty(glob("~/.vim/*/vim-do"))
    let g:execute_command = "DoQuietly"
else
    let g:execute_command = "!"
endif

if !exists("g:povray_command")
    let g:povray_command = "povray"
endif

function! PovrayCompile()
    execute g:execute_command . " "
                \ . g:povray_command . " "
                \ . expand("%")
endfunction

function! ShowImage()
    if exists("g:image_viewer")
        execute g:execute_command . " "
                    \ . g:image_viewer . " "
                    \ . expand("%:r") . ".png"
    else
        echom "Select an image viewer - let g:image_viewer"
    endif
endfunction

function! PovrayCompileAndShow()
    call PovrayCompile()
    call ShowImage()
endfunction

nnoremap <F5> :call PovrayCompileAndShow()<cr>
