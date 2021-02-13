" Vim syntax file
" Language:		assembler for X86 X64
" Original Maintainer:	Rene Koecher <info@bitspin.org>
" Origianl Homepage:	https://github.com/Shirk/vim-gas
" Original Last Change:	2019 Sep 12
" Original Version:	0.14
" Original License:	BSD (3 clause), see Original Homepage
" License:		Redistribute under the same terms as Vim itself
" Purpose:		X86 and X64 Assembly Syntax Highlighting
" Remark:		Intel and AVR compatible instructions only (for now)
" Major portions taken verbatim or adapted from the gas.vim syntax file,
" see: https://github.com/Shirk/vim-gas/blob/master/syntax/gas.vim

" Types.
syn keyword	gasType			byte word aword dword qword oword

" Registers {{{

" i*86 register set.
syn keyword	gasRegisterX86		rax rbx rcx rdx rdi rsi rsp rbp contained
syn keyword	gasRegisterX86		eax ebx ecx edx ax bx cx dx ah al bh bl ch cl dh dl contained
syn keyword	gasRegisterX86		edi esi esp ebp di si sp bp sph spl bph bpl contained
syn keyword	gasRegisterX86		cs ds es fs gs ss ip eip rip eflags contained
syn match	gasRegisterX86		/\<r\([8-9]\|1[0-5]\)[lwd]\?\>/ contained

" i*86 special registers.
syn match	gasRegisterX86Cr	/\<cr[0-8]\>/ contained
syn match	gasRegisterX86Dr	/\<dr[0-8]\>/ contained
syn match	gasRegisterX86Tr	/\<tr[0-8]\>/ contained
syn match	gasRegisterX86Fp	/\<sp\(([0-7])\)\?\>/ contained
syn match	gasRegisterX86MMX	/\<x\?mm[0-7]\>/ contained
syn match	gasRegisterX86SSE	/\<x\?mm[8-9]\>/ contained
syn match	gasRegisterX86SSE	/\<x\?mm1[0-5]\>/ contained
"end of Registers }}}

" Opcodes {{{

" Willamette MMX instructions (SSE2 SIMD Integer Instructions) {{{
syn match	gasOpcode_SSE2		"\<movd\ze\s" contained
syn match	gasOpcode_SSE2		"\<movdqa\ze\s" contained
syn match	gasOpcode_SSE2		"\<movdqu\ze\s" contained
syn match	gasOpcode_SSE2		"\<movdq2q\ze\s" contained
syn match	gasOpcode_X64_SSE2	"\<movq\ze\s" contained
syn match	gasOpcode_SSE2		"\<movq2dq\ze\s" contained
syn match	gasOpcode_SSE2		"\<packsswb\ze\s" contained
syn match	gasOpcode_SSE2		"\<packssdw\ze\s" contained
syn match	gasOpcode_SSE2		"\<packuswb\ze\s" contained
syn match	gasOpcode_SSE2		"\<paddb\ze\s" contained
syn match	gasOpcode_SSE2		"\<paddw\ze\s" contained
syn match	gasOpcode_SSE2		"\<paddd\ze\s" contained
syn match	gasOpcode_SSE2		"\<paddq\ze\s" contained
syn match	gasOpcode_SSE2		"\<paddsb\ze\s" contained
syn match	gasOpcode_SSE2		"\<paddsw\ze\s" contained
syn match	gasOpcode_SSE2		"\<paddusb\ze\s" contained
syn match	gasOpcode_SSE2		"\<paddusw\ze\s" contained
syn match	gasOpcode_SSE2		"\<pand\ze\s" contained
syn match	gasOpcode_SSE2		"\<pandn\ze\s" contained
syn match	gasOpcode_SSE2		"\<pavgb\ze\s" contained
syn match	gasOpcode_SSE2		"\<pavgw\ze\s" contained
syn match	gasOpcode_SSE2		"\<pcmpeqb\ze\s" contained
syn match	gasOpcode_SSE2		"\<pcmpeqw\ze\s" contained
syn match	gasOpcode_SSE2		"\<pcmpeqd\ze\s" contained
syn match	gasOpcode_SSE2		"\<pcmpgtb\ze\s" contained
syn match	gasOpcode_SSE2		"\<pcmpgtw\ze\s" contained
syn match	gasOpcode_SSE2		"\<pcmpgtd\ze\s" contained
syn match	gasOpcode_SSE2		"\<pextrw\ze\s" contained
syn match	gasOpcode_SSE2		"\<pinsrw\ze\s" contained
syn match	gasOpcode_SSE2		"\<pmaddwd\ze\s" contained
syn match	gasOpcode_SSE2		"\<pmaxsw\ze\s" contained
syn match	gasOpcode_SSE2		"\<pmaxub\ze\s" contained
syn match	gasOpcode_SSE2		"\<pminsw\ze\s" contained
syn match	gasOpcode_SSE2		"\<pminub\ze\s" contained
syn match	gasOpcode_SSE2		"\<pmovmskb\ze\s" contained
syn match	gasOpcode_SSE2		"\<pmulhuw\ze\s" contained
syn match	gasOpcode_SSE2		"\<pmulhw\ze\s" contained
syn match	gasOpcode_SSE2		"\<pmullw\ze\s" contained
syn match	gasOpcode_SSE2		"\<pmuludq\ze\s" contained
syn match	gasOpcode_SSE2		"\<por\ze\s" contained
syn match	gasOpcode_SSE2		"\<psadbw\ze\s" contained
syn match	gasOpcode_Base		"\<pshufd\ze\s" contained
syn match	gasOpcode_Base		"\<pshufhw\ze\s" contained
syn match	gasOpcode_Base		"\<pshuflw\ze\s" contained
syn match	gasOpcode_SSE2		"\<pslldq\ze\s" contained
syn match	gasOpcode_SSE2		"\<psllw\ze\s" contained
syn match	gasOpcode_SSE2		"\<pslld\ze\s" contained
syn match	gasOpcode_SSE2		"\<psllq\ze\s" contained
syn match	gasOpcode_SSE2		"\<psraw\ze\s" contained
syn match	gasOpcode_SSE2		"\<psrad\ze\s" contained
syn match	gasOpcode_SSE2		"\<psrldq\ze\s" contained
syn match	gasOpcode_SSE2		"\<psrlw\ze\s" contained
syn match	gasOpcode_SSE2		"\<psrld\ze\s" contained
syn match	gasOpcode_SSE2		"\<psrlq\ze\s" contained
syn match	gasOpcode_SSE2		"\<psubb\ze\s" contained
syn match	gasOpcode_SSE2		"\<psubw\ze\s" contained
syn match	gasOpcode_SSE2		"\<psubd\ze\s" contained
syn match	gasOpcode_SSE2		"\<psubq\ze\s" contained
syn match	gasOpcode_SSE2		"\<psubsb\ze\s" contained
syn match	gasOpcode_SSE2		"\<psubsw\ze\s" contained
syn match	gasOpcode_SSE2		"\<psubusb\ze\s" contained
syn match	gasOpcode_SSE2		"\<psubusw\ze\s" contained
syn match	gasOpcode_SSE2		"\<punpckhbw\ze\s" contained
syn match	gasOpcode_SSE2		"\<punpckhwd\ze\s" contained
syn match	gasOpcode_SSE2		"\<punpckhdq\ze\s" contained
syn match	gasOpcode_SSE2		"\<punpckhqdq\ze\s" contained
syn match	gasOpcode_SSE2		"\<punpcklbw\ze\s" contained
syn match	gasOpcode_SSE2		"\<punpcklwd\ze\s" contained
syn match	gasOpcode_SSE2		"\<punpckldq\ze\s" contained
syn match	gasOpcode_SSE2		"\<punpcklqdq\ze\s" contained
syn match	gasOpcode_SSE2		"\<pxor\ze\s" contained
" end of Willamette MMX instructions (SSE2 SIMD Integer Instructions) }}}

" Nehalem New Instructions (SSE4.2) {{{
syn match	gasOpcode_X64_SSE42	"\<crc32\ze\s" contained
syn match	gasOpcode_SSE42		"\<pcmpestri\ze\s" contained
syn match	gasOpcode_SSE42		"\<pcmpestrm\ze\s" contained
syn match	gasOpcode_SSE42		"\<pcmpistri\ze\s" contained
syn match	gasOpcode_SSE42		"\<pcmpistrm\ze\s" contained
syn match	gasOpcode_SSE42		"\<pcmpgtq\ze\s" contained
syn match	gasOpcode_NEHALEM_Base	"\<popcnt\ze\s" contained
" end of Nehalem New Instructions (SSE4.2) }}}

" Intel new instructions in ???
syn match	gasOpcode_NEHALEM_Base	"\<movbe\ze\s" contained

" Generic memory operations {{{
syn match	gasOpcode_KATMAI_Base	"\<prefetchnta\ze\s" contained
syn match	gasOpcode_KATMAI_Base	"\<prefetcht0\ze\s" contained
syn match	gasOpcode_KATMAI_Base	"\<prefetcht1\ze\s" contained
syn match	gasOpcode_KATMAI_Base	"\<prefetcht2\ze\s" contained
syn match	gasOpcode_KATMAI_Base	"\<sfence\ze\s" contained
" end of Generic memory operations }}}

" Tejas New Instructions (SSSE3) {{{
syn match	gasOpcode_Base		"\<pabsb\ze\s" contained
syn match	gasOpcode_Base		"\<pabsw\ze\s" contained
syn match	gasOpcode_Base		"\<pabsd\ze\s" contained
syn match	gasOpcode_Base		"\<palignr\ze\s" contained
syn match	gasOpcode_Base		"\<phaddw\ze\s" contained
syn match	gasOpcode_Base		"\<phaddd\ze\s" contained
syn match	gasOpcode_Base		"\<phaddsw\ze\s" contained
syn match	gasOpcode_Base		"\<phsubw\ze\s" contained
syn match	gasOpcode_Base		"\<phsubd\ze\s" contained
syn match	gasOpcode_Base		"\<phsubsw\ze\s" contained
syn match	gasOpcode_Base		"\<pmaddubsw\ze\s" contained
syn match	gasOpcode_Base		"\<pmulhrsw\ze\s" contained
syn match	gasOpcode_Base		"\<pshufb\ze\s" contained
syn match	gasOpcode_Base		"\<psignb\ze\s" contained
syn match	gasOpcode_Base		"\<psignw\ze\s" contained
syn match	gasOpcode_Base		"\<psignd\ze\s" contained
" Tejas New Instructions (SSSE3) }}}

