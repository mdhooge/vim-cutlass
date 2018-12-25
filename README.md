
<img align="left" width="155" height="420" src="https://i.imgur.com/30weJjp.png">

## Cutlass.vim

Based off of [vim-easyclip](https://github.com/svermeulen/vim-easyclip) and also [Drew Neil's ideas](https://github.com/nelstrom/vim-cutlass) (as well as the name)

Just like easyclip, it will override all the delete and change operations to not affect the current yank.  Then it adds a new motion 'cut'.  However the cut operator is not assigned by default so you need to add it to your config like in the example below.

# Example config:

```
nmap x <plug>(CutlassCutMotion)
vmap x <plug>(CutlassCutMotion)
nmap X <plug>(CutlassCutToEndOfLineMotion)
nmap xx <plug>(CutlassCutLine)
```

