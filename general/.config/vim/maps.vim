
let mapleader = '\'


" Shorten REPL cycle duration.
nnoremap <Leader>s :!cls && shellcheck %<CR>
nnoremap <Leader>c :!cls && compileit %<CR>


" Write and backup; write as root.
nnoremap <Leader>w :call WriteAndBackUp()<CR>
nnoremap <Leader>W :w !sudo tee %<CR>


" Caret > Home; I don't want to press <S-6> every time
noremap <Home> ^
noremap <S-Home> <Home>

" J but upwards, and I don't use default K so.....
nnoremap gK K
nnoremap K kJ

" Yanks the whole buffer to '+'
nnoremap <Leader>ya ggVG"+y<C-o><C-o>
" Copies '+' register into system clipboard
nnoremap <Leader>yc :call WriteToClipboard(getreg('+'))<CR>
" Copies te whole buffer to '+' and then copies it into the system's clipboard
nmap <Leader>yC yayc


" Turns off search match highlighting
nnoremap <Leader>h :nohlsearch<CR>


" Take a Screenshot and insert, or not it's path
nnoremap <Leader>pp :call setreg('"', SaveScreenshot())<CR>P
nnoremap <Leader>PP :echo 'Saved' SaveScreenshot()<CR>
" Same as above, but use the contents of '"' instead of getcwd()
nnoremap <Leader>pr :call setreg('"', SaveScreenshot(getreg('"')))<CR>P
nnoremap <Leader>PR :call 'Saved' SaveScreenshot(getreg('"'))<CR>


" Capitalize last word
inoremap ;;c <ESC>B~Ela


" For some reason, when I accidentally type 'cie', vim hangs and I lose
" everything, so I might as well just map it to something harmless.
nnoremap cie <ESC>
" gqi as well
nnoremap gqi <ESC>


" Mappings for 'https://github.com/junegunn/fzf.vim'.
" See './fzf-vim-cfg.vim'
nmap <Leader>f <Plug>(fzf-prefix)
nmap <Leader><tab> <Plug>(fzf-maps-n)
xmap <Leader><tab> <Plug>(fzf-maps-x)
omap <Leader><tab> <Plug>(fzf-maps-o)


" Mappings for :help termdebug
nnoremap <Leader>dt :Termdebug<CR>
nnoremap <Leader>db :Break<CR>
nnoremap <Leader>dg :Continue<CR>
nnoremap <Leader>df :Finish<CR>
nnoremap <Leader>dc :Clear<CR>
nnoremap <Leader>do :Over<CR>
nnoremap <Leader>ds :Step<CR>
nnoremap <Leader>dr :Run<CR>
nnoremap <Leader>dd :Gdb<CR>
nnoremap <Leader>dp :Program<CR>

nnoremap <Leader>gg :Goyo<CR>

let s:path = expand('<sfile>:p:h') . '/snippets'

augroup snippets
    autocmd!
    autocmd FileType markdown           exec 'source' s:path .. '/md.vim'
    autocmd FileType markdown.pandoc    exec 'source' s:path .. '/md.vim'
    autocmd FileType python             exec 'source' s:path .. '/py.vim'
    autocmd FileType cpp                exec 'source' s:path .. '/cpp.vim'
    autocmd FileType c                  exec 'source' s:path .. '/c.vim'
    autocmd FileType vim.abbr           exec 'source' s:path .. '/abbr.vim'
augroup END

