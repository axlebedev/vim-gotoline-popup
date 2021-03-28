if exists('g:loaded_gotoline') && g:loaded_gotoline
    finish
endif

let g:gotoline_prompt = "Go to line: "
let g:gotoline_jump_on_input = 1
let g:gotoline_reset_on_cancel = 1

noremap <silent><expr><plug>(gotoline-popup) gotoline#GoToLine()

let g:loaded_gotoline = 1
