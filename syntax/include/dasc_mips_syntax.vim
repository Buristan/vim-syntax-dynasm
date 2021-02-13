" Vim syntax file
" Language:		MIPS
" Original Author:	Alex Brick <alex@alexrbrick.com>
" Original Maintainer:	Harenome Ranaivoarivony Razanajato <harno.ranaivo@gmail.com>
" Original Homepage:	http://github.com/harenome/vim-mipssyntax
" License:		Redistribute under the same terms as Vim itself
" Purpose:		MIPS Assembly Syntax Highlighting
" Major portions taken verbatim or adapted from the mips.vim syntax file,
" see: https://github.com/harenome/vim-mipssyntax/blob/master/syntax/mips.vim
" Based on Alex Brick's syntax file:
" http://www.vim.org/scripts/script.php?script_id=2045

setlocal iskeyword+=-
syn case match

" Registers {{{
" O32 Calling Convention {{{
syn match	mipsRegister		"\$\?\<zero\>" contained
syn match	mipsRegister		"\$\?\<at\>" contained
syn match	mipsRegister		"\$\?\<v[0-1]\>" contained
syn match	mipsRegister		"\$\?\<a0\>" contained
syn match	mipsRegister		"\$\?\<a[1-3]\>" contained
syn match	mipsRegister		"\$\?\<t[0-7]\>" contained
syn match	mipsRegister		"\$\?\<s[0-7]\>" contained
syn match	mipsRegister		"\$\?\<t[8-9]\>" contained
syn match	mipsRegister		"\$\?\<k[0-1]\>" contained
syn match	mipsRegister		"\$\?\<gp\>" contained
syn match	mipsRegister		"\$\?\<sp\>" contained
syn match	mipsRegister		"\$\?\<fp\>" contained
syn match	mipsRegister		"\$\?\<ra\>" contained
" end of O32 Calling Convention }}}

" N32 and N64 Calling Convention {{{
syn match	mipsRegister		"\$\?\<a[4-7]\>" contained
syn match	mipsRegister		"\$\?\<s8\>" contained
" end of N32 N64 Calling Convention }}}
let b:i = 0
while b:i < 32
  " This is for the regular registers.
  exec 'syn match mipsRegister "\$'.b:i.'\(\d\+\)\@!" contained'
  " And this is for the FP registers.
  exec 'syn match mipsRegister "\$f'.b:i.'\(\d\+\)\@!" contained'
  exec 'syn match mipsRegister "\<r'.b:i.'\(\d\+\)\@!" contained'
  exec 'syn match mipsRegister "\<f'.b:i.'\(\d\+\)\@!" contained'
  let b:i += 1
endwhile
unlet b:i
" end of Registers }}}

