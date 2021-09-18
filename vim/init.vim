scriptencoding utf-8
set encoding=utf-8
" set shellslash

let g:home = $HOME
let g:home_cache = $HOME_CACHE
let g:home_config = $HOME_CONFIG
let g:home_repos = $HOME_REPOS

let g:vim_vimrc = g:home . '\_vimrc'
let g:vim_cache = g:home_cache . '\vim'
let g:vim_config = g:home_config . '\vim'
let g:vim_ftplugin = g:home_config . '\ftplugin'

" set runtimepath&
set packpath&
if &packpath !~# g:vim_cache
  call execute('set packpath^=' . g:vim_cache)
endif

let s:search_pattern = g:vim_config . '\*.rc'
let s:path_list = sort(split(glob(s:search_pattern), "\n"))
for s:file in s:path_list
  call execute('source ' . s:file)
endfor

