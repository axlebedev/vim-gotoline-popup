# 'Go to line' popup
Almost same as `100G` in normal mode, but with convenience
![gotoline-popup](gotoline.gif)

### Installation
```
Plug 'axlebedev/vim-gotoline-popup'
nmap <C-g> <plug>(gotoline-popup)
```

### Usage
Press `<C-g>` to open popup.  
Enter line number, press `Enter` to jump to line  
Press `Esc` or any not number to cancel and close popup.

### Options
Map key:  
`nmap <C-g> <plug>(gotoline-popup)`

Change input prompt:  
`let g:gotoline_prompt = "Go to line: "`

Go to inputed line immediately. If `0`, cursor will not be moved until `Enter` pressed:  
`let g:gotoline_jump_on_input = 1`

Return to initial line if popup was cancelled. If `0` and `g:gotoline_jump_on_input = 1`, cursor will stay at last position:  
`let g:gotoline_reset_on_cancel = 1`

### License
MIT
