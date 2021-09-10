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

    " Search backwards for the section lnum belongs to
    let clnum = lnum - 1
    while clnum > 0
        let current_line = getline(clnum)

        " If parent section is one of
        " %setup,%files,%post,%test,%environment,%startscript,%runscript,%labels,%help
        " increase indent one step (or make indent level 1?)
        if current_line =~ '^%\(setup\|files\|post\|test\|environment\|startscript\|runscript\|labels\|help\)'
            " echom "Previous line was section beginning, increasing indentation by shiftwidth: " &shiftwidth
            return indent(clnum) + &shiftwidth
        endif

        " If parent section is one of
        " %apprun *,%applabels *,%appinstall *,%appenv *,%apphelp *,%appfiles *
        " increase indent one step (or make indent level 1?)
        if current_line =~ '^%\(apprun\|applabels\|appinstall\|appenv\|apphelp\|appfiles\)\s*[a-zA-Z]*'
            " echom "Previous line was app section beginning, increasing indentation by shiftwidth: " &shiftwidth
            return indent(clnum) + &shiftwidth
        endif

        let clnum = clnum - 1
    endwhile

    " Otherwise return same indent level
    return -1
endfunction