" Willamette SSE2 Cacheability Instructions {{{
syn match	gasOpcode_SSE2		"\<maskmovdqu\ze\s" contained
syn match	gasOpcode_SSE2		"\<clflush\ze\s" contained
syn match	gasOpcode_SSE2		"\<movntdq\ze\s" contained
syn match	gasOpcode_X64_Base	"\<movnti\ze\s" contained
syn match	gasOpcode_SSE2		"\<movntpd\ze\s" contained
syn match	gasOpcode_SSE2		"\<lfence\ze\s" contained
syn match	gasOpcode_SSE2		"\<mfence\ze\s" contained
" Willamette SSE2 Cacheability Instructions }}}

" Systematic names for the hinting nop instructions {{{
let b:i = 0
while b:i < 63
  exec 'syn match gasOpcode_X64_Base "\<hint_nop'.b:i.'\>" contained'
  let b:i += 1
endwhile
unlet b:i
" end of Systematic names for the hinting nop instructions }}}

" XSAVE group (AVX and extended state) {{{
syn match	gasOpcode_NEHALEM_Base	"\<xgetbv\ze\s" contained
syn match	gasOpcode_NEHALEM_Base	"\<xsetbv\ze\s" contained
syn match	gasOpcode_NEHALEM_Base	"\<xsave\ze\s" contained
syn match	gasOpcode_NEHALEM_Base	"\<xrstor\ze\s" contained
" end of XSAVE group (AVX and extended state) }}}

" Conventional instructions {{{
syn match	gasOpcode_8086_Base	"\<aaa\ze\s" contained
syn match	gasOpcode_8086_Base	"\<aad\ze\s" contained
syn match	gasOpcode_8086_Base	"\<aam\ze\s" contained
syn match	gasOpcode_8086_Base	"\<aas\ze\s" contained
syn match	gasOpcode_386_Base	"\<adc\ze\s" contained
syn match	gasOpcode_386_Base	"\<add\ze\s" contained
syn match	gasOpcode_286_Base	"\<arpl\ze\s" contained
syn match	gasOpcode_PENT_Base	"\<bb0_reset\ze\s" contained
syn match	gasOpcode_PENT_Base	"\<bb1_reset\ze\s" contained
syn match	gasOpcode_386_Base	"\<bound\ze\s" contained
syn match	gasOpcode_X64_Base	"\<bsf\ze\s" contained
syn match	gasOpcode_X64_Base	"\<bsr\ze\s" contained
syn match	gasOpcode_X64_Base	"\<bswap\ze\s" contained
syn match	gasOpcode_X64_Base	"\<bt\ze\s" contained
syn match	gasOpcode_X64_Base	"\<btc\ze\s" contained
syn match	gasOpcode_X64_Base	"\<btr\ze\s" contained
syn match	gasOpcode_X64_Base	"\<bts\ze\s" contained
syn match	gasOpcode_X64_Base	"\<call\ze\s" contained
syn match	gasOpcode_8086_Base	"\<cbw\ze\s" contained
syn match	gasOpcode_386_Base	"\<cdq\ze\s" contained
syn match	gasOpcode_X64_Base	"\<cdqe\ze\s" contained
syn match	gasOpcode_8086_Base	"\<clc\ze\s" contained
syn match	gasOpcode_8086_Base	"\<cld\ze\s" contained
syn match	gasOpcode_X64_Base	"\<clgi\ze\s" contained
syn match	gasOpcode_8086_Base	"\<cli\ze\s" contained
syn match	gasOpcode_286_Base	"\<clts\ze\s" contained
syn match	gasOpcode_8086_Base	"\<cmc\ze\s" contained
syn match	gasOpcode_386_Base	"\<cmp\ze\s" contained
syn match	gasOpcode_8086_Base	"\<cmpsb\ze\s" contained
syn match	gasOpcode_386_Base	"\<cmpsd\ze\s" contained
syn match	gasOpcode_X64_Base	"\<cmpsq\ze\s" contained
syn match	gasOpcode_8086_Base	"\<cmpsw\ze\s" contained
syn match	gasOpcode_X64_Base	"\<cmpxchg\ze\s" contained
syn match	gasOpcode_486_Base	"\<cmpxchg486\ze\s" contained
syn match	gasOpcode_PENT_Base	"\<cmpxchg8b\ze\s" contained
syn match	gasOpcode_X64_Base	"\<cmpxchg16b\ze\s" contained
syn match	gasOpcode_PENT_Base	"\<cpuid\ze\s" contained
syn match	gasOpcode_PENT_Base	"\<cpu_read\ze\s" contained
syn match	gasOpcode_PENT_Base	"\<cpu_write\ze\s" contained
syn match	gasOpcode_X64_Base	"\<cqo\ze\s" contained
syn match	gasOpcode_8086_Base	"\<cwd\ze\s" contained
syn match	gasOpcode_386_Base	"\<cwde\ze\s" contained
syn match	gasOpcode_8086_Base	"\<daa\ze\s" contained
syn match	gasOpcode_8086_Base	"\<das\ze\s" contained
syn match	gasOpcode_X64_Base	"\<dec\ze\s" contained
syn match	gasOpcode_X64_Base	"\<div\ze\s" contained
syn match	gasOpcode_P6_Base	"\<dmint\ze\s" contained
syn match	gasOpcode_PENT_MMX	"\<emms\ze\s" contained
syn match	gasOpcode_186_Base	"\<enter\ze\s" contained
syn match	gasOpcode_8086_Base	"\<equ\ze\s" contained
syn match	gasOpcode_8086_Base	"\<f2xm1\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fabs\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fadd\ze\s" contained
syn match	gasOpcode_8086_Base	"\<faddp\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fbld\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fbstp\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fchs\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fclex\ze\s" contained
syn match	gasOpcode_P6_Base	"\<fcmovb\ze\s" contained
syn match	gasOpcode_P6_Base	"\<fcmovbe\ze\s" contained
syn match	gasOpcode_P6_Base	"\<fcmove\ze\s" contained
syn match	gasOpcode_P6_Base	"\<fcmovnb\ze\s" contained
syn match	gasOpcode_P6_Base	"\<fcmovnbe\ze\s" contained
syn match	gasOpcode_P6_Base	"\<fcmovne\ze\s" contained
syn match	gasOpcode_P6_Base	"\<fcmovnu\ze\s" contained
syn match	gasOpcode_P6_Base	"\<fcmovu\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fcom\ze\s" contained
syn match	gasOpcode_P6_Base	"\<fcomi\ze\s" contained
syn match	gasOpcode_P6_Base	"\<fcomip\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fcomp\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fcompp\ze\s" contained
syn match	gasOpcode_386_Base	"\<fcos\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fdecstp\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fdisi\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fdiv\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fdivp\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fdivr\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fdivrp\ze\s" contained
syn match	gasOpcode_8086_Base	"\<feni\ze\s" contained
syn match	gasOpcode_8086_Base	"\<ffree\ze\s" contained
syn match	gasOpcode_286_Base	"\<ffreep\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fiadd\ze\s" contained
syn match	gasOpcode_8086_Base	"\<ficom\ze\s" contained
syn match	gasOpcode_8086_Base	"\<ficomp\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fidiv\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fidivr\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fild\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fimul\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fincstp\ze\s" contained
syn match	gasOpcode_8086_Base	"\<finit\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fist\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fistp\ze\s" contained
syn match	gasOpcode_PRESCOTT_Base	"\<fisttp\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fisub\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fisubr\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fld\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fld1\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fldcw\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fldenv\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fldl2e\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fldl2t\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fldlg2\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fldln2\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fldpi\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fldz\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fmul\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fmulp\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fnclex\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fndisi\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fneni\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fninit\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fnop\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fnsave\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fnstcw\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fnstenv\ze\s" contained
syn match	gasOpcode_286_Base	"\<fnstsw\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fpatan\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fprem\ze\s" contained
syn match	gasOpcode_386_Base	"\<fprem1\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fptan\ze\s" contained
syn match	gasOpcode_8086_Base	"\<frndint\ze\s" contained
syn match	gasOpcode_8086_Base	"\<frstor\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fsave\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fscale\ze\s" contained
syn match	gasOpcode_286_Base	"\<fsetpm\ze\s" contained
syn match	gasOpcode_386_Base	"\<fsin\ze\s" contained
syn match	gasOpcode_386_Base	"\<fsincos\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fsqrt\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fst\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fstcw\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fstenv\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fstp\ze\s" contained
syn match	gasOpcode_286_Base	"\<fstsw\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fsub\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fsubp\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fsubr\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fsubrp\ze\s" contained
syn match	gasOpcode_8086_Base	"\<ftst\ze\s" contained
syn match	gasOpcode_386_Base	"\<fucom\ze\s" contained
syn match	gasOpcode_P6_Base	"\<fucomi\ze\s" contained
syn match	gasOpcode_P6_Base	"\<fucomip\ze\s" contained
syn match	gasOpcode_386_Base	"\<fucomp\ze\s" contained
syn match	gasOpcode_386_Base	"\<fucompp\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fxam\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fxch\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fxtract\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fyl2x\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fyl2xp1\ze\s" contained
syn match	gasOpcode_8086_Base	"\<hlt\ze\s" contained
syn match	gasOpcode_386_Base	"\<ibts\ze\s" contained
syn match	gasOpcode_386_Base	"\<icebp\ze\s" contained
syn match	gasOpcode_X64_Base	"\<idiv\ze\s" contained
syn match	gasOpcode_X64_Base	"\<imul\ze\s" contained
syn match	gasOpcode_386_Base	"\<in\ze\s" contained
syn match	gasOpcode_X64_Base	"\<inc\ze\s" contained
syn match	gasOpcode_Base		"\<incbin\ze\s" contained
syn match	gasOpcode_186_Base	"\<insb\ze\s" contained
syn match	gasOpcode_386_Base	"\<insd\ze\s" contained
syn match	gasOpcode_186_Base	"\<insw\ze\s" contained
syn match	gasOpcode_8086_Base	"\<int\ze\s" contained
syn match	gasOpcode_386_Base	"\<int01\ze\s" contained
syn match	gasOpcode_386_Base	"\<int1\ze\s" contained
syn match	gasOpcode_8086_Base	"\<int03\ze\s" contained
syn match	gasOpcode_8086_Base	"\<int3\ze\s" contained
syn match	gasOpcode_8086_Base	"\<into\ze\s" contained
syn match	gasOpcode_486_Base	"\<invd\ze\s" contained
syn match	gasOpcode_486_Base	"\<invlpg\ze\s" contained
syn match	gasOpcode_X86_64_Base	"\<invlpga\ze\s" contained
syn match	gasOpcode_8086_Base	"\<iret\ze\s" contained
syn match	gasOpcode_386_Base	"\<iretd\ze\s" contained
syn match	gasOpcode_X64_Base	"\<iretq\ze\s" contained
syn match	gasOpcode_8086_Base	"\<iretw\ze\s" contained
syn match	gasOpcode_8086_Base	"\<jcxz\ze\s" contained
syn match	gasOpcode_386_Base	"\<jecxz\ze\s" contained
syn match	gasOpcode_X64_Base	"\<jrcxz\ze\s" contained
syn match	gasOpcode_X64_Base	"\<jmp\ze\s" contained
syn match	gasOpcode_IA64_Base	"\<jmpe\ze\s" contained
syn match	gasOpcode_8086_Base	"\<lahf\ze\s" contained
syn match	gasOpcode_X64_Base	"\<lar\ze\s" contained
syn match	gasOpcode_386_Base	"\<lds\ze\s" contained
syn match	gasOpcode_X64_Base	"\<lea\ze\s" contained
syn match	gasOpcode_186_Base	"\<leave\ze\s" contained
syn match	gasOpcode_386_Base	"\<les\ze\s" contained
syn match	gasOpcode_X64_Base	"\<lfence\ze\s" contained
syn match	gasOpcode_386_Base	"\<lfs\ze\s" contained
syn match	gasOpcode_286_Base	"\<lgdt\ze\s" contained
syn match	gasOpcode_386_Base	"\<lgs\ze\s" contained
syn match	gasOpcode_286_Base	"\<lidt\ze\s" contained
syn match	gasOpcode_286_Base	"\<lldt\ze\s" contained
syn match	gasOpcode_286_Base	"\<lmsw\ze\s" contained
syn match	gasOpcode_386_Base	"\<loadall\ze\s" contained
syn match	gasOpcode_286_Base	"\<loadall286\ze\s" contained
syn match	gasOpcode_8086_Base	"\<lodsb\ze\s" contained
syn match	gasOpcode_386_Base	"\<lodsd\ze\s" contained
syn match	gasOpcode_X64_Base	"\<lodsq\ze\s" contained
syn match	gasOpcode_8086_Base	"\<lodsw\ze\s" contained
syn match	gasOpcode_X64_Base	"\<loop\ze\s" contained
syn match	gasOpcode_X64_Base	"\<loope\ze\s" contained
syn match	gasOpcode_X64_Base	"\<loopne\ze\s" contained
syn match	gasOpcode_X64_Base	"\<loopnz\ze\s" contained
syn match	gasOpcode_X64_Base	"\<loopz\ze\s" contained
syn match	gasOpcode_X64_Base	"\<lsl\ze\s" contained
syn match	gasOpcode_386_Base	"\<lss\ze\s" contained
syn match	gasOpcode_286_Base	"\<ltr\ze\s" contained
syn match	gasOpcode_X64_Base	"\<mfence\ze\s" contained
syn match	gasOpcode_PRESCOTT_Base	"\<monitor\ze\s" contained
syn match	gasOpcode_386_Base	"\<mov\ze\s" contained
syn match	gasOpcode_X64_SSE	"\<movd\ze\s" contained
syn match	gasOpcode_X64_MMX	"\<movq\ze\s" contained
syn match	gasOpcode_8086_Base	"\<movsb\ze\s" contained
syn match	gasOpcode_386_Base	"\<movsd\ze\s" contained
syn match	gasOpcode_X64_Base	"\<movsq\ze\s" contained
syn match	gasOpcode_8086_Base	"\<movsw\ze\s" contained
syn match	gasOpcode_X64_Base	"\<movsx\ze\s" contained
syn match	gasOpcode_X64_Base	"\<movsxd\ze\s" contained
syn match	gasOpcode_X64_Base	"\<movsx\ze\s" contained
syn match	gasOpcode_X64_Base	"\<movzx\ze\s" contained
syn match	gasOpcode_X64_Base	"\<movzbl\ze\s" contained
syn match	gasOpcode_X64_Base	"\<mul\ze\s" contained
syn match	gasOpcode_PRESCOTT_Base	"\<mwait\ze\s" contained
syn match	gasOpcode_X64_Base	"\<neg\ze\s" contained
syn keyword	gasOpcode_X64_Base	nop contained

