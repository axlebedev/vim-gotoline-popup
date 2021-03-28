if exists('g:loaded_gotoline') && g:loaded_gotoline
    finish
endif

noremap <silent><expr><plug>(gotoline-popup) gotoline#GoToLine()

let g:loaded_gotoline = 1
