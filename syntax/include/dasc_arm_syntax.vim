" Vim syntax file
" Language:		ARM
" Original Author:	ARM9
" Original Homepage:	https://github.com/ARM9/arm-syntax-vim
" License:		Redistribute under the same terms as Vim itself
" Purpose:		ARM Assembly Syntax Highlighting
" Major portions taken verbatim or adapted from the arm*.vim syntax files,
" see: https://github.com/ARM9/arm-syntax-vim/tree/master/syntax

" Base syntax {{{

" Decimal.
" Avoid numbers highlight inside control flow instructions.
" XXX: Exclude [><]\d pattern from whole dasc.
" Exceptions from the rule:
" * the first \.(el)?if before [><]\d (.if SMTH <5)
" * <<|>>\d (1<<5)
" See https://github.com/Buristan/vim-syntax-dynasm/issues/1.
syn match	armNumber		"\(\(\.\(el\)\?if[^\.]*\)\@<!\([^<]<\|[^>]>\)\)\@<![^_a-zA-Z0-9><]\zs[#\$]\?[-+]\?\d\+\>" contained
" Hex.
syn match	armNumber		"[^_a-zA-Z0-9]\zs[#\$]\?[-+]\?0x\x\+\>" contained
" Bin.
syn match	armNumber		"[^_a-zA-Z0-9]\zs[#\$]\?[-+]\?0b[01]\+\>" contained
" Floats.
syn match	armNumber		"[^_a-zA-Z0-9]\zs\%(\d\+\.\d*\|\d*\.\d\+\)\%([eE]\?[-+]\?\d\+\)\?\>" contained

" Registers.
syn match	armRegister		"\<r\%(1[0-5]\|[0-9]\)\>" contained
syn match	armRegister		"\<c\%(1[0-5]\|[0-9]\)\>" contained
syn match	armRegister		"\<p\%(1[0-5]\|[0-9]\)\>" contained
syn match	armRegister		"\<d\%(1[0-5]\|[0-9]\)\>" contained
syn match	armRegister		"\<s\%(3[0-2]\|[1-2]\?[0-9]\)\>" contained
syn keyword	armRegister		fp sp lr pc spsr cpsr cpsr_c cpsr_cxsf bp contained
syn match	armRegister		"\<a[1-3]\>" contained
syn match	armRegister		"\<v[1-8]\>" contained

" Conditional field to avoid repetition.
let s:armCond = '\%(al\|cc\|cs\|eq\|ge\|gt\|hi\|hs\|le\|lo\|ls\|lt\|mi\|ne\|pl\|vc\|vs\)\?'
" end of Base syntax }}}

" ARM v4 and thumb instructions {{{
exec 'syn match armv4Instr "\<\%(adc\|add\|and\|asr\|bic\|eor\|lsl\|lsr\|mla\|mov\|mul\|mvn\|neg\|orr\|ror\|rrx\|rsb\|rsc\|sbc\|smlal\|smull\|sub\|umlal\|umull\)' . s:armCond . 's\?\>\ze\s" contained'

exec 'syn match armv4InstrCond  "\<\%(b\|bl\|bx\|cdp\|cmn\|cmp\|ldc\|mcr\|mrc\|mrs\|msr\|nop\|pop\|push\|stc\|swi\|teq\|tst\)' . s:armCond . '\>\ze\s" contained'

exec 'syn match armv4InstrCond  "\<adr' . s:armCond . 'l\?\>" contained'

exec 'syn match armv4LDR    "\<\%(ldr\)' . s:armCond . '\%(b\?t\?\|h\|s[bh]\)\?\>\ze\s" contained'
exec 'syn match armv4STR    "\<\%(str\)' . s:armCond . '\%(b\?t\?\|h\)\?\>\ze\s" contained'
exec 'syn match armv4Stack  "\<\%(ldm\|stm\)' . s:armCond . '\%([id][ba]\|[ef][da]\)\>\ze\s" contained'
exec 'syn match armv4SWP    "\<swp' . s:armCond . 'b\?\>\ze\s" contained'
" end of ARM v4 and thumb instructions }}}

