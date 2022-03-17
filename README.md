# Vim plugin: 'Go to line' popup
Almost same as normal mode `100G` or `:100<CR>`  

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
##### `g:gotoline_prompt`
Default: `"Go to line: "`  
Change input prompt  
`let g:gotoline_prompt = "Go to line: "`  

##### `g:gotoline_jump_on_input`
Default: `1`
Go to inputed line immediately on input. If `0`, cursor will not be moved until `Enter` pressed:  
`let g:gotoline_jump_on_input = 0`  

##### `g:gotoline_reset_on_cancel`
Default: `1`  
Return to initial line if popup was cancelled. If `0` and `g:gotoline_jump_on_input = 1`, cursor will stay at last position:  
`let g:gotoline_reset_on_cancel = 0`

### NOTES
If you find a bug, or have an improvement suggestion -
please place an issue in this repository.

---

Check out vim plugins:  
[**footprints**](https://github.com/axlebedev/footprints)  
[**vim-find-my-cursor**](https://github.com/axlebedev/vim-find-my-cursor)  

**<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;★</p>**