" Exclude dasc preproc.
syn match	gasOpcode_X64_Base	"\(\.\(els\)\?if.*\|error\)\@<!\<\(not\|or\|and\)\ze\s" contained

syn match	gasOpcode_386_Base	"\<out\ze\s" contained
syn match	gasOpcode_186_Base	"\<outsb\ze\s" contained
syn match	gasOpcode_386_Base	"\<outsd\ze\s" contained
syn match	gasOpcode_186_Base	"\<outsw\ze\s" contained
syn match	gasOpcode_PENT_MMX	"\<packssdw\ze\s" contained
syn match	gasOpcode_PENT_MMX	"\<packsswb\ze\s" contained
syn match	gasOpcode_PENT_MMX	"\<packuswb\ze\s" contained
syn match	gasOpcode_PENT_MMX	"\<paddb\ze\s" contained
syn match	gasOpcode_PENT_MMX	"\<paddd\ze\s" contained
syn match	gasOpcode_PENT_MMX	"\<paddsb\ze\s" contained
syn match	gasOpcode_PENT_MMX	"\<paddsiw\ze\s" contained
syn match	gasOpcode_PENT_MMX	"\<paddsw\ze\s" contained
syn match	gasOpcode_PENT_MMX	"\<paddusb\ze\s" contained
syn match	gasOpcode_PENT_MMX	"\<paddusw\ze\s" contained
syn match	gasOpcode_PENT_MMX	"\<paddw\ze\s" contained
syn match	gasOpcode_PENT_MMX	"\<pand\ze\s" contained
syn match	gasOpcode_PENT_MMX	"\<pandn\ze\s" contained
syn match	gasOpcode_8086_Base	"\<pause\ze\s" contained
syn match	gasOpcode_PENT_MMX	"\<paveb\ze\s" contained
syn match	gasOpcode_PENT_MMX	"\<pcmpeqb\ze\s" contained
syn match	gasOpcode_PENT_MMX	"\<pcmpeqd\ze\s" contained
syn match	gasOpcode_PENT_MMX	"\<pcmpeqw\ze\s" contained
syn match	gasOpcode_PENT_MMX	"\<pcmpgtb\ze\s" contained
syn match	gasOpcode_PENT_MMX	"\<pcmpgtd\ze\s" contained
syn match	gasOpcode_PENT_MMX	"\<pcmpgtw\ze\s" contained
syn match	gasOpcode_PENT_MMX	"\<pdistib\ze\s" contained
syn match	gasOpcode_PENT_MMX	"\<pmachriw\ze\s" contained
syn match	gasOpcode_PENT_MMX	"\<pmaddwd\ze\s" contained
syn match	gasOpcode_PENT_MMX	"\<pmagw\ze\s" contained
syn match	gasOpcode_PENT_MMX	"\<pmulhriw\ze\s" contained
syn match	gasOpcode_PENT_MMX	"\<pmulhrwc\ze\s" contained
syn match	gasOpcode_PENT_MMX	"\<pmulhw\ze\s" contained
syn match	gasOpcode_PENT_MMX	"\<pmullw\ze\s" contained
syn match	gasOpcode_PENT_MMX	"\<pmvgezb\ze\s" contained
syn match	gasOpcode_PENT_MMX	"\<pmvlzb\ze\s" contained
syn match	gasOpcode_PENT_MMX	"\<pmvnzb\ze\s" contained
syn match	gasOpcode_PENT_MMX	"\<pmvzb\ze\s" contained
syn match	gasOpcode_386_Base	"\<pop\ze\s" contained
syn match	gasOpcode_186_Base	"\<popa\ze\s" contained
syn match	gasOpcode_386_Base	"\<popal\ze\s" contained
syn match	gasOpcode_186_Base	"\<popaw\ze\s" contained
syn match	gasOpcode_8086_Base	"\<popf\ze\s" contained
syn match	gasOpcode_386_Base	"\<popfd\ze\s" contained
syn match	gasOpcode_386_Base	"\<popfl\ze\s" contained
syn match	gasOpcode_X64_Base	"\<popfq\ze\s" contained
syn match	gasOpcode_8086_Base	"\<popfw\ze\s" contained
syn match	gasOpcode_PENT_MMX	"\<por\ze\s" contained
syn match	gasOpcode_PENT_MMX	"\<pslld\ze\s" contained
syn match	gasOpcode_PENT_MMX	"\<psllq\ze\s" contained
syn match	gasOpcode_PENT_MMX	"\<psllw\ze\s" contained
syn match	gasOpcode_PENT_MMX	"\<psrad\ze\s" contained
syn match	gasOpcode_PENT_MMX	"\<psraw\ze\s" contained
syn match	gasOpcode_PENT_MMX	"\<psrld\ze\s" contained
syn match	gasOpcode_PENT_MMX	"\<psrlq\ze\s" contained
syn match	gasOpcode_PENT_MMX	"\<psrlw\ze\s" contained
syn match	gasOpcode_PENT_MMX	"\<psubb\ze\s" contained
syn match	gasOpcode_PENT_MMX	"\<psubd\ze\s" contained
syn match	gasOpcode_PENT_MMX	"\<psubsb\ze\s" contained
syn match	gasOpcode_PENT_MMX	"\<psubsiw\ze\s" contained
syn match	gasOpcode_PENT_MMX	"\<psubsw\ze\s" contained
syn match	gasOpcode_PENT_MMX	"\<psubusb\ze\s" contained
syn match	gasOpcode_PENT_MMX	"\<psubusw\ze\s" contained
syn match	gasOpcode_PENT_MMX	"\<psubw\ze\s" contained
syn match	gasOpcode_PENT_MMX	"\<punpckhbw\ze\s" contained
syn match	gasOpcode_PENT_MMX	"\<punpckhdq\ze\s" contained
syn match	gasOpcode_PENT_MMX	"\<punpckhwd\ze\s" contained
syn match	gasOpcode_PENT_MMX	"\<punpcklbw\ze\s" contained
syn match	gasOpcode_PENT_MMX	"\<punpckldq\ze\s" contained
syn match	gasOpcode_PENT_MMX	"\<punpcklwd\ze\s" contained
syn match	gasOpcode_X64_Base	"\<push\ze\s" contained
syn match	gasOpcode_186_Base	"\<pusha\ze\s" contained
syn match	gasOpcode_386_Base	"\<pushal\ze\s" contained
syn match	gasOpcode_186_Base	"\<pushaw\ze\s" contained
syn match	gasOpcode_8086_Base	"\<pushf\ze\s" contained
syn match	gasOpcode_PENT_MMX	"\<pxor\ze\s" contained
syn match	gasOpcode_X64_Base	"\<rcl\ze\s" contained
syn match	gasOpcode_X64_Base	"\<rcr\ze\s" contained
syn match	gasOpcode_P6_Base	"\<rdshr\ze\s" contained
syn match	gasOpcode_PENT_Base	"\<rdmsr\ze\s" contained
syn match	gasOpcode_P6_Base	"\<rdpmc\ze\s" contained
syn match	gasOpcode_PENT_Base	"\<rdtsc\ze\s" contained
syn match	gasOpcode_X86_64_Base	"\<rdtscp\ze\s" contained
syn keyword	gasOpcode_8086_Base	ret contained
syn keyword	gasOpcode_8086_Base	retf contained
syn keyword	gasOpcode_8086_Base	retn contained
syn match	gasOpcode_X64_Base	"\<rol\ze\s" contained
syn match	gasOpcode_X64_Base	"\<ror\ze\s" contained
syn match	gasOpcode_P6_Base	"\<rdm\ze\s" contained
syn match	gasOpcode_486_Base	"\<rsdc\ze\s" contained
syn match	gasOpcode_486_Base	"\<rsldt\ze\s" contained
syn match	gasOpcode_PENTM_Base	"\<rsm\ze\s" contained
syn match	gasOpcode_486_Base	"\<rsts\ze\s" contained
syn match	gasOpcode_8086_Base	"\<sahf\ze\s" contained
syn match	gasOpcode_X64_Base	"\<sal\ze\s" contained
syn match	gasOpcode_8086_Base	"\<salc\ze\s" contained
syn match	gasOpcode_X64_Base	"\<sar\ze\s" contained
syn match	gasOpcode_386_Base	"\<sbb\ze\s" contained
syn match	gasOpcode_8086_Base	"\<scasb\ze\s" contained
syn match	gasOpcode_386_Base	"\<scasd\ze\s" contained
syn match	gasOpcode_X64_Base	"\<scasq\ze\s" contained
syn match	gasOpcode_8086_Base	"\<scasw\ze\s" contained
syn match	gasOpcode_X64_Base	"\<sfence\ze\s" contained
syn match	gasOpcode_286_Base	"\<sgdt\ze\s" contained
syn match	gasOpcode_X64_Base	"\<shl\ze\s" contained
syn match	gasOpcode_X64_Base	"\<shld\ze\s" contained
syn match	gasOpcode_X64_Base	"\<shr\ze\s" contained
syn match	gasOpcode_X64_Base	"\<shrd\ze\s" contained
syn match	gasOpcode_286_Base	"\<sidt\ze\s" contained
syn match	gasOpcode_X64_Base	"\<sldt\ze\s" contained
syn match	gasOpcode_X64_Base	"\<skinit\ze\s" contained
syn match	gasOpcode_386_Base	"\<smi\ze\s" contained
syn match	gasOpcode_P6_Base	"\<smint\ze\s" contained
syn match	gasOpcode_486_Base	"\<smintold\ze\s" contained
syn match	gasOpcode_386_Base	"\<smsw\ze\s" contained
syn match	gasOpcode_8086_Base	"\<stc\ze\s" contained
syn match	gasOpcode_8086_Base	"\<std\ze\s" contained
syn match	gasOpcode_X64_Base	"\<stgi\ze\s" contained
syn match	gasOpcode_8086_Base	"\<sti\ze\s" contained
syn match	gasOpcode_8086_Base	"\<stosb\ze\s" contained
syn match	gasOpcode_386_Base	"\<stosd stosl\ze\s" contained
syn match	gasOpcode_X64_Base	"\<stosq\ze\s" contained
syn match	gasOpcode_8086_Base	"\<stosw\ze\s" contained
syn match	gasOpcode_X64_Base	"\<str\ze\s" contained
syn match	gasOpcode_386_Base	"\<sub\ze\s" contained
syn match	gasOpcode_486_Base	"\<svdc\ze\s" contained
syn match	gasOpcode_486_Base	"\<svldt\ze\s" contained
syn match	gasOpcode_486_Base	"\<svts\ze\s" contained
syn match	gasOpcode_X64_Base	"\<swapgs\ze\s" contained
syn keyword	gasOpcode_P6_Base	syscall contained
syn keyword	gasOpcode_P6_Base	sysenter contained
syn keyword	gasOpcode_P6_Base	sysexit contained
syn keyword	gasOpcode_P6_Base	sysret contained
syn keyword	gasOpcode_386_Base	test contained
syn match	gasOpcode_186_Base	"\<ud0\ze\s" contained
syn match	gasOpcode_186_Base	"\<ud1\ze\s" contained
syn match	gasOpcode_186_Base	"\<ud2b\ze\s" contained
syn match	gasOpcode_186_Base	"\<ud2\ze\s" contained
syn match	gasOpcode_186_Base	"\<ud2a\ze\s" contained
syn match	gasOpcode_386_Base	"\<umov\ze\s" contained
syn match	gasOpcode_286_Base	"\<verr\ze\s" contained
syn match	gasOpcode_286_Base	"\<verw\ze\s" contained
syn match	gasOpcode_8086_Base	"\<fwait\ze\s" contained
syn match	gasOpcode_486_Base	"\<wbinvd\ze\s" contained
syn match	gasOpcode_P6_Base	"\<wrshr\ze\s" contained
syn match	gasOpcode_PENT_Base	"\<wrmsr\ze\s" contained
syn match	gasOpcode_X64_Base	"\<xadd\ze\s" contained
syn match	gasOpcode_386_Base	"\<xbts\ze\s" contained
syn match	gasOpcode_X64_Base	"\<xchg\ze\s" contained
syn match	gasOpcode_8086_Base	"\<xlatb\ze\s" contained
syn match	gasOpcode_8086_Base	"\<xlat\ze\s" contained
syn match	gasOpcode_386_Base	"\<xor\ze\s" contained
syn match	gasOpcode_X64_Base	"\<cmovcc\ze\s" contained
syn match	gasOpcode_X64_Base	"\<cmova\ze\s" contained
syn match	gasOpcode_8086_Base	/\<j\(e\|ne\|a\|ae\|b\|be\|nb\|nbe\|g\|ge\|ng\|nge\|l\|le\|\|z\|nz\|c\|nc\|d\|nd\|o\|no\|p\|np\|s\|ns\)[bwlq]\?\>/ contained
syn match	gasOpcode_386_Base	/\<set\(e\|ne\|a\|ae\|b\|be\|nb\|nbe\|g\|ge\|ng\|nge\|l\|le\|\|z\|nz\|c\|nc\|d\|nd\|o\|no\|p\|np\|s\|ns\)[bwlq]\?\>/ contained
" end of Conventional instructions }}}