" ARM v5 instructions {{{
exec 'syn match armv5InstrCond "\<\%(blx\|clz\|mcrr\|mrrc\|qadd\|qsub\|qdadd\|qdsub\)' . s:armCond . '\>\ze\s" contained'
syn match armv5InstrNoCond "\<\%(bkpt\|cdp2\|ldc2\|mcr2\|mrc2\|pld\|stc2\)\>\ze\s" contained
exec 'syn match armv5Mul "\<\%(smla\|smlal\|smlaw\|smul\|smulw\)[bt][bt]\?' . s:armCond . '\>\ze\s" contained'

exec 'syn match armv5LDR    "\<\%(ldr\)' . s:armCond . 'd\>\ze\s" contained'
exec 'syn match armv5STR    "\<\%(str\)' . s:armCond . 'd\>\ze\s" contained'
" end of ARM v5 instructions }}}

" ARM v6 instructions {{{
exec 'syn match armv6Instr "\<\%(sh\?\|q\|u[qh]\?\)\%(add16\|sub16\|add8\|sub8\|asx\|sax\)' . s:armCond . '\>\ze\s" contained'

exec 'syn match armv6Instr "\<\%(usad8\|usada8\|ssat\|ssat16\|usat\|usat16\)' . s:armCond . '\>\ze\s" contained'

exec 'syn match armv6Instr "\<\%(movt\|movw\|mra\|mar\|orn\|bfc\|bfi\|sbfx\|ubfx\)' . s:armCond . '\>\ze\s"'

exec 'syn match armv6Instr "\<\%(pkhbt\|pkhtb\|sxth\|sxtb16\|sxtb\|sxtah\|sxtab16\|sxtab\|uxth\|uxtb\|uxtb16\|uxtah\|uxtab16\|uxtab\|rbit\|rev\|rev16\|revsh\|sel\)' . s:armCond . '\>\ze\s" contained'

exec 'syn match armv6Mul "\<\%(umaal\|smuad\|smlad\|smlald\|smusd\|smlsd\|smlsld\|smmul\|smmla\|smmls\)' . s:armCond . '\>\ze\s" contained'

exec 'syn match armv6LDR "\<\%(ldrex[hbd]\)' . s:armCond . '\>\ze\s" contained'
exec 'syn match armv6STR "\<\%(strex[hbd]\|clrex\)' . s:armCond . '\>\ze\s" contained'

syn match armv6InstrNoCond "\<\%(it[te]\{0,3\}\|cbn\?z\|tbb\|tbh\|cpsid\|cpsie\|cps\|setend\|srs\%(ia\|ib\|da\|db\)\|rfe\%(ia\|ib\|da\|db\)\)\>\ze\s" contained
syn keyword armv6InstrNoCond mrrc2 mcrr2 contained
" end of ARM v6 instructions }}}

" ARM v7 instructions.
exec 'syn match armv7Instr "\<\%(dbg\|dmb\|dsb\|isb\|sev\|wfe\|wfi\|yield\)' . s:armCond . '\>\ze\s" contained'

" VFP/NEON {{{

" VFP/NEON registers.
syn match armv6Register "\<[sd]\%(3[01]\|[12]\?[0-9]\)\>\ze\s" contained
syn match armv6Register "\<q\%(1[0-5]\|[0-9]\)\>\ze\s" contained

let s:neonDatatype = '\%(\.[isu]\?\%(8\|16\|32\|64\)\|\.f32\|\.f64\)\?\ze\s'

exec 'syn match armVfpInstr "\<\%(fmul\|fnmul\|fmac\|fnmac\|fmsc\|fnmsc\|fadd\|fsub\|fdiv\|fcpy\|fabs\|fneg\|fsqrt\|fcmpe\?z\?\|fcmpz\|fcvtd\|fcvts\|fuito\|fsito\|ftouiz\?\|ftosiz\?\|fst\|fld\|fto\%(sh\|sl\|uh\|ul\)\|f\%(sh\|sl\|uh\|ul\)to\)[sd]' . s:armCond . '\>\ze\s" contained'

exec 'syn match armVfpInstr "\<\%(fmsr\|fmrs\|fmdlr\|fmrdl\|fmdhr\|fmrdh\|fmxr\|fmrx\|fmstat\|fconst\)' . s:armCond . '\>\ze\s" contained'

exec 'syn match armVfpInstr "\<\%(fstmia\|fstmdb\|fldmia\|fldmdb\)[sdx]' . s:armCond . '\>\ze\s" contained'

