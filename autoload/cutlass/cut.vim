
let s:activeRegister = ''

function! cutlass#cut#preMoveMotion()
    let s:activeRegister = v:register
endfunction

" Based off the example in `:h map-operator`
function! cutlass#cut#MoveMotion(type)

    let previousSelection = &selection
    let &selection = "inclusive"

    if a:type == 'visual'
        let selectChars = "gv"
    elseif a:type == 'line'
        let selectChars = "'[V']"
    elseif a:type == 'char'
        let selectChars = "`[v`]"
    else
        throw "assert"
    endif

    silent exe "normal! " . selectChars . "\"" . s:activeRegister . "y"
    " The same select method should work both times
    silent exe "normal! " . selectChars . "\"_d"

    let &selection = previousSelection
endfunction

function! cutlass#cut#addPlugMaps()
    nnoremap <silent> <expr> <plug>(CutlassCutMotion) ":call cutlass#cut#preMoveMotion()<cr>:set opfunc=cutlass#cut#MoveMotion<cr>" . (v:count > 0 ? v:count : '') . "g@"
    vnoremap <silent> <plug>(CutlessCutMotion) :<c-u>call cutlass#cut#preMoveMotion()<cr>:call cutlass#cut#MoveMotion('visual')<cr>
    nnoremap <silent> <expr> <plug>(CutlessCutLineMotion) v:count . 'yy' . v:count . '"_dd'

nnoremap <silent> <expr> <plug>MoveMotionLinePlug ':<c-u>EasyClipBeforeYank<cr>'. v:count .'yy'. v:count . '"_dd:EasyClipOnYanksChanged<cr>:call repeat#set("\<plug>MoveMotionLinePlug")<cr>'
endfunction

