" Vim syntax file
" Language:		AARCH64
" Original Author:	Saleem Abdulrasool <compnerd@compnerd.org>
" Original Homepage:	http://github.com/compnerd/arm64asm
" License:		Redistribute under the same terms as Vim itself
" Purpose:		ARM64 Assembly Syntax Highlighting
" Major portions taken verbatim or adapted from the arm64asm.vim syntax file,
" see: https://github.com/compnerd/arm64asm-vim/blob/master/syntax/arm64asm.vim

" Modifiers {{{
syn match	AArch64Modifier		":lo12:" contained
syn match	AArch64Modifier		":abs_g3:" contained
syn match	AArch64Modifier		":abs_g2:" contained
syn match	AArch64Modifier		":abs_g2_s:" contained
syn match	AArch64Modifier		":abs_g2_nc:" contained
syn match	AArch64Modifier		":abs_g1:" contained
syn match	AArch64Modifier		":abs_g1_s:" contained
syn match	AArch64Modifier		":abs_g1_nc:" contained
syn match	AArch64Modifier		":abs_g0:" contained
syn match	AArch64Modifier		":abs_g0_s:" contained
syn match	AArch64Modifier		":abs_g0_nc:" contained
syn match	AArch64Modifier		":dtprel_g2:" contained
syn match	AArch64Modifier		":dtprel_g1:" contained
syn match	AArch64Modifier		":dtprel_g1_nc:" contained
syn match	AArch64Modifier		":dtprel_g0:" contained
syn match	AArch64Modifier		":dtprel_g0_nc:" contained
syn match	AArch64Modifier		":dtprel_hi12:" contained
syn match	AArch64Modifier		":dtprel_lo12:" contained
syn match	AArch64Modifier		":dtprel_lo12_nc:" contained
syn match	AArch64Modifier		":tprel_g2:" contained
syn match	AArch64Modifier		":tprel_g1:" contained
syn match	AArch64Modifier		":tprel_g1_nc:" contained
syn match	AArch64Modifier		":tprel_g0:" contained
syn match	AArch64Modifier		":tprel_g0_nc:" contained
syn match	AArch64Modifier		":tprel_hi12:" contained
syn match	AArch64Modifier		":tprel_lo12:" contained
syn match	AArch64Modifier		":tprel_lo12_nc:" contained
syn match	AArch64Modifier		":tlsdesc:" contained
syn match	AArch64Modifier		":tlsdesc_lo12:" contained
syn match	AArch64Modifier		":got:" contained
syn match	AArch64Modifier		":got_lo12:" contained
syn match	AArch64Modifier		":gottprel:" contained
syn match	AArch64Modifier		":gottprel_lo12:" contained
syn match	AArch64Modifier		":gottprel_g1:" contained
syn match	AArch64Modifier		":gottprel_g0_nc:" contained

syn match	AArch64Modifier		"@PAGE" contained
syn match	AArch64Modifier		"@PAGEOFF" contained
" end of Modifiers }}}

" Instructions {{{
syn match	AArch64Mnemonic		"\<\(adc\|adcs\|add\|adds\|adr\|adrp\|and\|ands\|asr\|asrv\|at\)\>\ze\s" contained

syn match	AArch64Mnemonic		"\<\(beq\|bne\|bcs\|bhs\|bcc\|blo\|bmi\|bpl\|bvs\|bvc\|bhi\|bls\)\>\ze\s" contained
syn match	AArch64Mnemonic		"\<\(bge\|blt\|bgt\|ble\|bal\|bnv\)\>\ze\s" contained
syn match	AArch64Mnemonic		"\<\(b.eq\|b.ne\|b.cs\|b.hs\|b.cc\|b.lo\|b.mi\|b.pl\|b.vs\|b.vc\)\>\ze\s" contained
syn match	AArch64Mnemonic		"\<\(b.hi\|b.ls\|b.ge\|b.lt\|b.gt\|b.le\|b.al\|b.nv\)\>\ze\s" contained
syn match	AArch64Mnemonic		"\<\(b\|bfi\|bfm\|bfxil\|bic\|bics\|bl\|blr\|br\|brk\)\>\ze\s" contained

