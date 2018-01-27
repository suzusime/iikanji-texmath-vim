#!/bin/env python
import sys

l = []
while True:
    try:
        line = input()
        if len(line) == 0:
            continue
        # コメント行は読み飛ばす
        if line[0] != "\"":
            idx = line.find(" ")
            if idx == -1:
                print("Error: スペースで区切られていません", file=sys.stderror)
                print(line, file=sys.stderror)
            else:
                lhs = line[:idx]
                rhs = line[idx+1:]
                l.append((lhs,rhs))
    except EOFError:
        break

setfunc = "\" 数式用のキーマップに変更する函数\n:function! s:SetKeyMap()"
unsetfunc = "\" 通常のキーマップに変更する函数\n:function! s:UnSetKeyMap()"

for line in l:
    lhs, rhs = line
    setfunc += "\n:inoremap <buffer> "+lhs+" "+rhs
    unsetfunc += "\n:silent! iunmap <buffer> "+lhs

setfunc += "\n:endfunction"
unsetfunc += "\n:endfunction"

f = open("template.vim", "r", encoding="utf-8")
s = f.read()
print(s+setfunc+"\n\n"+unsetfunc)
