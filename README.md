# iikanji-texmath-vim
数式を楽に入力するためのtex.vim――を楽に生成するためのスクリプト

## 使い方
```bash
vim map.txt #マップを好きに編集する
python generate.py < map.txt > tex.vim
cp -i tex.vim ~/.vim/after/ftplugin/
```

マップの書式は添付のmap.txtを参照してください。
