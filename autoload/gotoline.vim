let s:isPopupVisible = 0
let s:lineNr = ''
function! GetPopupText() abort
    return 'Go to line: '.s:lineNr
endfunction

function! HandleEnterNumber(winid, key) abort
    echom 'HandleEnterNumber('.a:winid.', '.a:key.')'
    if a:key == "\<CR>"
        call popup_close(a:winid, s:lineNr)
        return 1
    endif
    if a:key == "\<BS>"
        let s:lineNr = s:lineNr[0:-2]
        call popup_settext(a:winid, GetPopupText())
        return 1
    endif
    if a:key =~ '\d'
        let s:lineNr .= a:key
        call popup_settext(a:winid, GetPopupText())
        return 1
    endif
    call popup_close(a:winid, -1)
    return 0
endfunction

function! GoToLineHandler(id, result) abort
    let s:isPopupVisible = 0
    if (a:result > -1)
        execute s:lineNr
    endif
    let s:lineNr = ''
endfunction

function! gotoline#GoToLine() abort
    if (!s:isPopupVisible)
        let s:isPopupVisible = 1
        call popup_dialog(GetPopupText(), #{
            \ filter: 'HandleEnterNumber',
            \ callback: 'GoToLineHandler',
            \ borderchars: ['─', '│', '─', '│', '╭', '╮', '╯', '╰'],
            \ })
    endif
endfunction
