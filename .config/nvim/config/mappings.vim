nnoremap <leader>l :<C-u>:FZF<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction

" Clipboard copy paste
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

noremap <Leader>f :Autoformat<CR>
noremap <Leader>w :q<CR><CR>
noremap <Leader>W :bw<CR>
noremap <Leader>s :w<CR>
noremap <Leader>d :bd<CR>
noremap <Leader>D :BufOnly<CR>
noremap <Leader>h :set hlsearch! hlsearch?<CR> " toggle hilight
noremap <Leader>rv :Eview<CR>
noremap <Leader>rc :Econtroller<CR>
noremap <Leader>rr :call RunCurrentSpecFile()<CR>
noremap <Leader>/  :SideSearch 
noremap <C-t> :tabe <CR>
noremap <C-h> :bprevious <CR>
noremap <C-l> :bnext <CR>
noremap <C-k> gt<CR>
noremap <C-j> gT<CR>
nmap n :norm! nzzzv<CR>
nmap N :norm! Nzzzv<CR>

nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
nmap <C-a> ggVG
nmap - <Plug>(choosewin)

map <F3> :GundoToggle<CR>
map <Leader>x :call OpenRanger()<CR>
map <Leader>z :ZoomWinTabToggle<CR>
inoremap [[ <esc>


nnoremap <leader>o :<C-u>Unite  -buffer-name=outline -start-insert outline<cr>
nnoremap <leader>yy :<C-u>Unite -buffer-name=yank    history/yank<cr>
nnoremap <leader>b :<C-u>Unite  -buffer-name=buffer  -start-insert buffer<cr>
