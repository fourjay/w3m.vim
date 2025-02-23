" File: autoload/w3m/search_engines/vims.vim
" Version: 1.0.0
" Author: yuratomo (twitter @yusetomo)

let s:engine = w3m#search_engine#Init('vims', 'http://www.google.com/search?ie=EUC-JP&oe=UTF-8&sitesearch=www.vim.org/scripts/&q=%s')

function! s:engine.preproc()
  let s:user_agent_backup = g:user_agent
  call w3m#SetUserAgent('KDDI', 0)
endfunction

function! s:engine.postproc()
  let g:user_agent = s:user_agent_backup
  unlet s:user_agent_backup
endfunction

function! s:engine.filter(outputs)
  return w3m#search_engine#GoogleSiteFilter(a:outputs)
endfunction

call w3m#search_engine#Add(s:engine)
