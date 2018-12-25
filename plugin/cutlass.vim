
if exists('g:CutlassInitialized')
    finish
endif

let g:CutlassInitialized = 1

nnoremap <silent> <expr> <plug>(CutlassCutMotion) ":call cutlass#preMoveMotion()<cr>:set opfunc=cutlass#MoveMotion<cr>" . (v:count > 0 ? v:count : '') . "g@"
vnoremap <silent> <plug>(CutlassCutMotion) :<c-u>call cutlass#preMoveMotion()<cr>:call cutlass#MoveMotion('visual')<cr>
nnoremap <silent> <expr> <plug>(CutlassCutLine) v:count . '"' . v:register . 'yy' . v:count . '"_dd'
nnoremap <silent> <expr> <plug>(CutlassCutToEndOfLineMotion) '"' . v:register . 'y$"_D'