syn keyword	AArch64Cond		eq ne cs hs cc lo mi pl vs vc contained
syn keyword	AArch64Cond		hi ls ge lt gt le al nv contained

syn match	AArch64Mnemonic		"\<\(cbnz\|cbz\|ccmn\|cinc\|cinv\|clrex\|cls\|clz\|cmn\|cmp\)\>\ze\s" contained
syn match	AArch64Mnemonic		"\<\(cneg\|crc32b\|crc32h\|crc32w\|crc32x\|crc32cb\|crc32ch\)\>\ze\s" contained
syn match	AArch64Mnemonic		"\<\(crc32cw\|crc32cx\)\>\ze\s" contained
syn match	AArch64Mnemonic		"\<\(csel\|cset\|csinc\|csinv\|csneg\)\>\ze\s" contained

syn match	AArch64Mnemonic		"\<\(dc\|dcps1\|dcps2\|dcp3\|dmb\|drps\|dsb\)\>\ze\s" contained

syn match	AArch64Mnemonic		"\<\(eon\|eor\|eret\|extr\)\>\ze\s" contained

syn match	AArch64Mnemonic		"\<\(hint\|hlt\|hvc\)\>\ze\s" contained

syn match	AArch64Mnemonic		"\<\(ic\|isb\)\>\ze\s" contained

syn match	AArch64Mnemonic		"\<\(ldar\|ldarb\|ldarh\|ldaxp\|ldaxr\|ldaxrb\|ldaxrh\|ldnp\)\>\ze\s" contained
syn match	AArch64Mnemonic		"\<\(ldp\|ldpsw\|ldr\|ldrb\|ldrh\|ldrsh\|ldrsw\|ldtr\|ldtrb\)\>\ze\s" contained
syn match	AArch64Mnemonic		"\<\(ldtrh\|ldtrsb\|ldtrsh\|ldtrsw\|ldur\|ldurb\|ldurh\)\>\ze\s" contained
syn match	AArch64Mnemonic		"\<\(ldursb\|ldursh\|ldursw\|ldxp\|ldxr\|ldxrb\|ldxrh\|lsl\)\>\ze\s" contained
syn match	AArch64Mnemonic		"\<\(lslv\|lsr\|lsrv\)\>\ze\s" contained

syn match	AArch64Mnemonic		"\<\(madd\|mneg\|mov\|movk\|movn\|movz\|mrs\|msub\|mul\|mvn\)\>\ze\s" contained

syn match	AArch64Mnemonic		"\<\(negs\|ngc\|ngcs\|nop\)\>\ze\s" contained

syn match	AArch64Mnemonic		"\<\(orn\|orr\)\>\ze\s" contained

syn match	AArch64Mnemonic		"\<\(prfm\|prfum\)\>\ze\s" contained

syn match	AArch64Mnemonic		"\<\(rbit\|ret\|rev\|rev16\|rev32\|ror\|rorv\)\>\ze\s" contained

syn match	AArch64Mnemonic		"\<\(sbc\|sbcs\|sbfiz\|sbfm\|sbfx\|sdiv\|sev\|sevl\|smaddl\)\>\ze\s" contained
syn match	AArch64Mnemonic		"\<\(smc\|smnegl\|smsubl\|smulh\|smull\|stlr\|stlrb\|stlrh\)\>\ze\s" contained
syn match	AArch64Mnemonic		"\<\(stlxp\|stlxr\|stlxrb\|stlxrh\|xtnp\|stp\|str\|strb\|strh\)\>\ze\s" contained
syn match	AArch64Mnemonic		"\<\(stttr\|sttrb\|sttrh\|stur\|sturb\|sturh\|stxp\|stxr\)\>\ze\s" contained
syn match	AArch64Mnemonic		"\<\(stxrb\|stxrh\|sub\|subs\|svc\|sxtb\|sxth\|sxtw\|sys\|sysl\)\>\ze\s" contained

