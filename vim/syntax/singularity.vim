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
syn keyword singularityKeyword Bootstrap From OSVersion MirrorURL Include UpdateURL Include
syn case match

syn keyword singularitySection contained help setup files labels environment post runscript test
syn keyword singularitySection contained apphelp applabels appinstall appenv apprun appfiles

" TODO variable dereferencing

" Regions
syn region singularityString start=/"/ skip=/\\"|\\\\/ end=/"/
syn region singularityComment start="#" end="\n"
syn region singularitySectionLine start="^%" end="\s" contains=singularitySection
syn region singularityVariable start="%{" end="}"

" Highlighting
hi def link singularityVariable    Identifier
hi def link singularitySection     Function
hi def link singularitySectionLine SpecialChar
hi def link singularityKeyword     Keyword
hi def link singularityComment     Comment
hi def link singularityString      String
hi def link shellCommand           Statement

let b:current_syntax = "singularity"
