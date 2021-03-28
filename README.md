'Go to line' popup

### Installation
```
Plug 'axlebedev/vim-gotoline-popup'
nmap <C-g> <plug>(gotoline-popup)
```

### Usage
Press `<C-g>`, enter line number, press enter.  
You will be moved to needed line  

## Params
Change input prompt  
`let g:gotoline_prompt = "Go to line: "`

Go to inputed line immediately
`let g:gotoline_jump_on_input = 1`