" VIA (Centaur) security instructions {{{
syn match	gasOpcode_PENT_Base	"\<xstore\ze\s" contained
syn match	gasOpcode_PENT_Base	"\<xcryptecb\ze\s" contained
syn match	gasOpcode_PENT_Base	"\<xcryptcbc\ze\s" contained
syn match	gasOpcode_PENT_Base	"\<xcryptctr\ze\s" contained
syn match	gasOpcode_PENT_Base	"\<xcryptcfb\ze\s" contained
syn match	gasOpcode_PENT_Base	"\<xcryptofb\ze\s" contained
syn match	gasOpcode_PENT_Base	"\<montmul\ze\s" contained
syn match	gasOpcode_PENT_Base	"\<xsha1\ze\s" contained
syn match	gasOpcode_PENT_Base	"\<xsha256\ze\s" contained
" end of VIA (Centaur) security instructions }}}

" Intel AVX Carry-Less Multiplication instructions (CLMUL) {{{
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpclmullqlqdq\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpclmulhqlqdq\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpclmullqhqdq\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpclmulhqhqdq\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpclmulqdq\ze\s" contained
" end of Intel AVX Carry-Less Multiplication instructions (CLMUL) }}}

" AMD SSE5 instructions {{{
syn match	gasOpcode_AMD_SSE5	"\<fmaddps\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<fmaddpd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<fmaddss\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<fmaddsd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<fmsubps\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<fmsubpd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<fmsubss\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<fmsubsd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<fnmaddps\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<fnmaddpd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<fnmaddss\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<fnmaddsd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<fnmsubps\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<fnmsubpd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<fnmsubss\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<fnmsubsd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comeqps\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comltps\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comleps\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comunordps\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comuneqps\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comunltps\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comunleps\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comordps\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comueqps\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comultps\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comuleps\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comfalseps\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comneqps\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comnltps\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comnleps\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comtrueps\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comps\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comeqpd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comltpd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comlepd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comunordpd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comuneqpd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comunltpd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comunlepd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comordpd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comueqpd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comultpd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comulepd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comfalsepd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comneqpd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comnltpd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comnlepd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comtruepd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<compd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comeqss\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comltss\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comless\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comunordss\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comuneqss\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comunltss\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comunless\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comordss\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comueqss\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comultss\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comuless\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comfalsess\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comneqss\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comnltss\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comnless\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comtruess\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comss\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comeqsd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comltsd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comlesd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comunordsd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comuneqsd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comunltsd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comunlesd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comordsd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comueqsd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comultsd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comulesd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comfalsesd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comneqsd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comnltsd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comnlesd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comtruesd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<comsd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomltb\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomleb\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomgtb\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomgeb\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomeqb\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomneqb\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomfalseb\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomtrueb\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomb\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomltw\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomlew\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomgtw\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomgew\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomeqw\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomneqw\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomfalsew\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomtruew\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomw\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomltd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomled\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomgtd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomged\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomeqd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomneqd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomfalsed\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomtrued\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomltq\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomleq\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomgtq\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomgeq\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomeqq\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomneqq\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomfalseq\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomtrueq\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomq\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomltub\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomleub\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomgtub\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomgeub\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomequb\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomnequb\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomfalseub\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomtrueub\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomub\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomltuw\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomleuw\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomgtuw\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomgeuw\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomequw\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomnequw\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomfalseuw\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomtrueuw\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomuw\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomltud\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomleud\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomgtud\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomgeud\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomequd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomnequd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomfalseud\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomtrueud\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomud\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomltuq\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomleuq\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomgtuq\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomgeuq\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomequq\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomnequq\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomfalseuq\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomtrueuq\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcomuq\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<permps\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<permpd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pcmov\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pperm\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pmacssww\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pmacsww\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pmacsswd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pmacswd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pmacssdd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pmacsdd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pmacssdql\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pmacsdql\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pmacssdqh\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pmacsdqh\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pmadcsswd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pmadcswd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<protb\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<protw\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<protd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<protq\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pshlb\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pshlw\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pshld\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pshlq\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pshab\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pshaw\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pshad\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<pshaq\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<frczps\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<frczpd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<frczss\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<frczsd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<cvtph2ps\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<cvtps2ph\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<phaddbw\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<phaddbd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<phaddbq\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<phaddwd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<phaddwq\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<phadddq\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<phaddubw\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<phaddubd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<phaddubq\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<phadduwd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<phadduwq\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<phaddudq\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<phsubbw\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<phsubwd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<phsubdq\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<protb\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<protw\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<protd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<protq\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<roundps\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<roundpd\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<roundss\ze\s" contained
syn match	gasOpcode_AMD_SSE5	"\<roundsd\ze\s" contained
" end of AMD SSE5 instructions }}}