" Instruction Sets {{{
" MIPS1 {{{
" Instructions {{{
" Match instead keyword to avoid hightlighting at macroses or words.
syn match	mipsInstruction		"\<addi\?u\?\ze\s" contained "add addi addu addiu
syn match	mipsInstruction		"\<andi\?\ze\s" contained "and andi
syn match	mipsInstruction		"\<bc[0-3][ft]\ze\s" contained "bc0f bc0t bc1f bc1t bc2f bc2t bc3f bc3t
syn match	mipsInstruction		"\<beqz\?\ze\s" contained "beq beqz
syn match	mipsInstruction		"\<b[gl]\(ez\|tz\|ezal\)\ze\s" contained "bgez bgtz bgezal blez bltz bltzal
syn match	mipsInstruction		"\<bnez\?\ze\s" contained "bne bnez
syn keyword	mipsInstruction		break contained
syn match	mipsInstruction		"\<c[0-3]\ze\s" contained "c0 c1 c2 c3
syn match	mipsInstruction		"\<c[ft]c[0-3]\ze\s" contained "cfc0 ctc0 cfc1 ctc1 cfc2 ctc2 cfc3 ctc3
syn match	mipsInstruction		"\<divu\?\ze\s" contained "div divu
syn match	mipsInstruction		"\<j\(al\|alr\|alx\|r\)\?\ze\s" contained "j jal jalr jalx jr
syn match	mipsInstruction		"\<l\([bh]u\?\|ui\)\ze\s" contained "lb lbu lh lhu lui
syn match	mipsInstruction		"\<lw\(c[0-3]\|l\|wr\)\?\ze\s" contained "lw lwc0 lwc1 lwc2 lwc3 lwl lwr
syn match	mipsInstruction		"\<m[ft]\(c[0-3]\|hi\|lo\)\ze\s" contained "mfc0 mtc0 mfc1 mtc1 mfc2 mtc2 mfc3 mtc3 mfhi mthi mflo mtlo
syn match	mipsInstruction		"\<multu\?\ze\s" contained "mult multu
syn match	mipsInstruction		"\<negu\?\ze\s" contained "neg negu
syn match	mipsInstruction		"\<\(nor\|not\|or\|ori\)\ze\s" contained
syn match	mipsInstruction		"\<\(rem\|remu\|rfe\)\ze\s" contained
syn match	mipsInstruction		"\<s[bh]\ze\s" contained "sb sh
syn match	mipsInstruction		"\<sl\(lv\?\|ti\?u\?\)\ze\s" contained "sll sllv slt slti sltu sltiu
syn match	mipsInstruction		"\<sr[al]v\?\ze\s" contained "sra srav srl srlv
syn match	mipsInstruction		"\<subu\?\ze\s" contained "sub subu
syn match	mipsInstruction		"\<sw\(c[0-3]\|l\|wr\)\?\ze\s" contained "sw swc0 swc1 swc2 swc3 swl swr
syn keyword	mipsInstruction		syscall contained
syn match	mipsInstruction		"\<tlb\(p\|r\|wi\|wr\)\ze\s" contained "tlbp tlbr tlbwi tlbwr
syn match	mipsInstruction		"\<xori\?\ze\s" contained "xor xori

syn match	mipsInstruction		"\<abs\.\(d\|s\)\ze\s" contained
syn match	mipsInstruction		"\<add\.\(d\|s\)\ze\s" contained
syn match	mipsInstruction		"\<c\.eq\.\(d\|s\)\ze\s" contained
syn match	mipsInstruction		"\<c\.f\.\(d\|s\)\ze\s" contained
syn match	mipsInstruction		"\<c\.le\.\(d\|s\)\ze\s" contained
syn match	mipsInstruction		"\<c\.lt\.\(d\|s\)\ze\s" contained
syn match	mipsInstruction		"\<c\.nge\.\(d\|s\)\ze\s" contained
syn match	mipsInstruction		"\<c\.ngl\.\(d\|s\)\ze\s" contained
syn match	mipsInstruction		"\<c\.ngle\.\(d\|s\)\ze\s" contained
syn match	mipsInstruction		"\<c\.ngt\.\(d\|s\)\ze\s" contained
syn match	mipsInstruction		"\<c\.ole\.\(d\|s\)\ze\s" contained
syn match	mipsInstruction		"\<c\.olt\.\(d\|s\)\ze\s" contained
syn match	mipsInstruction		"\<c\.seq\.\(d\|s\)\ze\s" contained
syn match	mipsInstruction		"\<c\.sf\.\(d\|s\)\ze\s" contained
syn match	mipsInstruction		"\<c\.ueq\.\(d\|s\)\ze\s" contained
syn match	mipsInstruction		"\<c\.ule\.\(d\|s\)\ze\s" contained
syn match	mipsInstruction		"\<c\.ult\.\(d\|s\)\ze\s" contained
syn match	mipsInstruction		"\<c\.un\.\(d\|s\)\ze\s" contained
syn match	mipsInstruction		"\<cvt\.d\.\(s\|w\)\ze\s" contained
syn match	mipsInstruction		"\<cvt\.s\.\(d\|w\)\ze\s" contained
syn match	mipsInstruction		"\<cvt\.w\.\(d\|s\)\ze\s" contained
syn match	mipsInstruction		"\<div\.\(d\|s\)\ze\s" contained
syn match	mipsInstruction		"\<l\.s\ze\s" contained
syn match	mipsInstruction		"\<mov\.\(d\|s\)\ze\s" contained
syn match	mipsInstruction		"\<mul\.\(d\|s\)\ze\s" contained
syn match	mipsInstruction		"\<neg\.\(d\|s\)\ze\s" contained
syn match	mipsInstruction		"\<s\.s\ze\s" contained
syn match	mipsInstruction		"\<sub\.\(d\|s\)\ze\s" contained
" end of Instructions }}}

