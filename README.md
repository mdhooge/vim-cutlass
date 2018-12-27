
<img align="left" width="122" height="420" src="https://i.imgur.com/30weJjp.png">

## Cutlass

Very simple plugin that just overrides bindings for delete and change operations to not affect the clipboard.

The following keys are overridden to always use the black hole register:  `c`, `cc`, `C`, `s`, `S`, `d`, `dd`, `D`, `x`, `X`.

All of these operations now simply delete and do not affect the current yank.

You will almost certainly want to define a new key for 'cut', which you can do for example by adding the following to your .vimrc:

```
nnoremap m d
xnoremap m d

nnoremap mm dd
nnoremap M D
```

'm' here can be thought of as 'move'.  Or you might want to use the 'x' key:

```
nnoremap x d
xnoremap x d

nnoremap xx dd
nnoremap X D
```

## Credits

Based off of [vim-easyclip](https://github.com/svermeulen/vim-easyclip) and also [Drew Neil's ideas](https://github.com/nelstrom/vim-cutlass) (as well as the name)