" Introduced in Deschutes but necessary for SSE support {{{
syn match	gasOpcode_P6_SSE	"\<fxrstor\ze\s" contained
syn match	gasOpcode_P6_SSE	"\<fxsave\ze\s" contained
" end of  Introduced in Deschutes but necessary for SSE support }}}

" Prescott New Instructions (SSE3) {{{
syn match	gasOpcode_PRESCOTT_SSE3	"\<addsubpd\ze\s" contained
syn match	gasOpcode_PRESCOTT_SSE3	"\<addsubps\ze\s" contained
syn match	gasOpcode_PRESCOTT_SSE3	"\<haddpd\ze\s" contained
syn match	gasOpcode_PRESCOTT_SSE3	"\<haddps\ze\s" contained
syn match	gasOpcode_PRESCOTT_SSE3	"\<hsubpd\ze\s" contained
syn match	gasOpcode_PRESCOTT_SSE3	"\<hsubps\ze\s" contained
syn match	gasOpcode_PRESCOTT_SSE3	"\<lddqu\ze\s" contained
syn match	gasOpcode_PRESCOTT_SSE3	"\<movddup\ze\s" contained
syn match	gasOpcode_PRESCOTT_SSE3	"\<movshdup\ze\s" contained
syn match	gasOpcode_PRESCOTT_SSE3	"\<movsldup\ze\s" contained
" end of Prescott New Instructions (SSE3) }}}

" Intel AES instructions {{{
syn match	gasOpcode_SSE		"\<aesenc\ze\s" contained
syn match	gasOpcode_SSE		"\<aesenclast\ze\s" contained
syn match	gasOpcode_SSE		"\<aesdec\ze\s" contained
syn match	gasOpcode_SSE		"\<aesdeclast\ze\s" contained
syn match	gasOpcode_SSE		"\<aesimc\ze\s" contained
syn match	gasOpcode_SSE		"\<aeskeygenassist\ze\s" contained
" end of Intel AES instructions }}}

" Willamette Streaming SIMD instructions (SSE2) {{{
syn match	gasOpcode_SSE2		"\<addpd\ze\s" contained
syn match	gasOpcode_SSE2		"\<addsd\ze\s" contained
syn match	gasOpcode_SSE2		"\<andnpd\ze\s" contained
syn match	gasOpcode_SSE2		"\<andpd\ze\s" contained
syn match	gasOpcode_SSE2		"\<cmpeqpd\ze\s" contained
syn match	gasOpcode_SSE2		"\<cmpeqsd\ze\s" contained
syn match	gasOpcode_SSE2		"\<cmplepd\ze\s" contained
syn match	gasOpcode_SSE2		"\<cmplesd\ze\s" contained
syn match	gasOpcode_SSE2		"\<cmpltpd\ze\s" contained
syn match	gasOpcode_SSE2		"\<cmpltsd\ze\s" contained
syn match	gasOpcode_SSE2		"\<cmpneqpd\ze\s" contained
syn match	gasOpcode_SSE2		"\<cmpneqsd\ze\s" contained
syn match	gasOpcode_SSE2		"\<cmpnlepd\ze\s" contained
syn match	gasOpcode_SSE2		"\<cmpnlesd\ze\s" contained
syn match	gasOpcode_SSE2		"\<cmpnltpd\ze\s" contained
syn match	gasOpcode_SSE2		"\<cmpnltsd\ze\s" contained
syn match	gasOpcode_SSE2		"\<cmpordpd\ze\s" contained
syn match	gasOpcode_SSE2		"\<cmpordsd\ze\s" contained
syn match	gasOpcode_SSE2		"\<cmpunordpd\ze\s" contained
syn match	gasOpcode_SSE2		"\<cmpunordsd\ze\s" contained
syn match	gasOpcode_Base		"\<cmppd\ze\s" contained
syn match	gasOpcode_SSE2		"\<cmpsd\ze\s" contained
syn match	gasOpcode_SSE2		"\<comisd\ze\s" contained
syn match	gasOpcode_SSE2		"\<cvtdq2pd\ze\s" contained
syn match	gasOpcode_SSE2		"\<cvtdq2ps\ze\s" contained
syn match	gasOpcode_SSE2		"\<cvtpd2dq\ze\s" contained
syn match	gasOpcode_SSE2		"\<cvtpd2pi\ze\s" contained
syn match	gasOpcode_SSE2		"\<cvtpd2ps\ze\s" contained
syn match	gasOpcode_SSE2		"\<cvtpi2pd\ze\s" contained
syn match	gasOpcode_SSE2		"\<cvtps2dq\ze\s" contained
syn match	gasOpcode_SSE2		"\<cvtps2pd\ze\s" contained
syn match	gasOpcode_X64_SSE2	"\<cvtsd2si\ze\s" contained
syn match	gasOpcode_SSE2		"\<cvtsd2ss\ze\s" contained
syn match	gasOpcode_X64_SSE2	"\<cvtsi2sd\ze\s" contained
syn match	gasOpcode_SSE2		"\<cvtss2sd\ze\s" contained
syn match	gasOpcode_SSE2		"\<cvttpd2pi\ze\s" contained
syn match	gasOpcode_SSE2		"\<cvttpd2dq\ze\s" contained
syn match	gasOpcode_SSE2		"\<cvttps2dq\ze\s" contained
syn match	gasOpcode_X64_SSE2	"\<cvttsd2si\ze\s" contained
syn match	gasOpcode_SSE2		"\<divpd\ze\s" contained
syn match	gasOpcode_SSE2		"\<divsd\ze\s" contained
syn match	gasOpcode_SSE2		"\<maxpd\ze\s" contained
syn match	gasOpcode_SSE2		"\<maxsd\ze\s" contained
syn match	gasOpcode_SSE2		"\<minpd\ze\s" contained
syn match	gasOpcode_SSE2		"\<minsd\ze\s" contained
syn match	gasOpcode_SSE2		"\<movapd\ze\s" contained
syn match	gasOpcode_SSE2		"\<movhpd\ze\s" contained
syn match	gasOpcode_SSE2		"\<movlpd\ze\s" contained
syn match	gasOpcode_X64_SSE2	"\<movmskpd\ze\s" contained
syn match	gasOpcode_SSE2		"\<movsd\ze\s" contained
syn match	gasOpcode_SSE2		"\<movupd\ze\s" contained
syn match	gasOpcode_SSE2		"\<mulpd\ze\s" contained
syn match	gasOpcode_SSE2		"\<mulsd\ze\s" contained
syn match	gasOpcode_SSE2		"\<orpd\ze\s" contained
syn match	gasOpcode_SSE2		"\<shufpd\ze\s" contained
syn match	gasOpcode_SSE2		"\<sqrtpd\ze\s" contained
syn match	gasOpcode_SSE2		"\<sqrtsd\ze\s" contained
syn match	gasOpcode_SSE2		"\<subpd\ze\s" contained
syn match	gasOpcode_SSE2		"\<subsd\ze\s" contained
syn match	gasOpcode_SSE2		"\<ucomisd\ze\s" contained
syn match	gasOpcode_SSE2		"\<unpckhpd\ze\s" contained
syn match	gasOpcode_SSE2		"\<unpcklpd\ze\s" contained
syn match	gasOpcode_SSE2		"\<xorpd\ze\s" contained
" end of Willamette Streaming SIMD instructions (SSE2) }}}

" Intel Carry-Less Multiplication instructions (CLMUL) {{{
syn match	gasOpcode_SSE		"\<pclmullqlqdq\ze\s" contained
syn match	gasOpcode_SSE		"\<pclmulhqlqdq\ze\s" contained
syn match	gasOpcode_SSE		"\<pclmullqhqdq\ze\s" contained
syn match	gasOpcode_SSE		"\<pclmulhqhqdq\ze\s" contained
syn match	gasOpcode_SSE		"\<pclmulqdq\ze\s" contained
" end of Intel Carry-Less Multiplication instructions (CLMUL) }}}

" New MMX instructions introduced in Katmai {{{
syn match	gasOpcode_KATMAI_MMX	"\<maskmovq\ze\s" contained
syn match	gasOpcode_KATMAI_MMX	"\<movntq\ze\s" contained
syn match	gasOpcode_KATMAI_MMX	"\<pavgb\ze\s" contained
syn match	gasOpcode_KATMAI_MMX	"\<pavgw\ze\s" contained
syn match	gasOpcode_KATMAI_MMX	"\<pextrw\ze\s" contained
syn match	gasOpcode_KATMAI_MMX	"\<pinsrw\ze\s" contained
syn match	gasOpcode_KATMAI_MMX	"\<pmaxsw\ze\s" contained
syn match	gasOpcode_KATMAI_MMX	"\<pmaxub\ze\s" contained
syn match	gasOpcode_KATMAI_MMX	"\<pminsw\ze\s" contained
syn match	gasOpcode_KATMAI_MMX	"\<pminub\ze\s" contained
syn match	gasOpcode_KATMAI_MMX	"\<pmovmskb\ze\s" contained
syn match	gasOpcode_KATMAI_MMX	"\<pmulhuw\ze\s" contained
syn match	gasOpcode_KATMAI_MMX	"\<psadbw\ze\s" contained
syn match	gasOpcode_KATMAI_MMX2	"\<pshufw\ze\s" contained
" end of New MMX instructions introduced in Katmai }}}

" Intel SMX.
syn match	gasOpcode_KATMAI_Base	"\<getsec\ze\s" contained

