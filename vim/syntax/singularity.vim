" Vim syntax file
" Language: Singularity Build Script
" Maintainer: Richard Berger
" Latest Revision: May 9, 2018

if exists("b:current_syntax")
  finish
endif

" Keywords
syn keyword shellCommand exec export apt apt-get yum dnf touch chmod usermod groupmod cat echo

" TODO add more common shell commands

syn case ignore
syn keyword singularityKeyword Bootstrap From OSVersion MirrorURL Include
syn case match

syn keyword singularitySection contained help setup files labels environment post runscript test
syn keyword singularitySection contained apphelp applabels appinstall appenv apprun appfiles

" TODO variable dereferencing

" Regions
syn region singularityComment start="#" end="\n"
syn region singularityComment start="%" end="\n" contains=singularitySection

" Highlighting
hi def link singularityVar     Variable
hi def link singularitySection Special
hi def link singularityKeyword Statement
hi def link singularityComment Comment
hi def link shellCommand       Function

let b:current_syntax = "singularity"