exec 'syn match armVfpInstr "\<\%(vmul\|vnmul\|vmla\|vmls\|vnmls\|vnmla\|vadd\|vsub\|vdiv\|vabs\|vneg\|vsqrt\|vcmpe\?\|vcvt[tb]\?\|vmov\|vmsr\|vmrs\|vstr\|vstm\%(db\|ia\|ea\|fd\)\?\|vpush\|vldr\|vldm\%(db\|ia\|ea\|fd\)\?\|vpop\)' . s:armCond . '\>\ze\s" contained'

exec 'syn match armNeonInstr "\<\%(vaba\|vabd\|vabs\|vacge\|vacgt\|vacle\|vaclt\|vadd\|vaddhn\|vand\|vbic\|vbif\|vbit\|vbsl\|vceq\|vcle\|vclt\|vcge\|vcgt\|vcls\|vclz\|vcnt\|vcvtr\?\|vdup\|veor\|vext\|vhadd\|vhsub\|vld[1234]\|vmax\|vmin\|vmla\|vmls\|vmov\|vmovl\|vmvn\|vqmovn\|vqmovun\|vmul\|vmla\|vmls\|vmull\|vmlal\|vmlsl\|vqabs\|vqneg\|vorn\|vorr\|vpadd\|vpadal\|vpmax\|vpmin\|vqadd\|vqdmlal\|vqdmlsl\|vqdmull\|vqdmul\|vqdmulh\|vqrdmulh\|vqrshl\|vqrshr\|vrshl\|vqshrun\|vqshl\|vqshr\|vqsub\|vraddh\|vraddhn\|vrsubhn\|vrecpe\|vrecps\|vrsqrte\|vrsqrts\|vqshlu\|vshll\|vrev\|vrhadd\|vrshr\|vrsra\|vrshrn\|vrsubh\|vshl\|vshr\|vqshrn\|vqrshrn\|vqrshrun\|vsli\|vsra\|vsri\|vst[1234]\|vaddl\|vaddw\|vsubl\|vsubw\|vsubh\|vsubhn\|vswp\|vtbl\|vtbx\|vtrn\|vtst\|vuzp\|vzip\)' . s:armCond . s:neonDatatype . '\>\ze\s" contained'
unlet s:neonDatatype
" end of VFP/NEON }}}

" Linking {{{
syn cluster	dascInstruction		add=armv4Instr,armv4InstrCond,armv4InstrNoCond,armv4LDR,armv4STR,armv4Stack,armv4SWP,armv5InstrCond,armv5InstrNoCond,armv5Mul,armv5LDR,armv5STR,armv6Instr,armv6InstrNoCond,armv6Mul,armv6LDR,armv6STR,armv7Instr,armVfpInstr,armNeonInstr,armNumericOp,armRelative

hi def link	armv4Instr		armInstructions
hi def link	armv4InstrCond		armInstructions
hi def link	armv4InstrNoCond	armInstructions
hi def link	armv4LDR		armInstructions
hi def link	armv4STR		armInstructions
hi def link	armv4Stack		armInstructions
hi def link	armv4SWP		armInstructions

hi def link	armv5InstrCond		armInstructions
hi def link	armv5InstrNoCond	armInstructions
hi def link	armv5Mul		armInstructions
hi def link	armv5LDR		armInstructions
hi def link	armv5STR		armInstructions

hi def link	armv6Instr		armInstructions
hi def link	armv6InstrNoCond	armInstructions
hi def link	armv6Mul		armInstructions
hi def link	armv6LDR		armInstructions
hi def link	armv6STR		armInstructions

hi def link	armv7Instr		armInstructions
hi def link	armVfpInstr		armInstructions
hi def link	armNeonInstr		armInstructions

" Link to standard syn groups so the 'colorschemes' work.
hi def link	armInstructions		Statement

syn cluster	dascOperator		add=armNumericOp,armRelative,armOperator

hi def link	armNumericOp		armOperator
hi def link	armRelative		armOperator

hi def link	armOperator		Operator

syn cluster	dascNumber		add=armNumber
hi def link	armNumber		Number

syn cluster	dascRegister		add=armRegister
hi def link	armRegister		Identifier
" end of Linking }}}

" vim: ts=8:fdm=marker:ff=unix:foldopen=all:foldclose=all