" Katmai Streaming SIMD instructions (SSE -- a.k.a. KNI, XMM, MMX2) {{{
syn match	gasOpcode_KATMAI_SSE	"\<addps\ze\s" contained
syn match	gasOpcode_KATMAI_SSE	"\<addss\ze\s" contained
syn match	gasOpcode_KATMAI_SSE	"\<andnps\ze\s" contained
syn match	gasOpcode_KATMAI_SSE	"\<andps\ze\s" contained
syn match	gasOpcode_KATMAI_SSE	"\<cmpeqps\ze\s" contained
syn match	gasOpcode_KATMAI_SSE	"\<cmpeqss\ze\s" contained
syn match	gasOpcode_KATMAI_SSE	"\<cmpleps\ze\s" contained
syn match	gasOpcode_KATMAI_SSE	"\<cmpless\ze\s" contained
syn match	gasOpcode_KATMAI_SSE	"\<cmpltps\ze\s" contained
syn match	gasOpcode_KATMAI_SSE	"\<cmpltss\ze\s" contained
syn match	gasOpcode_KATMAI_SSE	"\<cmpneqps\ze\s" contained
syn match	gasOpcode_KATMAI_SSE	"\<cmpneqss\ze\s" contained
syn match	gasOpcode_KATMAI_SSE	"\<cmpnleps\ze\s" contained
syn match	gasOpcode_KATMAI_SSE	"\<cmpnless\ze\s" contained
syn match	gasOpcode_KATMAI_SSE	"\<cmpnltps\ze\s" contained
syn match	gasOpcode_KATMAI_SSE	"\<cmpnltss\ze\s" contained
syn match	gasOpcode_KATMAI_SSE	"\<cmpordps\ze\s" contained
syn match	gasOpcode_KATMAI_SSE	"\<cmpordss\ze\s" contained
syn match	gasOpcode_KATMAI_SSE	"\<cmpunordps\ze\s" contained
syn match	gasOpcode_KATMAI_SSE	"\<cmpunordss\ze\s" contained
syn match	gasOpcode_KATMAI_SSE	"\<cmpps\ze\s" contained
syn match	gasOpcode_KATMAI_SSE	"\<cmpss\ze\s" contained
syn match	gasOpcode_KATMAI_SSE	"\<comiss\ze\s" contained
syn match	gasOpcode_KATMAI_SSE	"\<cvtpi2ps\ze\s" contained
syn match	gasOpcode_KATMAI_SSE	"\<cvtps2pi\ze\s" contained
syn match	gasOpcode_X64_SSE	"\<cvtsi2ss\ze\s" contained
syn match	gasOpcode_X64_SSE	"\<cvtss2si\ze\s" contained
syn match	gasOpcode_KATMAI_SSE	"\<cvttps2pi\ze\s" contained
syn match	gasOpcode_X64_SSE	"\<cvttss2si\ze\s" contained
syn match	gasOpcode_KATMAI_SSE	"\<divps\ze\s" contained
syn match	gasOpcode_KATMAI_SSE	"\<divss\ze\s" contained
syn match	gasOpcode_KATMAI_SSE	"\<ldmxcsr\ze\s" contained
syn match	gasOpcode_KATMAI_SSE	"\<maxps\ze\s" contained
syn match	gasOpcode_KATMAI_SSE	"\<maxss\ze\s" contained
syn match	gasOpcode_KATMAI_SSE	"\<minps\ze\s" contained
syn match	gasOpcode_KATMAI_SSE	"\<minss\ze\s" contained
syn match	gasOpcode_KATMAI_SSE	"\<movaps\ze\s" contained
syn match	gasOpcode_KATMAI_SSE	"\<movhps\ze\s" contained
syn match	gasOpcode_KATMAI_SSE	"\<movlhps\ze\s" contained
syn match	gasOpcode_KATMAI_SSE	"\<movlps\ze\s" contained
syn match	gasOpcode_KATMAI_SSE	"\<movhlps\ze\s" contained
syn match	gasOpcode_X64_SSE	"\<movmskps\ze\s" contained
syn match	gasOpcode_KATMAI_SSE	"\<movntps\ze\s" contained
syn match	gasOpcode_KATMAI_SSE	"\<movss\ze\s" contained
syn match	gasOpcode_KATMAI_SSE	"\<movups\ze\s" contained
syn match	gasOpcode_KATMAI_SSE	"\<mulps\ze\s" contained
syn match	gasOpcode_KATMAI_SSE	"\<mulss\ze\s" contained
syn match	gasOpcode_KATMAI_SSE	"\<orps\ze\s" contained
syn match	gasOpcode_KATMAI_SSE	"\<rcpps\ze\s" contained
syn match	gasOpcode_KATMAI_SSE	"\<rcpss\ze\s" contained
syn match	gasOpcode_KATMAI_SSE	"\<rsqrtps\ze\s" contained
syn match	gasOpcode_KATMAI_SSE	"\<rsqrtss\ze\s" contained
syn match	gasOpcode_KATMAI_SSE	"\<shufps\ze\s" contained
syn match	gasOpcode_KATMAI_SSE	"\<sqrtps\ze\s" contained
syn match	gasOpcode_KATMAI_SSE	"\<sqrtss\ze\s" contained
syn match	gasOpcode_KATMAI_SSE	"\<stmxcsr\ze\s" contained
syn match	gasOpcode_KATMAI_SSE	"\<subps\ze\s" contained
syn match	gasOpcode_KATMAI_SSE	"\<subss\ze\s" contained
syn match	gasOpcode_KATMAI_SSE	"\<ucomiss\ze\s" contained
syn match	gasOpcode_KATMAI_SSE	"\<unpckhps\ze\s" contained
syn match	gasOpcode_KATMAI_SSE	"\<unpcklps\ze\s" contained
syn match	gasOpcode_KATMAI_SSE	"\<xorps\ze\s" contained
" end of Katmai Streaming SIMD instructions (SSE -- a.k.a. KNI, XMM, MMX2) }}}

" Extended Page Tables VMX instructions {{{
syn match	gasOpcode_VMX		"\<invept\ze\s" contained
syn match	gasOpcode_VMX		"\<invvpid\ze\s" contained
" end of Extended Page Tables VMX instructions }}}

" VMX Instructions {{{
syn match	gasOpcode_VMX		"\<vmcall\ze\s" contained
syn match	gasOpcode_VMX		"\<vmclear\ze\s" contained
syn match	gasOpcode_VMX		"\<vmlaunch\ze\s" contained
syn match	gasOpcode_X64_VMX	"\<vmload\ze\s" contained
syn match	gasOpcode_X64_VMX	"\<vmmcall\ze\s" contained
syn match	gasOpcode_VMX		"\<vmptrld\ze\s" contained
syn match	gasOpcode_VMX		"\<vmptrst\ze\s" contained
syn match	gasOpcode_X64_VMX	"\<vmread\ze\s" contained
syn match	gasOpcode_VMX		"\<vmresume\ze\s" contained
syn match	gasOpcode_X64_VMX	"\<vmrun\ze\s" contained
syn match	gasOpcode_X64_VMX	"\<vmsave\ze\s" contained
syn match	gasOpcode_X64_VMX	"\<vmwrite\ze\s" contained
syn match	gasOpcode_VMX		"\<vmxoff\ze\s" contained
syn match	gasOpcode_VMX		"\<vmxon\ze\s" contained
" end of VMX Instructions }}}

" Intel AVX AES instructions {{{
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vaesenc\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vaesenclast\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vaesdec\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vaesdeclast\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vaesimc\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vaeskeygenassist\ze\s" contained
" end of Intel AVX AES instructions }}}

" New instructions in Barcelona.
syn match	gasOpcode_X64_Base	"\<lzcnt\ze\s" contained

" Intel AVX instructions {{{
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vaddpd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vaddps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vaddsd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vaddss\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vaddsubpd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vaddsubps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vandpd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vandps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vandnpd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vandnps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vblendpd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vblendps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vblendvpd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vblendvps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vblendvpd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vbroadcastss\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vbroadcastsd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vbroadcastf128\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpeqpd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpltpd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmplepd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpunordpd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpneqpd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpnltpd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpnlepd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpordpd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpeq_uqpd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpngepd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpngtpd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpfalsepd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpneq_oqpd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpgepd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpgtpd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmptruepd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpeq_ospd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmplt_oqpd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmple_oqpd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpunord_spd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpneq_uspd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpnlt_uqpd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpnle_uqpd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpord_spd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpeq_uspd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpnge_uqpd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpngt_uqpd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpfalse_ospd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpneq_ospd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpge_oqpd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpgt_oqpd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmptrue_uspd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmppd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpeqps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpltps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpleps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpunordps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpneqps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpnltps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpnleps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpordps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpeq_uqps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpngeps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpngtps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpfalseps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpneq_oqps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpgeps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpgtps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmptrueps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpeq_osps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmplt_oqps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmple_oqps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpunord_sps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpneq_usps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpnlt_uqps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpnle_uqps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpord_sps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpeq_usps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpnge_uqps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpngt_uqps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpfalse_osps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpneq_osps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpge_oqps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpgt_oqps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmptrue_usps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpeqsd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpltsd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmplesd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpunordsd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpneqsd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpnltsd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpnlesd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpordsd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpeq_uqsd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpngesd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpngtsd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpfalsesd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpneq_oqsd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpgesd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpgtsd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmptruesd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpeq_ossd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmplt_oqsd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmple_oqsd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpunord_ssd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpneq_ussd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpnlt_uqsd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpnle_uqsd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpord_ssd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpeq_ussd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpnge_uqsd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpngt_uqsd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpfalse_ossd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpneq_ossd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpge_oqsd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpgt_oqsd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmptrue_ussd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpsd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpeqss\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpltss\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpless\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpunordss\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpneqss\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpnltss\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpnless\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpordss\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpeq_uqss\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpngess\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpngtss\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpfalsess\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpneq_oqss\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpgess\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpgtss\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmptruess\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpeq_osss\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmplt_oqss\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmple_oqss\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpunord_sss\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpneq_usss\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpnlt_uqss\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpnle_uqss\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpord_sss\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpeq_usss\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpnge_uqss\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpngt_uqss\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpfalse_osss\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpneq_osss\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpge_oqss\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpgt_oqss\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmptrue_usss\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcmpss\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcomisd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcomiss\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcvtdq2pd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcvtdq2ps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcvtpd2dq\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcvtpd2ps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcvtps2dq\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcvtps2pd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcvtsd2si\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcvtsd2ss\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcvtsi2sd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcvtsi2ss\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcvtss2sd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcvtss2si\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcvttpd2dq\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcvttps2dq\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcvttsd2si\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vcvttss2si\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vdivpd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vdivps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vdivsd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vdivss\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vdppd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vdpps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vextractf128\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vextractps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vhaddpd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vhaddps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vhsubpd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vhsubps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vinsertf128\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vinsertps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vlddqu\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vldqqu\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vlddqu\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vldmxcsr\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vmaskmovdqu\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vmaskmovps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vmaskmovpd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vmaxpd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vmaxps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vmaxsd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vmaxss\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vminpd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vminps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vminsd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vminss\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vmovapd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vmovaps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vmovq\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vmovd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vmovq\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vmovd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vmovq\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vmovddup\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vmovdqa\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vmovqqa\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vmovdqa\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vmovdqu\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vmovqqu\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vmovdqu\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vmovhlps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vmovhpd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vmovhps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vmovlhps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vmovlpd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vmovlps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vmovmskpd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vmovmskps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vmovntdq\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vmovntqq\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vmovntdq\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vmovntdqa\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vmovntpd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vmovntps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vmovsd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vmovshdup\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vmovsldup\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vmovss\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vmovupd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vmovups\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vmpsadbw\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vmulpd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vmulps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vmulsd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vmulss\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vorpd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vorps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpabsb\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpabsw\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpabsd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpacksswb\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpackssdw\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpackuswb\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpackusdw\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpaddb\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpaddw\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpaddd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpaddq\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpaddsb\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpaddsw\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpaddusb\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpaddusw\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpalignr\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpand\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpandn\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpavgb\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpavgw\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpblendvb\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpblendw\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpcmpestri\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpcmpestrm\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpcmpistri\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpcmpistrm\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpcmpeqb\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpcmpeqw\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpcmpeqd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpcmpeqq\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpcmpgtb\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpcmpgtw\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpcmpgtd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpcmpgtq\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpermilpd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpermiltd2pd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpermilmo2pd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpermilmz2pd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpermil2pd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpermilps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpermiltd2ps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpermilmo2ps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpermilmz2ps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpermil2ps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vperm2f128\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpextrb\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpextrw\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpextrd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpextrq\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vphaddw\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vphaddd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vphaddsw\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vphminposuw\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vphsubw\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vphsubd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vphsubsw\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpinsrb\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpinsrw\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpinsrd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpinsrq\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpmaddwd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpmaddubsw\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpmaxsb\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpmaxsw\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpmaxsd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpmaxub\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpmaxuw\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpmaxud\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpminsb\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpminsw\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpminsd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpminub\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpminuw\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpminud\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpmovmskb\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpmovsxbw\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpmovsxbd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpmovsxbq\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpmovsxwd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpmovsxwq\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpmovsxdq\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpmovzxbw\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpmovzxbd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpmovzxbq\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpmovzxwd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpmovzxwq\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpmovzxdq\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpmulhuw\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpmulhrsw\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpmulhw\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpmullw\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpmulld\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpmuludq\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpmuldq\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpor\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpsadbw\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpshufb\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpshufd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpshufhw\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpshuflw\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpsignb\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpsignw\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpsignd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpslldq\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpsrldq\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpsllw\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpslld\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpsllq\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpsraw\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpsrad\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpsrlw\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpsrld\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpsrlq\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vptest\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpsubb\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpsubw\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpsubd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpsubq\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpsubsb\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpsubsw\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpsubusb\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpsubusw\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpunpckhbw\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpunpckhwd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpunpckhdq\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpunpckhqdq\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpunpcklbw\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpunpcklwd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpunpckldq\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpunpcklqdq\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vpxor\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vrcpps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vrcpss\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vrsqrtps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vrsqrtss\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vroundpd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vroundps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vroundsd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vroundss\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vshufpd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vshufps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vsqrtpd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vsqrtps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vsqrtsd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vsqrtss\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vstmxcsr\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vsubpd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vsubps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vsubsd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vsubss\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vtestps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vtestpd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vucomisd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vucomiss\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vunpckhpd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vunpckhps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vunpcklpd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vunpcklps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vxorpd\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vxorps\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vzeroall\ze\s" contained
syn match	gasOpcode_SANDYBRIDGE_AVX "\<vzeroupper\ze\s" contained
" end of Intel AVX instructions }}}

