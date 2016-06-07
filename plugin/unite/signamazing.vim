let s:save_cpo = &cpo
set cpo&vim

let b:nu_id = 1
command! -nargs=1 SignAdd
      \ call <sid>sign_add(<q-args>)

function! s:sign_add(name) "{{{
  let li_define = [
        \ "sign",
        \ "place",
        \ b:nu_id,
        \ "line=" . line("."),
        \ "name=" . a:name,
        \ "file=" . expand("%:p"),
        \ ]
  exe join(li_define, ' ')
  let b:nu_id += 1
endfunction "}}}

let &cpo = s:save_cpo
unlet s:save_cpo
