
function! s:overrideSelectBindings()
    let i = 33

    " Add a map for every printable character to copy to black hole register
    " I see no easier way to do this
    while i <= 126
        if i !=# 124
            let char = nr2char(i)
            if i ==# 92
              let char = '\\'
            endif
            exec 'snoremap '. char .' <c-o>"_c'. char
        endif

        let i = i + 1
    endwhile

    snoremap <bs> <c-o>"_c
    snoremap <space> <c-o>"_c<space>
    snoremap \| <c-o>"_c|
endfunction

function! s:hasMapping(mapping, mode)
    return maparg(a:mapping, a:mode) != ''
endfunction

function! s:addWeakMapping(left, right, modes, ...)
    let recursive = a:0 > 0 ? a:1 : 0

    for mode in split(a:modes, '\zs')
        if !s:hasMapping(a:left, mode)
            exec mode . (recursive ? "map" : "noremap") . " <silent> " . a:left . " " . a:right
        endif
    endfor
endfunction

function! s:overrideDeleteAndChangeBindings()
    let bindings =
    \ [
    \   ['c', '"_c', 'nx'],
    \   ['cc', '"_S', 'n'],
    \   ['C', '"_C', 'nx'],
    \   ['s', '"_s', 'nx'],
    \   ['S', '"_S', 'nx'],
    \   ['d', '"_d', 'nx'],
    \   ['dd', '"_dd', 'n'],
    \   ['D', '"_D', 'nx'],
    \   ['x', '"_x', 'nx'],
    \   ['X', '"_X', 'nx'],
    \ ]

    for binding in bindings
        call call("s:addWeakMapping", binding)
    endfor
endfunction

function! cutlass#blackhole#redirectDefaultsToBlackhole()
    call s:overrideDeleteAndChangeBindings()
    call s:overrideSelectBindings()
endfunction