" Penryn New Instructions (SSE4.1) {{{
syn match	gasOpcode_SSE41		"\<blendpd\ze\s" contained
syn match	gasOpcode_SSE41		"\<blendps\ze\s" contained
syn match	gasOpcode_SSE41		"\<blendvpd\ze\s" contained
syn match	gasOpcode_SSE41		"\<blendvps\ze\s" contained
syn match	gasOpcode_SSE41		"\<dppd\ze\s" contained
syn match	gasOpcode_SSE41		"\<dpps\ze\s" contained
syn match	gasOpcode_X64_SSE41	"\<extractps\ze\s" contained
syn match	gasOpcode_SSE41		"\<insertps\ze\s" contained
syn match	gasOpcode_SSE41		"\<movntdqa\ze\s" contained
syn match	gasOpcode_SSE41		"\<mpsadbw\ze\s" contained
syn match	gasOpcode_SSE41		"\<packusdw\ze\s" contained
syn match	gasOpcode_SSE41		"\<pblendvb\ze\s" contained
syn match	gasOpcode_SSE41		"\<pblendw\ze\s" contained
syn match	gasOpcode_SSE41		"\<pcmpeqq\ze\s" contained
syn match	gasOpcode_X64_SSE41	"\<pextrb\ze\s" contained
syn match	gasOpcode_SSE41		"\<pextrd\ze\s" contained
syn match	gasOpcode_X64_SSE41	"\<pextrq\ze\s" contained
syn match	gasOpcode_X64_SSE41	"\<pextrw\ze\s" contained
syn match	gasOpcode_SSE41		"\<phminposuw\ze\s" contained
syn match	gasOpcode_SSE41		"\<pinsrb\ze\s" contained
syn match	gasOpcode_SSE41		"\<pinsrd\ze\s" contained
syn match	gasOpcode_X64_SSE41	"\<pinsrq\ze\s" contained
syn match	gasOpcode_SSE41		"\<pmaxsb\ze\s" contained
syn match	gasOpcode_SSE41		"\<pmaxsd\ze\s" contained
syn match	gasOpcode_SSE41		"\<pmaxud\ze\s" contained
syn match	gasOpcode_SSE41		"\<pmaxuw\ze\s" contained
syn match	gasOpcode_SSE41		"\<pminsb\ze\s" contained
syn match	gasOpcode_SSE41		"\<pminsd\ze\s" contained
syn match	gasOpcode_SSE41		"\<pminud\ze\s" contained
syn match	gasOpcode_SSE41		"\<pminuw\ze\s" contained
syn match	gasOpcode_SSE41		"\<pmovsxbw\ze\s" contained
syn match	gasOpcode_SSE41		"\<pmovsxbd\ze\s" contained
syn match	gasOpcode_SSE41		"\<pmovsxbq\ze\s" contained
syn match	gasOpcode_SSE41		"\<pmovsxwd\ze\s" contained
syn match	gasOpcode_SSE41		"\<pmovsxwq\ze\s" contained
syn match	gasOpcode_SSE41		"\<pmovsxdq\ze\s" contained
syn match	gasOpcode_SSE41		"\<pmovzxbw\ze\s" contained
syn match	gasOpcode_SSE41		"\<pmovzxbd\ze\s" contained
syn match	gasOpcode_SSE41		"\<pmovzxbq\ze\s" contained
syn match	gasOpcode_SSE41		"\<pmovzxwd\ze\s" contained
syn match	gasOpcode_SSE41		"\<pmovzxwq\ze\s" contained
syn match	gasOpcode_SSE41		"\<pmovzxdq\ze\s" contained
syn match	gasOpcode_SSE41		"\<pmuldq\ze\s" contained
syn match	gasOpcode_SSE41		"\<pmulld\ze\s" contained
syn match	gasOpcode_SSE41		"\<ptest\ze\s" contained
syn match	gasOpcode_SSE41		"\<roundpd\ze\s" contained
syn match	gasOpcode_SSE41		"\<roundps\ze\s" contained
syn match	gasOpcode_SSE41		"\<roundsd\ze\s" contained
syn match	gasOpcode_SSE41		"\<roundss\ze\s" contained
" end of Penryn New Instructions (SSE4.1) }}}

" AMD SSE4A Opcode {{{
syn match	gasOpcode_AMD_SSE4A	"\<extrq\ze\s" contained
syn match	gasOpcode_AMD_SSE4A	"\<insertq\ze\s" contained
syn match	gasOpcode_AMD_SSE4A	"\<movntsd\ze\s" contained
syn match	gasOpcode_AMD_SSE4A	"\<movntss\ze\s" contained
" end of AMD SSE4A Opcode }}}