" Alias {{{
syn match	mipsAlias		"\<b\(al\)\?\ze\s" contained "b bal
syn keyword	mipsAlias		ehb contained
syn keyword	mipsAlias		nop ssnop contained
"}}}

" Macros {{{
syn match	mipsMacro		"\<\<abs\ze\s" contained
syn match	mipsMacro		"\<\<b[gl][et]u\?\ze\s" contained "bge bgeu bgt bgtu ble bleu blt bltu
syn match	mipsMacro		"\<cop[0-3]\ze\s" contained "cop0 cop1 cop2 cop3
syn match	mipsMacro		"\<\(la\|lca\|ld\|li\)\ze\s" contained
syn match	mipsMacro		"\<move\s" contained
syn match	mipsMacro		"\<mulo\?u\?\ze\s" contained "mul mulo mulu mulou
syn match	mipsMacro		"\<ro[lr]\ze\s" contained "rol ror
syn match	mipsMacro		"\<s\(d\|eq\|g[et]u\?\)\ze\s" contained "sd seq sge sgeu sgt sgtu
syn match	mipsMacro		"\<s[ln]eu\?\ze\s" contained "sle sleu sne sneu
syn match	mipsMacro		"\<\(ulh\|ulhu\|ulw\|ush\|usw\)\ze\s" contained

syn match	mipsMacro		"\<l\.d\ze\s" contained
syn match	mipsMacro		"\<li\.d\ze\s" contained
syn match	mipsMacro		"\<li\.s\ze\s" contained
syn match	mipsMacro		"\<s\.d\ze\s" contained
syn match	mipsMacro		"\<trunc\.w\.\(d\|s\)\ze\s" contained
" end of Macros }}}
" end of MIPS1 }}}

" MIPS2 {{{
" Instructions {{{
syn match	mipsInstruction		"\<bc[0-3][ft]l\ze\s" contained "bc0fl bc0tl bc1fl bc1tl bc2fl bc2tl bc3fl bc3tl
syn match	mipsInstruction		"\<b\(eq\|ne\)z\?l\ze\s" contained "beql bnel beqzl bnezl
syn match	mipsInstruction		"\<b[gl][et]zl\ze\s" contained "bgezl blezl bgtzl bltzl
syn match	mipsInstruction		"\<b\(ge\|lt\)zall\ze\s" contained "bgezall bltzall
syn keyword	mipsInstruction		flush contained
syn keyword	mipsInstruction		invalidate contained
syn keyword	mipsInstruction		lcache contained
syn match	mipsInstruction		"\<l\(dc[1-3]\|l\)\ze\s" contained "ldc1 ldc2 ldc3 ll
syn match	mipsInstruction		"\<s\(c\(ache\)\?\|dc[1-3]\)\ze\s" contained "sc scache sdc1 sdc2 sdc3
syn match	mipsInstruction		"\<sync\ze\s" contained
syn match	mipsInstruction		"\<teqi\?\ze\s" contained "teq teqi
syn match	mipsInstruction		"\<tgei\?u\?\ze\s" contained "tge tgei tgeu tgeiu
syn match	mipsInstruction		"\<tlti\?u\?\ze\s" contained "tlt tlti tltu tltiu
syn match	mipsInstruction		"\<tnei\?\ze\ze\s" contained "tne tnei

syn match	mipsInstruction		"\<ceil\.w\.d\ze\s" contained
syn match	mipsInstruction		"\<ceil\.w\.s\ze\s" contained
syn match	mipsInstruction		"\<floor\.w\.d\ze\s" contained
syn match	mipsInstruction		"\<floor\.w\.s\ze\s" contained
syn match	mipsInstruction		"\<round\.w\.d\ze\s" contained
syn match	mipsInstruction		"\<round\.w\.s\ze\s" contained
syn match	mipsInstruction		"\<sqrt\.d\ze\s" contained
syn match	mipsInstruction		"\<sqrt\.s\ze\s" contained
syn match	mipsInstruction		"\<sync\.l\ze\s" contained
syn match	mipsInstruction		"\<sync\.p\ze\s" contained
" end of Instructions }}}