syn match	AArch64Mnemonic		"\<\(tbnz\|tbz\|tlbi\|tst\)\>\ze\s" contained

syn match	AArch64Mnemonic		"\<\(ubfiz\|ubfm\|ubfx\|udiv\|umaddl\|umnegl\|umsubl\|umulh\)\>\ze\s" contained
syn match	AArch64Mnemonic		"\<\(umull\|uxtb\|uxth\)\>\ze\s" contained

syn match	AArch64Mnemonic		"\<\(wfe\|wfi\)\>\ze\s" contained

syn match	AArch64Mnemonic		"\<\(yield\)\>\ze\s" contained

syn match	AArch64Mnemonic		"\<\(abs\|add\|addhn\|addhn2\|addp\|addv\|aesd\|aese\|aesimc\)\>\ze\s" contained
syn match	AArch64Mnemonic		"\<\(aesmc\|and\)\>\ze\s" contained

syn match	AArch64Mnemonic		"\<\(bic\|bif\|bit\|bsl\)\>\ze\s" contained

syn match	AArch64Mnemonic		"\<\(ccmp\|cls\|clz\|cmeq\|cmge\|cmgt\|cmhi\|cmhs\|cmle\|cmlt\|cmtst\)\>\ze\s" contained
syn match	AArch64Mnemonic		"\<\(cnt\)\>\ze\s" contained

syn match	AArch64Mnemonic		"\<\(dup\)\>\ze\s" contained

syn match	AArch64Mnemonic		"\<\(eor\|ext\)\>\ze\s" contained

syn match	AArch64Mnemonic		"\<\(fabd\|fabs\|facge\|facgt\|fadd\|faddp\|fccmp\|fccmpe\)\>\ze\s" contained
syn match	AArch64Mnemonic		"\<\(fcmeq\|fcmge\|fcmgt\|fcmle\|fcmlt\|fcmp\|fcmpe\|fcsel\)\>\ze\s" contained
syn match	AArch64Mnemonic		"\<\(fcvt\|fcvtas\|fcvtau\|fcvtl\|fcvtl2\|fcvtns\|fcvtnu\)\>\ze\s" contained
syn match	AArch64Mnemonic		"\<\(fcvtps\|fcvtpu\|fcvtxn\|fcvtxn2\|fcvtzs\|fcvtzu\|fdiv\)\>\ze\s" contained
syn match	AArch64Mnemonic		"\<\(fmadd\|fmax\|fmaxnm\|fmaxmp\|fmaxnmv\|fmaxp\|fmaxv\|fmin\)\>\ze\s" contained
syn match	AArch64Mnemonic		"\<\(fminnm\|fminnmp\|fminnmv\|fminp\|fminv\|fmla\|fmls\|fmov\)\>\ze\s" contained
syn match	AArch64Mnemonic		"\<\(fmsub\|fmul\|fmulx\|fneg\|fnmadd\|fnmsub\|fnmul\|frecpe\)\>\ze\s" contained
syn match	AArch64Mnemonic		"\<\(frecps\|frecpx\|frinta\|frinti\|frintm\|frintn\|frintp\)\>\ze\s" contained
syn match	AArch64Mnemonic		"\<\(frintx\|frintx\|frintz\|frsqrte\|frsqrts\|fsqrt\|fsub\)\>\ze\s" contained

syn match	AArch64Mnemonic		"\<\(ins\)\>\ze\s" contained

syn match	AArch64Mnemonic		"\<\(ld1\|ld1r\|ld2\|ld2r\|ld3\|ld3r\|ld4\|ld4r\|ldnp\|ldp\|ldr\)\>\ze\s" contained
syn match	AArch64Mnemonic		"\<\(ldur\)\>\ze\s" contained

syn match	AArch64Mnemonic		"\<\(mla\|mls\|mov\|movi\|mul\|mvn\|mvni\)\>\ze\s" contained

