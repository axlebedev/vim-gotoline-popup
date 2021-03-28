let s:isPopupVisible = 0
let s:inputString = ''

function! GetPopupText() abort
    let number = str2nr(s:inputString)
    let numberStr = number == 0 ? '' : number
    return g:gotoline_prompt.numberStr
endfunction

function! HandleEnterNumber(winid, key) abort
    if a:key == "\<CR>"
        call popup_close(a:winid, s:inputString)
        return 1
    endif

    if a:key == "\<BS>"
        let s:inputString = s:inputString[0:-2]
        call popup_settext(a:winid, GetPopupText())
        return 1
    endif

    if a:key =~ '\d'
        let s:inputString .= a:key
        call popup_settext(a:winid, GetPopupText())
        return 1
    endif

    call popup_close(a:winid, -1)
    return 0
endfunction

function! GoToLineHandler(id, result) abort
    let s:isPopupVisible = 0

    if (a:result > -1)
        execute s:inputString
    endif

    let s:inputString = ''
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