" Macros.
syn match	mipsMacro		"\<b[gl][et]u\?l\ze\s" contained "bgel blel bgeul bleul bgtl bltl bgtul bltul
" end of MIPS2 }}}

" MIPS3 {{{
syn keyword mipsInstruction cache contained
syn match	mipsInstruction		"\<cl[oz]\ze\s" contained "clo clz
syn match	mipsInstruction		"\<da\(bs\|ddi\?u\?\)\ze\s" contained "dabs dadd daddi daddiu daddu
syn match	mipsInstruction		"\<dct[rw]\ze\s" contained "dctr dctw
syn match	mipsInstruction		"\<ddivu\?\ze\s" contained "ddiv ddivu
syn keyword	mipsInstruction		deret contained
syn match	mipsInstruction		"\<di\ze\s" contained
syn match	mipsInstruction		"\<\(dla\|dlca\|dli\)\ze\s" contained
syn match	mipsInstruction		"\<dm[ft]c[0-3]\ze\s" contained "dmfc0 dmtc0 dmfc1 dmtc1 dmfc2 dmtc2 dmfc3 dmtc3
syn match	mipsInstruction		"\<dmul\([ot]u\?\)\?\ze\s" contained "dmul dmulo dmulou dmult dmultu
syn match	mipsInstruction		"\<dnegu\?\ze\s" contained "dneg dnegu
syn match	mipsInstruction		"\<dremu\?\ze\s" contained "drem dremu
syn match	mipsInstruction		"\<dro[lr]\ze\s" contained "drol dror
syn match	mipsInstruction		"\<dsll\(32\|v\)\?\ze\s" contained "dsll dsll32 dsllv
syn match	mipsInstruction		"\<dsr[al]\(32\|v\)\?\ze\s" contained "dsra dsra32 dsrav dsrl dsrl32 dsrlv
syn match	mipsInstruction		"\<dsubu\?\ze\s" contained "dsub dsubu
syn keyword	mipsInstruction		ei contained
syn keyword	mipsInstruction		eret contained
syn match	mipsInstruction		"\<ext\ze\s" contained
syn match	mipsInstruction		"\<ins\ze\s" contained
syn match	mipsInstruction		"\<\(ldl\|ldr\|lld\|lwu\)\ze\s" contained
syn match	mipsInstruction		"\<maddu\?\ze\s" contained "madd maddu
syn match	mipsInstruction		"\<mfhc[1-2]\ze\s" contained "mfhc1 mfhc2
syn match	mipsInstruction		"\<msugu\?\ze\s" contained "msub msubu
syn match	mipsInstruction		"\<mthc[1-2]\ze\s" contained "mthc1 mthc2
syn keyword	mipsInstruction		pause contained
syn match	mipsInstruction		"\<\(rdhwr\|rdpgpr\)\ze\s" contained
syn match	mipsInstruction		"\<ro\(t\?rv\|tl\|rt\)\ze\s" contained "rorv rotl rotr rotrv
syn match	mipsInstruction		"\<scd\ze\s" contained
syn match	mipsInstruction		"\<\(sdbbp\|sdl\|sdr\)\ze\s" contained
syn match	mipsInstruction		"\<se[bh]\ze\s" contained "seb seh
syn match	mipsInstruction		"\<sync_\(acquire\|i\|release\)\ze\s" contained "synci sync_release sync_acquire synci sync_release
syn match	mipsInstruction		"\<sync_[rw]\?mb\ze\s" contained "sync_mb sync_rmb sync_wmb
syn match	mipsInstruction		"\<udi[0-9]\ze\s" contained "udi0 udi1 udi2 udi3 udi4 udi5 udi6 udi7 udi8 udi9
syn match	mipsInstruction		"\<udi1[0-5]\ze\s" contained "udi10 udi11 udi12 udi13 udi14 udi15
syn match	mipsInstruction		"\<u[ls]d\ze\s" contained "uld usd
syn keyword	mipsInstruction		wait contained
syn match	mipsInstruction		"\<wrpgpr\ze\s" contained
syn match	mipsInstruction		"\<wsbh\ze\s" contained