syn match	AArch64Mnemonic		"\<\(neg\|not\)\>\ze\s" contained

syn match	AArch64Mnemonic		"\<\(orn\|orr\)\>\ze\s" contained

syn match	AArch64Mnemonic		"\<\(pmul\|pmull\|pmull2\)\>\ze\s" contained

syn match	AArch64Mnemonic		"\<\(rbit\|rev16\|rev32\|rev64\|rshrn\|rshrn2\|rsubhn\)\>\ze\s" contained
syn match	AArch64Mnemonic		"\<\(rsubhn2\)\>\ze\s" contained

syn match	AArch64Mnemonic		"\<\(saba\|sabal\|sabal2\|sabd\|sabdl\|sabdl2\|sadalp\|saddl\)\>\ze\s" contained
syn match	AArch64Mnemonic		"\<\(saddl2\|saddlp\|saddlv\|saddw\|saddw2\|scvtf\|sha1c\)\>\ze\s" contained
syn match	AArch64Mnemonic		"\<\(sha1h\|sha1m\|sha1p\|sha1su0\|sha1su1\|sha256h2\)\>\ze\s" contained
syn match	AArch64Mnemonic		"\<\(sha256h\|sha256su0\|sha256su1\|shadd\|shl\|shll\|shll2\)\>\ze\s" contained
syn match	AArch64Mnemonic		"\<\(shrn\|shrn2\|shsub\|sli\|smax\|smaxp\|smaxv\|smin\|sminp\)\>\ze\s" contained
syn match	AArch64Mnemonic		"\<\(sminv\|smlal\|smlal2\|smlsl\|smlsl2\|smov\|smull\|smull2\)\>\ze\s" contained
syn match	AArch64Mnemonic		"\<\(sqabs\|sqadd\|sqdmlal\|sqdmlal2\|sqdmlsl\|sqdmlsl2\)\>\ze\s" contained
syn match	AArch64Mnemonic		"\<\(sqdmulh\|sqdmull\|sqdmull2\|sqneg\|sqrdmulh\|sqrshl\)\>\ze\s" contained
syn match	AArch64Mnemonic		"\<\(sqrshrn\|sqrshrn2\|sqshl\|sqshlu\|sqshrn\|sqshrn2\)\>\ze\s" contained
syn match	AArch64Mnemonic		"\<\(sqsub\|sqxtn\|sqxtn2\|sqxtun\|sqxtun2\|shradd\|sri\)\>\ze\s" contained
syn match	AArch64Mnemonic		"\<\(srshl\|srshr\|srsra\|sshl\|sshll\|sshll2\|sshhr\|ssra\)\>\ze\s" contained
syn match	AArch64Mnemonic		"\<\(ssubl\|ssubl2\|ssubw\|ssubw2\|st1\|st2\|st3\|st4\|stnp\)\>\ze\s" contained
syn match	AArch64Mnemonic		"\<\(stp\|str\|stur\|sub\|subhn\|subhn2\|suqadd\|sxtl\)\>\ze\s" contained

syn match	AArch64Mnemonic		"tbl\|tbx\|trn1\|trn2" contained

syn match	AArch64Mnemonic		"\<\(uaba\|uabal\|uabal2\|uabd\|uabdl\|uabdl2\|uadalp\|uaddl\)\>\ze\s" contained
syn match	AArch64Mnemonic		"\<\(uaddl2\|uaddlp\|uaddlv\|uaddw\|uaddw2\|ucvtf\|uhadd\)\>\ze\s" contained
syn match	AArch64Mnemonic		"\<\(uhsub\|umax\|umaxp\|umaxv\|umin\|uminp\|uminv\|umlal\)\>\ze\s" contained
syn match	AArch64Mnemonic		"\<\(umlal2\|umlsl\|umlsl2\|umov\|umull\|umull2\|uqadd\)\>\ze\s" contained
syn match	AArch64Mnemonic		"\<\(uqrshl\|uqrshrn\|uqrshrn2\|uqshl\|uqshrn\|uqsub\|uqxtn\)\>\ze\s" contained
syn match	AArch64Mnemonic		"\<\(uqxtn2\|urecpe\|urhadd\|urshl\|urshr\|ursqrte\|ursra\)\>\ze\s" contained
syn match	AArch64Mnemonic		"\<\(ushl\|ushll\|ushll2\|ushr\|usqadd\|usra\|usubl\|usubl2\)\>\ze\s" contained
syn match	AArch64Mnemonic		"\<\(usubw\|usubw2\|uxtl\|uzp1\|uzp2\)\>\ze\s" contained

