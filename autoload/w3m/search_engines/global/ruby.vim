" File: autoload/w3m/search_engines/ruby.vim
" Version: 1.0.0
" Author: yuratomo (twitter @yusetomo)

let s:engine = w3m#search_engine#Init('ruby', 'http://www.google.com/search?sitesearch=doc.ruby-lang.org/en/1.9.3/function/&q=%s')

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