syn match	mipsInstruction		"\<ceil\.l\.d\ze\s" contained
syn match	mipsInstruction		"\<ceil\.l\.s\ze\s" contained
syn match	mipsInstruction		"\<cvt\.d\.l\ze\s" contained
syn match	mipsInstruction		"\<cvt\.l\.d\ze\s" contained
syn match	mipsInstruction		"\<cvt\.l\.s\ze\s" contained
syn match	mipsInstruction		"\<cvt\.s\.l\ze\s" contained
syn match	mipsInstruction		"\<floor\.l\.d\ze\s" contained
syn match	mipsInstruction		"\<floor\.l\.s\ze\s" contained
syn match	mipsInstruction		"\<jalr\.hb\ze\s" contained
syn match	mipsInstruction		"\<jr\.hb\ze\s" contained
syn match	mipsInstruction		"\<round\.l\.d\ze\s" contained
syn match	mipsInstruction		"\<round\.l\.s\ze\s" contained
syn match	mipsInstruction		"\<trunc\.l\.d\ze\s" contained
syn match	mipsInstruction		"\<trunc\.l\.s\ze\s" contained
" end of MIPS3 }}}

" MIPS4 32 {{{
syn match	mipsInstruction		"\<mov[fntz]\ze\s" contained "movf movn movt movz
syn match	mipsInstruction		"\<pref\ze\s" contained

syn match	mipsInstruction		"\<movf\.\(d\|s\)\ze\s" contained
syn match	mipsInstruction		"\<movn\.\(d\|s\)\ze\s" contained
syn match	mipsInstruction		"\<movt\.\(d\|s\)\ze\s" contained
syn match	mipsInstruction		"\<movz\.\(d\|s\)\ze\s" contained
" end of MIPS4 32 }}}

" MIPS4 32R2 {{{
syn match	mipsInstruction		"\<ldxc1\ze\s" contained
syn match	mipsInstruction		"\<lwxc1\ze\s" contained
syn match	mipsInstruction		"\<prefx\ze\s" contained
syn match	mipsInstruction		"\<sdxc1\ze\s" contained
syn match	mipsInstruction		"\<swxc1\ze\s" contained

syn match	mipsInstruction		"\<madd\.\(d\|s\)\ze\s" contained
syn match	mipsInstruction		"\<msub\.\(d\|s\)\ze\s" contained
syn match	mipsInstruction		"\<nmadd\.\(d\|s\)\ze\s" contained
syn match	mipsInstruction		"\<nmsub\.\(d\|s\)\ze\s" contained
syn match	mipsInstruction		"\<recip\.\(d\|s\)\ze\s" contained
syn match	mipsInstruction		"\<rsqrt\.\(d\|s\)\ze\s" contained
" end of MIPS4 32R2 }}}

" MIPS5 32R2 {{{
syn match	mipsInstruction		"\<[ls]uxc1\ze\s" "luxc1 suxc1

