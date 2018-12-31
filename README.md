<img align="left" width="122" height="420" src="https://i.imgur.com/30weJjp.png">

# Cutlass.vim

Very simple plugin that just overrides the delete operations to not affect the current yank.

It achieves this by overriding the following keys to always use the black hole register:  `c`, `cc`, `C`, `s`, `S`, `d`, `dd`, `D`, `x`, `X`.  Note that if you have already mapped these keys to something else (like we do below with 'x') then it will not change it again.

After including this plugin, all of these operations will simply delete and not cut.  However, you will still want to have a key for 'cut', which you can add by including the following to your .vimrc:

```
nnoremap m d
xnoremap m d

nnoremap mm dd
nnoremap M D
```

'm' here can be thought of as 'move'.  Or you might want to use the 'x' key instead:

```
nnoremap x d
xnoremap x d

nnoremap xx dd
nnoremap X D
```

## Why would you want to do this?

See [here](http://vimcasts.org/blog/2013/11/registers-the-good-the-bad-and-the-ugly-parts/)

You might also consider installing [vim-yoink](https://github.com/svermeulen/vim-yoink) which contains other clipboard related improvements mentioned in this article.

## Credits

Based off of [vim-easyclip](https://github.com/svermeulen/vim-easyclip) and also [Drew Neil's ideas](https://github.com/nelstrom/vim-cutlass) (as well as the name)

