let s:isPopupVisible = 0
let s:inputString = ''
let s:initialLine = -1

function! GetPopupText() abort
    let number = str2nr(s:inputString)

    " Need it because with <expr> mapping it always calls '0' key on start
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
        if g:gotoline_jump_on_input && s:inputString
            execute s:inputString
        endif
        return 1
    endif

    if a:key =~ '\d'
        let s:inputString .= a:key
        call popup_settext(a:winid, GetPopupText())
        if g:gotoline_jump_on_input && s:inputString
            execute s:inputString
        endif
        return 1
    endif

    call popup_close(a:winid, -1)
    return 0
endfunction

function! GoToLineHandler(id, result) abort
    let s:isPopupVisible = 0

    if (a:result > -1)
        execute s:inputString
    elseif g:gotoline_reset_on_cancel
        execute s:initialLine
    endif

    let s:inputString = ''
endfunction

function! gotoline#GoToLine() abort
    if (!s:isPopupVisible)
        let s:isPopupVisible = 1
        let s:initialLine = line('.')
        call popup_dialog(GetPopupText(), #{
            \ filter: 'HandleEnterNumber',
            \ callback: 'GoToLineHandler',
            \ borderchars: ['─', '│', '─', '│', '╭', '╮', '╯', '╰'],
            \ minwidth: len(g:gotoline_prompt) + 4
            \ })
    endif
endfunction