syn match	AArch64Mnemonic		"\<xtn2\?\>\ze\s" contained

syn match	AArch64Mnemonic		"\<zip[12]\>\ze\s" contained
" end of Instructions }}}

" Numbers {{{
" Decimal.
" Avoid numbers highlight inside control flow instructions.
" XXX: Exclude [><]\d pattern from whole dasc.
" Exceptions from the rule:
" * the first \.(el)?if before [><]\d (.if SMTH <5)
" * <<|>>\d (1<<5)
" See https://github.com/Buristan/vim-syntax-dynasm/issues/1.
syn match	AArch64Number		"\(\(\.\(el\)\?if[^\.]*\)\@<!\([^<]<\|[^>]>\)\)\@<![^_a-zA-Z0-9]\zs[#\$]\?[-+]\?\d\+\>" contained
" Hex.
syn match	AArch64Number		"[^_a-zA-Z0-9]\zs[#\$]\?[-+]\?0x\x\+\>" contained
" Bin.
syn match	AArch64Number		"[^_a-zA-Z0-9]\zs[#\$]\?[-+]\?0b[01]\+\>" contained
" Floats.
syn match	AArch64Number		"[^_a-zA-Z0-9]\zs\%(\d\+\.\d*\|\d*\.\d\+\)\%([eE]\?[-+]\?\d\+\)\?\>" contained
" end of Numbers }}}

" Registers {{{
let b:i = 0
while b:i < 32
  exec 'syn match AArch64Register "\<w'.b:i.'\>" contained'
  exec 'syn match AArch64Register "\<x'.b:i.'\>" contained'
  exec 'syn match AArch64Register "\<v'.b:i.'\>" contained'
  exec 'syn match AArch64Register "\<q'.b:i.'\>" contained'
  exec 'syn match AArch64Register "\<d'.b:i.'\>" contained'
  exec 'syn match AArch64Register "\<s'.b:i.'\>" contained'
  let b:i += 1
endwhile
unlet b:i

syn match	AArch64Register		"\<wzr\>" contained
syn match	AArch64Register		"\<xzr\>" contained

syn match	AArch64Register		"\<lr\>" contained
syn match	AArch64Register		"\<sp\>" contained
syn match	AArch64Register		"\<pc\>" contained
syn match	AArch64Register		"\<pstate\>" contained
" end of Registers }}}

" Types {{{
syn match	AArch64Type		/[@%]function/ contained
syn match	AArch64Type		/[@%]object/ contained
syn match	AArch64Type		/[@%]tls_object/ contained
syn match	AArch64Type		/[@%]common/ contained
syn match	AArch64Type		/[@%]notype/ contained
syn match	AArch64Type		/[@%]gnu_unique_object/ contained
" end of Types }}}

" Links {{{
syn cluster	dascInstruction 	add=AArch64Cond,AArch64Mnemonic
hi def link	AArch64Cond		Statement
hi def link	AArch64Mnemonic		Statement

" Don't know is it supported by dynasm.
" hi def link AArch64Modifier	Special

syn cluster	dascNumber		add=AArch64Number
hi def link	AArch64Number		Number

syn cluster	dascRegister		add=AArch64Register
hi def link	AArch64Register		Identifier

" Don't know is it supported by dynasm.
" hi def link	AArch64Type		Tag
" end of Links }}}

" vim: ts=8:fdm=marker:ff=unix:foldopen=all:foldclose=all
