" Singularity indent file

" Only load this script if no other indent script has been loaded
if exists("b:did_indent")
    finish
endif
let b:did_indent=1

" Configure other indent options
setlocal nocindent
setlocal nosmartindent
setlocal autoindent

" Declare function to determine indent level
setlocal indentexpr=GetSingularityIndent(v:lnum)

" Declare which keys trigger the indentation function
setlocal indentkeys=!^F,o,O,0%

" Indentation level function
" Returns the level of indentation as an integer
" -1 means to retain the current indentation level
"
" Not robust enough, needs to work backwards until the beginning of the last
" block (otherwise we don't know how to indent a line part way through a
" block)
"
" Should add rules for handling the header (Bootstrap:, From:, etc.)
function! GetSingularityIndent(lnum)
    " echom "Indenting line " lnum
    let lnum = a:lnum

    " The first line is at indent level 0
    if lnum == 1
        return 0
    endif

    " Trigger indentation when typing %, if line matches regex '^\s*%\*$' set indent to
    " level 0
    let this_line = getline(lnum)
    if this_line =~ '^\s*%'
        " echom "Section beginning (%), indenting to level 0"
        return 0
    endif

    let plnum = lnum - 1
    let previous_line = getline(plnum)

    " If previous line is one of
    " %setup,%files,%post,%test,%environment,%startscript,%runscript,%labels,%help
    " increase indent one step (or make indent level 1?)
    if previous_line =~ '^%\(setup\|files\|post\|test\|environment\|startscript\|runscript\|labels\|help\)'
        " echom "Previous line was section beginning, increasing indentation by shiftwidth: " &shiftwidth
        return indent(plnum) + &shiftwidth
    endif

    " If previous line is one of
    " %apprun *,%applabels *,%appinstall *,%appenv *,%apphelp *,%appfiles *
    " increase indent one step (or make indent level 1?)
    if previous_line =~ '^%\(apprun\|applabels\|appinstall\|appenv\|apphelp\|appfiles\)\s*[a-zA-Z]*'
        " echom "Previous line was app section beginning, increasing indentation by shiftwidth: " &shiftwidth
        return indent(plnum) + &shiftwidth
    endif

    " Otherwise return same indent level
    return -1
endfunction
