let s:save_cpo = &cpo
set cpo&vim


" ------------------------------
" init
" ------------------------------
" define group dir
call unite#sources#signamazing#make_directory()


" ------------------------------
" public
" ------------------------------
command! -nargs=1 -complete=customlist,s:unite_sign_amazing_place_add_comp
      \ UniteSignAmazingPlaceAdd call s:unite_sign_amazing_place_add(<q-args>)
command! -nargs=? -complete=customlist,s:unite_sign_amazing_define_input_comp
      \ UniteSignAmazingDefineInput call s:unite_sign_amazing_define_input(<q-args>)
command! -nargs=? -complete=customlist,s:unite_sign_amazing_define_output_comp
      \ UniteSignAmazingDefineOutput call s:unite_sign_amazing_define_output(<q-args>)


" ------------------------------
" private function add
" ------------------------------
function! s:unite_sign_amazing_place_add(st_name) "{{{
  let li_definition = [
        \ 'sign',
        \ 'place',
        \ s:nu_place_id,
        \ 'line=' . line('.'),
        \ 'name=' . a:st_name,
        \ 'file=' . expand('%:p'),
        \ ]
  exe join(li_definition, ' ')
  let s:nu_place_id += 1
endfunction "}}}
function! s:unite_sign_amazing_place_add_comp(A,L,P) "{{{
  " TODO
  " sign定義一覧
  return ['sushi']
endfunction "}}}


" ------------------------------
" private function input
" ------------------------------
function! s:unite_sign_amazing_define_input(st_file_name) "{{{
  let st_path = s:get_define_group_path(a:st_file_name)
  if empty(glob(st_path))
    echom 'define group not found ' . st_path
    return
  endif

  " TODO
  " 現在のplaceがある場合、消去確認
  " 現在のplace全てをunplace
  " 現在のdefine全てをundefine
  " 指定ファイルのjson読み込み
  " loopしてsign define
  echo '未実装'
endfunction "}}}
function! s:unite_sign_amazing_define_input_comp(A,L,P) "{{{
  " TODO
  " default + 現在のフォルダにあるファイル一覧
  return ['default', 'emoji']
endfunction "}}}


" ------------------------------
" private function output
" ------------------------------
function! s:unite_sign_amazing_define_output(st_file_name) "{{{
  let st_path = s:get_define_group_path(a:st_file_name)
  if s:st_define_group_path != st_path
    " TODO
    " 読み込み済みのdefine groupでない場合、確認を出す
    echom '読み込み済みのdefine groupと違います'
  endif

  " TODO
  " 現在のdefineを取得
  " json化
  " 指定ファイル書き出し
  echo '未実装'
endfunction "}}}
function! s:unite_sign_amazing_define_output_comp(A,L,P) "{{{
  " TODO
  " inputと同じ
  return ['default', 'emoji']
endfunction "}}}


" ------------------------------
" private function utillity
" ------------------------------
function s:get_define_group_path(st_file_name) "{{{
  let st_file = empty(a:st_file_name) ? 'default.json' : a:st_file_name
  let st_file = (st_file =~? '\.json$') ? st_file : st_file . '.json'
  let st_path = g:unite_source_sign_amazing_directory . '/' . st_file
  return st_path
endfunction "}}}


" ------------------------------
" private variable
" ------------------------------
" place id
let s:nu_place_id = 1

" define group name
let s:st_define_group_path = s:get_define_group_path('')


let &cpo = s:save_cpo
unlet s:save_cpo
