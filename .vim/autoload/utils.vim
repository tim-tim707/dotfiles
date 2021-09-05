if exists("g:loaded_utils") || &cp
  finish
endif
let g:loaded_utils = 1

function utils#CreateHeaderAndSrc()
    if ( filereadable(expand("%:t:r") . ".c")
    \ && filereadable(expand("%:t:r") . ".h") )
        echoerr "file already exist"
        return
    endif

    let l:basename = expand("%:t:r")
    call writefile(
        \[
            \"#ifndef " . toupper(l:basename) . "_H",
            \"#define " . toupper(l:basename) . "_H",
            \"",
            \"",
            \"",
            \"#endif",
        \],
        \l:basename . ".h",
        \"a"
    \)

    call writefile(
        \[
            \"#include \"" . l:basename . ".h\"",
            \"",
        \],
        \l:basename . ".c",
        \"a"
    \)

    silent exec ":e +1 " . l:basename . ".c"
    silent exec ":rightbelow vsplit +4 " . l:basename . ".h"
endfunction

function utils#CreateFunctionFromDefinition()
    let l:function = substitute(getline("."), ";", "", "")
    let l:src_file = expand("%:r") . ".c"

    call writefile(
        \[
            \"",
            \l:function,
            \"{",
            \"    ",
            \"}",
        \],
        \l:src_file,
        \"a"
    \)

    if(bufexists(src_file))
        call win_gotoid(bufwinid(src_file))
        execute("normal G")
    endif
    execute("wa")
endfunction
