if exists('b:did_ftplugin_tex_flag')
  finish
endif
let b:did_ftplugin_tex_flag = 1
scriptencoding utf-8

" キーマップの設定を手動で実行するコマンド
:command -buffer Math :call s:SetKeyMap()
:command -buffer UnMath :call s:UnSetKeyMap()

" 数式入力用キーマップを用いて挿入モードに入る
:nnoremap <buffer> <Leader>mi :Math<CR>i
:nnoremap <buffer> <Leader>ma :Math<CR>a
:nnoremap <buffer> <Leader>mI :Math<CR>i$$<Left>
:nnoremap <buffer> <Leader>mA :Math<CR>a$$<Left>
:nnoremap <buffer> <Leader>mo :Math<CR>o\[<CR>\]<Up><End><CR>
:nnoremap <buffer> <Leader>mO :Math<CR>o\begin{equation}<CR>\end{equation}<Up><End><CR>


" 挿入モードから抜けるときに自動で普通のキーマップに戻す
:autocmd InsertLeave <buffer> UnMath
" <C-C>で戻った時も普通のキーマップに戻るようにする
" :inoremap <buffer> <silent> <unique> <C-C> <C-C>:UnMath<CR>