" AVR Opcode {{{
syn match	gasOpcode_AVR		"\<adc\ze\s" contained
syn match	gasOpcode_AVR		"\<add\ze\s" contained
syn match	gasOpcode_AVR		"\<adiw\ze\s" contained
syn match	gasOpcode_AVR		"\<andi\ze\s" contained
syn match	gasOpcode_AVR		"\<asr\ze\s" contained
syn match	gasOpcode_AVR		"\<bclr\ze\s" contained
syn match	gasOpcode_AVR		"\<bld\ze\s" contained
syn match	gasOpcode_AVR		"\<brbc\ze\s" contained
syn match	gasOpcode_AVR		"\<brbs\ze\s" contained
syn match	gasOpcode_AVR		"\<brcc\ze\s" contained
syn match	gasOpcode_AVR		"\<brcs\ze\s" contained
syn match	gasOpcode_AVR		"\<break\ze\s" contained
syn match	gasOpcode_AVR		"\<breq\ze\s" contained
syn match	gasOpcode_AVR		"\<brge\ze\s" contained
syn match	gasOpcode_AVR		"\<brhc\ze\s" contained
syn match	gasOpcode_AVR		"\<brhs\ze\s" contained
syn match	gasOpcode_AVR		"\<brid\ze\s" contained
syn match	gasOpcode_AVR		"\<brie\ze\s" contained
syn match	gasOpcode_AVR		"\<brlo\ze\s" contained
syn match	gasOpcode_AVR		"\<brlt\ze\s" contained
syn match	gasOpcode_AVR		"\<brmi\ze\s" contained
syn match	gasOpcode_AVR		"\<brne\ze\s" contained
syn match	gasOpcode_AVR		"\<brpl\ze\s" contained
syn match	gasOpcode_AVR		"\<brsh\ze\s" contained
syn match	gasOpcode_AVR		"\<brtc\ze\s" contained
syn match	gasOpcode_AVR		"\<brts\ze\s" contained
syn match	gasOpcode_AVR		"\<brvc\ze\s" contained
syn match	gasOpcode_AVR		"\<brvs\ze\s" contained
syn match	gasOpcode_AVR		"\<bset\ze\s" contained
syn match	gasOpcode_AVR		"\<bst\ze\s" contained
syn match	gasOpcode_AVR		"\<call\ze\s" contained
syn match	gasOpcode_AVR		"\<cbi\ze\s" contained
syn match	gasOpcode_AVR		"\<cbr\ze\s" contained
syn match	gasOpcode_AVR		"\<clc\ze\s" contained
syn match	gasOpcode_AVR		"\<clh\ze\s" contained
syn match	gasOpcode_AVR		"\<cli\ze\s" contained
syn match	gasOpcode_AVR		"\<cln\ze\s" contained
syn match	gasOpcode_AVR		"\<clr\ze\s" contained
syn match	gasOpcode_AVR		"\<cls\ze\s" contained
syn match	gasOpcode_AVR		"\<clt\ze\s" contained
syn match	gasOpcode_AVR		"\<clv\ze\s" contained
syn match	gasOpcode_AVR		"\<clz\ze\s" contained
syn match	gasOpcode_AVR		"\<com\ze\s" contained
syn match	gasOpcode_AVR		"\<cp\ze\s" contained
syn match	gasOpcode_AVR		"\<cpc\ze\s" contained
syn match	gasOpcode_AVR		"\<cpi\ze\s" contained
syn match	gasOpcode_AVR		"\<cpse\ze\s" contained
syn match	gasOpcode_AVR		"\<dec\ze\s" contained
syn match	gasOpcode_AVR		"\<des\ze\s" contained
syn match	gasOpcode_AVR		"\<eicall\ze\s" contained
syn match	gasOpcode_AVR		"\<eijmp\ze\s" contained
syn match	gasOpcode_AVR		"\<elpm\ze\s" contained
syn match	gasOpcode_AVR		"\<eor\ze\s" contained
syn match	gasOpcode_AVR		"\<fmul\ze\s" contained
syn match	gasOpcode_AVR		"\<fmuls\ze\s" contained
syn match	gasOpcode_AVR		"\<fmulsu\ze\s" contained
syn match	gasOpcode_AVR		"\<icall\ze\s" contained
syn match	gasOpcode_AVR		"\<ijmp\ze\s" contained
syn match	gasOpcode_AVR		"\<in\ze\s" contained
syn match	gasOpcode_AVR		"\<inc\ze\s" contained
syn match	gasOpcode_AVR		"\<jmp\ze\s" contained
syn match	gasOpcode_AVR		"\<lac\ze\s" contained
syn match	gasOpcode_AVR		"\<las\ze\s" contained
syn match	gasOpcode_AVR		"\<lat\ze\s" contained
syn match	gasOpcode_AVR		"\<ld\ze\s" contained
syn match	gasOpcode_AVR		"\<ldd\ze\s" contained
syn match	gasOpcode_AVR		"\<ldi\ze\s" contained
syn match	gasOpcode_AVR		"\<lds\ze\s" contained
syn match	gasOpcode_AVR		"\<lpm\ze\s" contained
syn match	gasOpcode_AVR		"\<lsl\ze\s" contained
syn match	gasOpcode_AVR		"\<lsr\ze\s" contained
syn match	gasOpcode_AVR		"\<mov\ze\s" contained
syn match	gasOpcode_AVR		"\<movw\ze\s" contained
syn match	gasOpcode_AVR		"\<mul\ze\s" contained
syn match	gasOpcode_AVR		"\<muls\ze\s" contained
syn match	gasOpcode_AVR		"\<mulsu\ze\s" contained
syn match	gasOpcode_AVR		"\<neg\ze\s" contained
syn match	gasOpcode_AVR		"\<nop\ze\s" contained
syn match	gasOpcode_AVR		"\<or\ze\s" contained
syn match	gasOpcode_AVR		"\<ori\ze\s" contained
syn match	gasOpcode_AVR		"\<out\ze\s" contained
syn match	gasOpcode_AVR		"\<pop\ze\s" contained
syn match	gasOpcode_AVR		"\<push\ze\s" contained
syn match	gasOpcode_AVR		"\<rcall\ze\s" contained
syn match	gasOpcode_AVR		"\<ret\ze\s" contained
syn match	gasOpcode_AVR		"\<reti\ze\s" contained
syn match	gasOpcode_AVR		"\<rjmp\ze\s" contained
syn match	gasOpcode_AVR		"\<rol\ze\s" contained
syn match	gasOpcode_AVR		"\<ror\ze\s" contained
syn match	gasOpcode_AVR		"\<sbc\ze\s" contained
syn match	gasOpcode_AVR		"\<sbci\ze\s" contained
syn match	gasOpcode_AVR		"\<sbi\ze\s" contained
syn match	gasOpcode_AVR		"\<sbic\ze\s" contained
syn match	gasOpcode_AVR		"\<sbis\ze\s" contained
syn match	gasOpcode_AVR		"\<sbiw\ze\s" contained
syn match	gasOpcode_AVR		"\<sbr\ze\s" contained
syn match	gasOpcode_AVR		"\<sbrc\ze\s" contained
syn match	gasOpcode_AVR		"\<sbrs\ze\s" contained
syn match	gasOpcode_AVR		"\<sec\ze\s" contained
syn match	gasOpcode_AVR		"\<seh\ze\s" contained
syn match	gasOpcode_AVR		"\<sei\ze\s" contained
syn match	gasOpcode_AVR		"\<sen\ze\s" contained
syn match	gasOpcode_AVR		"\<ser\ze\s" contained
syn match	gasOpcode_AVR		"\<ses\ze\s" contained
syn match	gasOpcode_AVR		"\<set\ze\s" contained
syn match	gasOpcode_AVR		"\<sev\ze\s" contained
syn match	gasOpcode_AVR		"\<sez\ze\s" contained
syn match	gasOpcode_AVR		"\<sleep\ze\s" contained
syn match	gasOpcode_AVR		"\<spm\ze\s" contained
syn match	gasOpcode_AVR		"\<st\ze\s" contained
syn match	gasOpcode_AVR		"\<std\ze\s" contained
syn match	gasOpcode_AVR		"\<sts\ze\s" contained
syn match	gasOpcode_AVR		"\<sub\ze\s" contained
syn match	gasOpcode_AVR		"\<subi\ze\s" contained
syn match	gasOpcode_AVR		"\<swap\ze\s" contained
syn match	gasOpcode_AVR		"\<tst\ze\s" contained
syn match	gasOpcode_AVR		"\<wdr\ze\s" contained
syn match	gasOpcode_AVR		"\<xch\ze\s" contained
" end of AVR Opcodes }}}

syn match	gasPseudoOpcode		"\<mov64\ze\s" contained

" end of Opcodes }}}

" Links {{{
syn cluster	dascMacro		add=gasMacro
hi def link	gasMacro		Macro

syn cluster	dascRegister		add=gasRegisterX86,gasRegisterX86Cr,gasRegisterX86Dr,gasRegisterX86MMX,gasRegisterX86SSE
hi def link	gasRegisterX86		Identifier
hi def link	gasRegisterX86Cr	Identifier
hi def link	gasRegisterX86Dr	Identifier
hi def link	gasRegisterX86MMX	Identifier
hi def link	gasRegisterX86SSE	Identifier

syn cluster	dascType		add=gasType
hi def link	gasType			Type

hi def link	dascInstruction		Statement
hi def link	dascRegister		Identifier
hi def link	dascType		Type

syn cluster	dascInstruction		add=gasPseudoOpcode
hi def link	gasPseudoOpcode		dascInstruction

" Initial mapping => Keyword.
func! s:MapOpcode (group, cpu, ext)
	let himap = 'Statement'

	if exists('g:gasDisableOpcodes')
		if index(split(g:gasDisableOpcodes), a:cpu) != -1
			let himap = 'Error'
		endif
		if index(split(g:gasDisableOpcodes), a:ext) != -1
			let himap = 'Error'
		endif
	endif

	if exists('b:gasDisableOpcodes')
		if index(split(b:gasDisableOpcodes), a:cpu) != -1
			let himap = 'Error'
		endif
		if index(split(b:gasDisableOpcodes), a:ext) != -1
			let himap = 'Error'
		endif
	endif

	exe 'syn cluster dascInstruction add='.a:group
	exe 'hi link '.a:group.' '.himap
endf

call <SID>MapOpcode('gasOpcode_186_Base'       , '186'        , 'base')
call <SID>MapOpcode('gasOpcode_286_Base'       , '286'        , 'base')
call <SID>MapOpcode('gasOpcode_3862_Base'      , '3862'       , 'base')
call <SID>MapOpcode('gasOpcode_386_Base'       , '386'        , 'base')
call <SID>MapOpcode('gasOpcode_486_Base'       , '486'        , 'base')
call <SID>MapOpcode('gasOpcode_8086_Base'      , '8086'       , 'base')
call <SID>MapOpcode('gasOpcode_AMD_SSE4A'      , 'amd'        , 'sse4a')
call <SID>MapOpcode('gasOpcode_AVR'            , 'avr'        , 'base')
call <SID>MapOpcode('gasOpcode_IA64_Base'      , 'ia64'       , 'base')
call <SID>MapOpcode('gasOpcode_KATMAI_Base'    , 'katmai'     , 'base')
call <SID>MapOpcode('gasOpcode_KATMAI_MMX'     , 'katmai'     , 'mmx')
call <SID>MapOpcode('gasOpcode_KATMAI_MMX2'    , 'katmai'     , 'mmx2')
call <SID>MapOpcode('gasOpcode_KATMAI_SSE'     , 'katmai'     , 'sse')
call <SID>MapOpcode('gasOpcode_NEHALEM_Base'   , 'nehalem'    , 'base')
call <SID>MapOpcode('gasOpcode_SSE'            , '186'        , 'sse')
call <SID>MapOpcode('gasOpcode_SSE2'           , 'willamette' , 'sse')
call <SID>MapOpcode('gasOpcode_P6_Base'        , 'p6'         , 'base')
call <SID>MapOpcode('gasOpcode_P6_SSE'         , 'p6'         , 'sse')
call <SID>MapOpcode('gasOpcode_PENTM_Base'     , 'pentium_m'  , 'base')
call <SID>MapOpcode('gasOpcode_PENT_Base'      , 'pentium'    , 'base')
call <SID>MapOpcode('gasOpcode_PENT_MMX'       , 'pentium'    , 'mmx')
call <SID>MapOpcode('gasOpcode_PRESCOTT_Base'  , 'prescott'   , 'base')
call <SID>MapOpcode('gasOpcode_PRESCOTT_SSE3'  , 'prescott'   , 'sse3')
call <SID>MapOpcode('gasOpcode_SANDYBRIDGE_AVX', 'sandybridge', 'avx')
call <SID>MapOpcode('gasOpcode_X642_Base'      , 'x642'       , 'base')
call <SID>MapOpcode('gasOpcode_X64_Base'       , 'x64'        , 'base')
call <SID>MapOpcode('gasOpcode_X64_MMX'        , 'x64'        , 'mmx')
call <SID>MapOpcode('gasOpcode_X64_SSE'        , 'x64'        , 'sse')
call <SID>MapOpcode('gasOpcode_X64_SSE2'       , 'x64'        , 'sse2')
call <SID>MapOpcode('gasOpcode_X64_SSE41'      , 'x64'        , 'sse4.1')
call <SID>MapOpcode('gasOpcode_X64_SSE42'      , 'x64'        , 'sse4.2')
call <SID>MapOpcode('gasOpcode_X64_VMX'        , 'x64'        , 'vmx')
call <SID>MapOpcode('gasOpcode_X86_64_Base'    , 'x64'        , 'base')

" end of Links }}}

" vim: ts=8:fdm=marker:ff=unix:foldopen=all:foldclose=all
