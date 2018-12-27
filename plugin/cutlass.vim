
if exists('g:CutlassInitialized')
    finish
endif

" Set CutlassOverrideDefaults to 0 if you want to call this manually at a time of your choosing
if get(g:, 'CutlassOverrideDefaults', 1)
    call cutlass#redirectDefaultsToBlackhole()
endif

let g:CutlassInitialized = 1

