let s:save_cpo = &cpo
set cpo&vim


" ------------------------------
" init
" ------------------------------
" init dir
call unite#util#set_default('g:unite_source_sign_amazing_directory',
      \ unite#get_data_directory() . '/signamazing')


" ------------------------------
" public
" ------------------------------
" ---------------
" if dir not found, make dir
" @return {void}
" ---------------
function! unite#sources#signamazing#make_directory() "{{{
  if !isdirectory(g:unite_source_sign_amazing_directory)
        \ && !unite#util#is_sudo()
    call mkdir(g:unite_source_sign_amazing_directory, 'p')
  endif
endfunction "}}}

" ---------------
" @return {dict} unite source
" ---------------
function! unite#sources#signamazing#define() "{{{
  return s:di_source
endfunction "}}}


" ------------------------------
" private variable
" ------------------------------
" ---------------
" unite source
" @type {dict}
" ---------------
let s:di_source = {
      \ 'name' : 'signamazing',
      \ }
" ---------------
" gather_candidates func
" :help unite-source-attribute-gather_candidates
"
" @param {list<string>} args
" command line params
"
" @param {dict} context
" unite config
" :help unite-notation-{context}
"
" @return {list<dict>}
" :help unite-notation-{candidate}
" ---------------
function! s:di_source.gather_candidates(args, context) "{{{
  let li_candidates = []

  return li_candidates
endfunction "}}}

" ---------------
" func utillity
" @type {dict}
" ---------------
let s:di_func = {}


let &cpo = s:save_cpo
unlet s:save_cpo
