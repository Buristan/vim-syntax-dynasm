" Vim syntax file
" Language:		DynASM by Mike Pall
" Original Author:	Igor Ehrlich
" Homepage:		http://github.com/Buristan/vim-syntax-dynasm
" Maintainer:		Sergey Kaplun <sergey_v_kaplun@mail.ru>
" Latest Revision:	07 Febuary 2021
" Version:		0.01
" License:		Redistribute under the same terms as Vim itself
" Purpose:		DynASM Syntax Highlighting

" This function detects dasc file type and returns it as a string.
" If filetype is unknown, it does `echoerr` and returns
" an empty string.
function s:DetectDascArch()
  let l:i = 1
  let l:last_line = line('$')
  " Scan file to determine dasc type.
  while l:i < l:last_line
    " Match for .arch definition.
    let l:dasc_arch = matchstr(getline(l:i), '\v(\.arch\s\s*)@<=\w\w*')
    if len(l:dasc_arch) > 0
      return l:dasc_arch
    endif
    let l:i += 1
  endwhile
  echoerr "dasc filetype unknown"
  return ""
endfunction

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Define Asm syntax {{{

let g:DascArch = s:DetectDascArch()
delfunction s:DetectDascArch

" Each specific arch must set @dascInstruction and @dascRegister.

" XXX: forse set "x86" to "x64" as a subset.
" This is not truly right, but some people may have x86 and x64
" definition in one file...
if g:DascArch ==# "x86" || g:DascArch ==# "x64"
  source <sfile>:p:h/include/dasc_x86_x64_syntax.vim
elseif g:DascArch ==# "mips" || g:DascArch ==# "mips64"
  " XXX: arch "mips32" and "mips64" has almost the same instruction set
  " and can be interpreted as one syntax type.
  source <sfile>:p:h/include/dasc_mips_syntax.vim
elseif g:DascArch ==# "arm"
  source <sfile>:p:h/include/dasc_arm_syntax.vim
elseif g:DascArch ==# "arm64" "aarch64
  source <sfile>:p:h/include/dasc_arm64_syntax.vim
elseif g:DascArch ==# "ppc"
  source <sfile>:p:h/include/dasc_ppc_syntax.vim
endif
" Else nothing to do.

" end of Asm syntax definition }}}

" Numbers {{{
" This part is taken verbatim or adapted from c.vim.
syn match	dascNumbersCom		display contained transparent "\<-\?\d\|-\?\.\d" contains=dascNumber,dascFloat
" Avoid numbers highlight inside control flow instructions.
" XXX: Exclude [><]\d pattern from whole dasc.
" Exceptions from the rule:
" * the first \.(el)?if before [><]\d (.if SMTH <5)
" * <<|>>\d (1<<5)
" See https://github.com/Buristan/vim-syntax-dynasm/issues/1.
syn match	dascNumber		display contained "\(\(\.\(el\)\?if[^\.]*\)\@<!\([^<]<\|[^>]>\)\)\@<!\zs\<-\?\d\+\(u\=l\{0,2}\|ll\=u\)\>"
" Hex number.
syn match	dascNumber		display contained "\<0x\x\+\(u\=l\{0,2}\|ll\=u\)\>"
syn match	dascNumber		display contained "\<\x\{8}\>"
" Flag the first zero of an octal number as something special.
syn match	dascFloat		display contained "\d\+f"
" Floating point number, with dot, optional exponent.
syn match	dascFloat		display contained "\d\+\.\d*\(e[-+]\=\d\+\)\=[fl]\="
" Floating point number, starting with a dot, optional exponent.
syn match	dascFloat		display contained "\.\d\+\(e[-+]\=\d\+\)\=[fl]\=\>"
" Floating point number, without dot, with exponent.
syn match	dascFloat		display contained "\d\+e[-+]\=\d\+[fl]\=\>"
" end of Numbers }}}

" Should be after arm* and numbers to rewrite arm*|Dasc numbers
" and highlight cNumber inside C part of the code.
" See https://github.com/Buristan/vim-syntax-dynasm/issues/1.
if version < 600
  so <sfile>:p:h/c.vim
else
  runtime! syntax/c.vim
  unlet b:current_syntax
endif

syn keyword	dascTodo		contained TODO FIXME XXX
syn region	dascComment		start="//" end="$" contains=dascTodo

" Preproc {{{
syn match dascPreproc			"\.\(arch\|capture\|elif\|else\|endcapture\|endif\|endmacro\|error\|define\|dumpcapture\|fatal\|if\|include\|label\|macro\|nop\|section\|template\|type\)\>" contained
" XXX: not separate arch specific Preproc macro. They look pretty
" the same. If it necessary, it may be separated.
" Also may check the amount of arguments.
syn match dascPreproc			"\.\(actionlist\|align\|aword\|byte\|dword\|externnames\|globalnames\|globals\|long\|sbyte\|space\|word\)\>" contained
" end of Preproc }}}

syn cluster	dascString		add=cString

" Not \zs in pattern match due to clashing with dascSyntax
" as contained.
syn match	dascLabel		"|\@<=\zs\(\s*\(->\)\?[a-zA-Z0-9@_]\+\|[0-9]\):" contained contains=NONE

" XXX: @dascNumber for custom arch numbers overlaps dascNumber
" and dascFloat.
" @dascExtra for custom users' rules.
" FIXME: all clusters are highlights inside cParen.
" Add custom C syntax file looks weird and excess.
syn match	dascSyntax	"^\(\s*\(\(|\)\(||\)*\)\s*\)[^|]*" transparent contains=@dascExtra,@dascInstruction,@dascNumber,@dascRegister,@dascString,@dascType,cStorageClass,cType,dascComment,dascMacro,dascNumber,dascLabel,dascPreproc

" Links {{{
hi def link	dascType		Type
hi def link	dascStorageClass	StorageClass
hi def link	dascString		String
hi def link	dascPreproc		Special
hi def link	dascNumber		Number
hi def link	dascLabel		Label
hi def link	dascFloat		Float
hi def link	dascComment		Comment
" end of Links }}}

let b:current_syntax = "dynasm"

" vim: ts=8:fdm=marker:ff=unix:foldopen=all:foldclose=all
