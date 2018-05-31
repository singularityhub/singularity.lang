" Vim syntax file
" Language: Singularity Build Script
" Maintainer: Richard Berger
" Latest Revision: May 9, 2018

if exists("b:current_syntax")
  finish
endif

" Keywords
syn case ignore
syn keyword singularityKeyword Bootstrap From OSVersion MirrorURL Include
syn keyword singularityKeyword UpdateURL Include
syn case match

syn keyword singularitySectionName contained help setup files labels
syn keyword singularitySectionName contained environment post runscript test
syn keyword singularitySectionName contained apphelp applabels appinstall
syn keyword singularitySectionName contained appenv apprun appfiles

" TODO variable dereferencing

" Regions
syn region singularityComment start="#" end="\n"
syn region singularitySectionLine start="^%" end="\s*$"
  \ contains=singularitySectionName
syn region singularitySectionHelp start=/^%help$/ end=/^%\@=/re=s-1 keepend
  \ contains=singularitySectionLine,singularitySectionName
syn region singularitySection start=/^%\(help\)\@!.\+$/ end=/^%\@=/re=s-1
  \ keepend
  \ contains=@singularityShell,singularitySectionLine,singularitySectionName
syn region singularityVariable start="%{" end="}"

" Highlighting
hi def link singularityVariable    Identifier
hi def link singularitySectionName Function
hi def link singularitySectionLine SpecialChar
hi def link singularitySectionHelp String
hi def link singularityKeyword     Keyword
hi def link singularityComment     Comment

" Shell highlighting
syn include @singularityShell syntax/sh.vim
syn iskeyword clear "sh.vim sets iskeyword and breaks our keywords

let b:current_syntax = "singularity"
