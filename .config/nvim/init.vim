syntax on
set rnu
set nu
set tabstop=2
nnoremap - :noh<CR>
call plug#begin()
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.4' }
call plug#end()

let mapleader = " "

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

nnoremap <leader>RR :source ~/.config/nvim/init.vim<CR>

set nowrap

" statusline colors
au ModeChanged *:[vV\x16]* hi statusline guibg=DarkGrey ctermfg=13 guifg=White ctermbg=2
au ModeChanged *:[nN\x16]* hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15
au ModeChanged *:[iI\x16]* hi statusline guibg=Cyan ctermfg=2 guifg=White ctermbg=2
au ModeChanged *:[rR\x16]* hi statusline guibg=Purple ctermfg=3  guifg=White ctermbg=2
au ModeChanged *:[cC\x16]* hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15
" default the statusline to green when entering Vim
hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15

" Formats the statusline
set statusline=%f                           " file name
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%y      "filetype
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag

set statusline+=\ %=                        " align left
set statusline+=Line:%l/%L[%p%%]            " line X of Y [percent of file]
set statusline+=\ Col:%c                    " current column
set statusline+=\ Buf:%n                    " Buffer number
set statusline+=\ [%b][0x%B]\               " ASCII and byte code under cursor

au! BufRead,BufNewFile *dev* setfiletype stdio
