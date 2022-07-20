--vim: foldmethod=marker

local autocmd = vim.api.nvim_create_autocmd
------------
-- CMD {{{  
------------
vim.cmd [[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200}) 
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
    autocmd BufEnter,BufRead,BufNewFile *.md set filetype=markdown
    let g:markdown_folding = 1
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd = 
  augroup end

  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end
  ]]
-- }}}

vim.cmd[[ set thesaurus+=/home/kalex/.config/nvim/thesaurus.txt ]]

-----------------------------------------------------------
---- TODO split new window and open files-shortcuts {{{
-----------------------------------------------------------
---- Load command shortcuts generated from bm-dirs and bm-files via shortcuts script.
---- Here leader is ";".
---- So ":vs ;cfz" will expand into ":vs /home/<user>/.config/zsh/.zshrc"
---- if typed fast without the timeout.
-----------------------------------------------------------
vim.cmd [[
  augroup !shortcuts
    au!
    au BufWritePost, bm-files,bm-dirs, !shortcuts
    source ~/.config/nvim/shortcuts.vim
  augroup END

	autocmd BufRead,BufNewFile Xresources,Xdefaults,xresources,xdefaults set filetype=xdefaults
	autocmd BufWritePost Xresources,Xdefaults,xresources,xdefaults !xrdb %

]]
-- }}}

-- Save file as sudo on files that require root permission"
vim.cmd[[ cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit! ]]

--------------------------------------------------
-- Buffer {{{
--------------------------------------------------
vim.cmd([[
" Delete buffer while keeping window layout (don't close buffer's windows).
let loaded_bclose = 1
if !exists('bclose_multiple')
  let bclose_multiple = 1
endif

" Display an error message.
function! s:Warn(msg)
  echohl ErrorMsg
  echomsg a:msg
  echohl NONE
endfunction

" Command ':Bclose' executes ':bd' to delete buffer in current window.
" The window will show the alternate buffer (Ctrl-^) if it exists,
" or the previous buffer (:bp), or a blank buffer if no previous.
" Command ':Bclose!' is the same, but executes ':bd!' (discard changes).
" An optional argument can specify which buffer to close (name or number).
function! s:Bclose(bang, buffer)
  if empty(a:buffer)
    let btarget = bufnr('%')
  elseif a:buffer =~ '^\d\+$'
    let btarget = bufnr(str2nr(a:buffer))
  else
    let btarget = bufnr(a:buffer)
  endif
  if btarget < 0
    call s:Warn('No matching buffer for '.a:buffer)
    return
  endif
  if empty(a:bang) && getbufvar(btarget, '&modified')
    call s:Warn('No write since last change for buffer '.btarget.' (use :Bclose!)')
    return
  endif
  " Numbers of windows that view target buffer which we will delete.
  let wnums = filter(range(1, winnr('$')), 'winbufnr(v:val) == btarget')
  if !g:bclose_multiple && len(wnums) > 1
    call s:Warn('Buffer is in multiple windows (use ":let bclose_multiple=1")')
    return
  endif
  let wcurrent = winnr()
  for w in wnums
    execute w.'wincmd w'
    let prevbuf = bufnr('#')
    if prevbuf > 0 && buflisted(prevbuf) && prevbuf != btarget
      buffer #
    else
      bprevious
    endif
    if btarget == bufnr('%')
      " Numbers of listed buffers which are not the target to be deleted.
      let blisted = filter(range(1, bufnr('$')), 'buflisted(v:val) && v:val != btarget')
      " Listed, not target, and not displayed.
      let bhidden = filter(copy(blisted), 'bufwinnr(v:val) < 0')
      " Take the first buffer, if any (could be more intelligent).
      let bjump = (bhidden + blisted + [-1])[0]
      if bjump > 0
        execute 'buffer '.bjump
      else
        execute 'enew'.a:bang
      endif
    endif
  endfor
  execute 'bdelete'.a:bang.' '.btarget
  execute wcurrent.'wincmd w'
endfunction
command! -bang -complete=buffer -nargs=? Bclose call <SID>Bclose(<q-bang>, <q-args>)
nnoremap <silent> <Leader>bd :Bclose<CR>


map gn :bn<cr>
map gp :bp<cr>
map gw :Bclose<cr>


" run current script with python3 by CTRL+R in command and insert mode
autocmd FileType python map <buffer> ,r :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> ,r <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
]])
-- }}}

-- {{{
vim.cmd([[
" !::exe [So]


command!          CurrentSession   call Info('Session: ' . GetCurrentSession())

command! -nargs=* Lua       lua print(vim.inspect(<args>))
command! -nargs=* LuaReload exec 'lua package.loaded["' '<args>' '"] = nil' | luafile %

command! -bar     So      so % | echo '' | call Warn('sourced')
command! -bar     SO      w|So

command! -bar     Sudo    write !sudo tee % >/dev/null
command! -bar     Scratch        vnew | setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile

" Generics

command! -bar -range DeleteTrailingWS noautocmd silent! exe 'keeppatterns <line1>,<line2>s/\s\+$//g'
command! -bar        UpdateTerminalSize silent resize +1 | silent resize -1


]])
-- }}}

-- Autoformat
-- augroup _lsp
--   autocmd!
--   autocmd BufWritePre * lua vim.lsp.buf.formatting()
-- augroup end