syn match	mipsInstruction		"\<abs\.ps\ze\s" contained
syn match	mipsInstruction		"\<add\.ps\ze\s" contained
syn match	mipsInstruction		"\<alnv\.ps\ze\s" contained
syn match	mipsInstruction		"\<c\.eq\.ps\ze\s" contained
syn match	mipsInstruction		"\<c\.f\.ps\ze\s" contained
syn match	mipsInstruction		"\<c\.le\.ps\ze\s" contained
syn match	mipsInstruction		"\<c\.lt\.ps\ze\s" contained
syn match	mipsInstruction		"\<c\.nge\.ps\ze\s" contained
syn match	mipsInstruction		"\<c\.ngl\.ps\ze\s" contained
syn match	mipsInstruction		"\<c\.ngle\.ps\ze\s" contained
syn match	mipsInstruction		"\<c\.ngt\.ps\ze\s" contained
syn match	mipsInstruction		"\<c\.ole\.ps\ze\s" contained
syn match	mipsInstruction		"\<c\.olt\.ps\ze\s" contained
syn match	mipsInstruction		"\<c\.seq\.ps\ze\s" contained
syn match	mipsInstruction		"\<c\.sf\.ps\ze\s" contained
syn match	mipsInstruction		"\<c\.ueq\.ps\ze\s" contained
syn match	mipsInstruction		"\<c\.ule\.ps\ze\s" contained
syn match	mipsInstruction		"\<c\.ult\.ps\ze\s" contained
syn match	mipsInstruction		"\<c\.un\.ps\ze\s" contained
syn match	mipsInstruction		"\<cvt\.ps\.s\ze\s" contained
syn match	mipsInstruction		"\<cvt\.s\.pl\ze\s" contained
syn match	mipsInstruction		"\<cvt\.s\.pu\ze\s" contained
syn match	mipsInstruction		"\<madd\.ps\ze\s" contained
syn match	mipsInstruction		"\<mov\.ps\ze\s" contained
syn match	mipsInstruction		"\<movf\.ps\ze\s" contained
syn match	mipsInstruction		"\<movn\.ps\ze\s" contained
syn match	mipsInstruction		"\<movt\.ps\ze\s" contained
syn match	mipsInstruction		"\<movz\.ps\ze\s" contained
syn match	mipsInstruction		"\<msub\.ps\ze\s" contained
syn match	mipsInstruction		"\<mul\.ps\ze\s" contained
syn match	mipsInstruction		"\<neg\.ps\ze\s" contained
syn match	mipsInstruction		"\<nmadd\.ps\ze\s" contained
syn match	mipsInstruction		"\<nmsub\.ps\ze\s" contained
syn match	mipsInstruction		"\<pll\.ps\ze\s" contained
syn match	mipsInstruction		"\<plu\.ps\ze\s" contained
syn match	mipsInstruction		"\<pul\.ps\ze\s" contained
syn match	mipsInstruction		"\<puu\.ps\ze\s" contained
syn match	mipsInstruction		"\<sub\.ps\ze\s" contained
" end of MIPS5 32R2 }}}

" MIPS64.
syn match	mipsInstruction		"\<dcl[oz]\ze\s" contained "dclo dclz

" MIPS64R2 {{{
" Instructions {{{
syn match	mipsInstruction		"\<dext\(m\|u\)\?\ze\s" contained "dext dextm dextu
syn match	mipsInstruction		"\<dins\(m\|u\)\?\ze\s" contained "dins dinsm dinsu
syn match	mipsInstruction		"\<drot\?r\(32\|v\)\ze\s" contained "dror32 drorv drotr32 drotrv
syn match	mipsInstruction		"\<\(dsbh\|dshd\)\ze\s" contained
" end of the Instructions}}}

" Macros.
syn match	mipsMacro		"\<drot[lr]\ze\s" contained "drotl drotr

" end of MIPS64R2 }}}
" end of Instruction Sets }}}

" Pseudo things {{{
" Some compilers and emulators support some
" of the following instructions, directives, etc.

" Pseudo Instructions {{{
syn match	mipsPseudoInstruction	"\<subiu\?\ze\s" contained "subi subiu
syn match	mipsPseudoInstruction	"\<blti\ze\s" contained
syn match	mipsPseudoInstruction	"\<clear\ze\s" contained
" end of Pseudo Instructions }}}

" end of Pseudo things }}}

" Highlights Linking {{{
syn cluster	dascRegister		add=mipsRegister
hi def link	mipsRegister		Identifier

syn cluster	dascInstruction		add=mipsInstruction,mipsAlias,mipsMacro,mipsPseudoInstruction
hi def link	mipsAlias		Statement
hi def link	mipsMacro		Statement
hi def link	mipsPseudoInstruction	Statement
hi def link	mipsInstruction		Statement

" end of Hightlights Linking }}}

" vim: ts=8:fdm=marker:ff=unix:foldopen=all:foldclose=all
