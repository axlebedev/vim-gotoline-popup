let g:isPopupVisible = 0
let g:lineNr = ''
function! GetPopupText() abort
    return 'Go to line: '.g:lineNr
endfunction

function! HandleEnterNumber(winid, key) abort
    echom 'HandleEnterNumber('.a:winid.', '.a:key.')'
    if a:key == "\<CR>"
        call popup_close(a:winid, g:lineNr)
        return 1
    endif
    if a:key == "\<BS>"
        let g:lineNr = g:lineNr[0:-2]
        call popup_settext(a:winid, GetPopupText())
        return 1
    endif
    if a:key =~ '\d'
        let g:lineNr .= a:key
        call popup_settext(a:winid, GetPopupText())
        return 1
    endif
    call popup_close(a:winid, -1)
    return 1
endfunction

function! GoToLineHandler(id, result) abort
    let g:isPopupVisible = 0
    if (a:result > -1)
        execute g:lineNr
    endif
    let g:lineNr = ''
endfunction

function! GoToLine() abort
    if (!g:isPopupVisible)
        let g:isPopupVisible = 1
        call popup_dialog(GetPopupText(), #{
            \ filter: 'HandleEnterNumber',
            \ callback: 'GoToLineHandler',
            \ borderchars: ['─', '│', '─', '│', '╭', '╮', '╯', '╰'],
            \ })
    endif
endfunction

" make line where we jump at center
" nnoremap G Gzz
nnoremap <silent> <C-g> :call GoToLine()<CR>

