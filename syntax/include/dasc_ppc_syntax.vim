" Vim syntax file for PPC Assembler
" Language:		PPC Assembler
" Original Version:	0.2
" Original Author:	Michael Brandt <Michael.Brandt@emsyso.de>
" Original Homepage:	http://github.com/gerard/dotfiles
" License:		Redistribute under the same terms as Vim itself
" Purpose:		PPC Assembly Syntax Highlighting
" Major portions taken verbatim or adapted from the ppc.vim syntax file,
" see: https://github.com/gerard/dotfiles/tree/master/vim/syntax

" Registers {{{
let b:i = 0
while b:i < 32
  " General purpose registers.
  exec 'syn match ppcRegister "\<r'.b:i.'\>" contained'
  " fp registers.
  exec 'syn match ppcRegister "\<f'.b:i.'\>" contained'
  let b:i += 1
endwhile
unlet b:i
" sp is often used as synonym for r1.
syn keyword	ppcRegister		sp contained

syn match	ppcSpr			"\<\(csrr[01]\|ctr\|dac[12]\|dbcr[0-2]\|dbsr\|dear\|dec\|decar\|dvc[12]\|esr\|evpr\|hid[01]\|iac[1-4]\)\>" contained

let b:i = 0
while b:i < 16
  exec 'syn match ppcSpr		"\<ivor'.b:i.'\>" contained'
  let b:i += 1
endwhile
unlet b:i

" Special registers.
syn match	ppcSpr			"\<\(lr\|msscr0\|cr0\|pid\|pir\|pvr\|sprg[0-7]\|srr[01]\|tbl\|tbu\|tcr\|tsr\|usprg0\|xer\)\>" contained
" Conditional registers.
syn match	ppcSpr			"\<\(eq\|lt\|gt\|cr[0-7]\)\>" contained
" end of Registers }}}

" Instructions {{{
" Book E Mnemoics.
syn match	ppcMnemonic		"\<\(add\.\?\|addc\.\?\|addco\.\?\|adde\.\?\|adde64\|adde64o\|addeo\.\?\|addi\|addic\.\?\|addis\|addme\.\?\|addme64\|addme64o\|addmeo\.\?\|addo\.\?\|addze\.\?\|addze64\|addze64o\|addzeo\.\?\|and\.\|andc\.\?\|andi\.\|andis\.\|b\|ba\|bc\|bca\|bcctr\|bcctre\)\ze\s" contained

syn match	ppcMnemonic		"\<\(bcctrel\|bcctrl\|bce\|bcea\|bcel\|bcela\|bcl\|bcla\|bclr\|bclre\|bclrel\|bclrl\|be\|bea\|bel\|bela\|bl\|bla\|cmp\|cmpi\|cmpl\|cmpli\|cntlzd\|cntlzw\|cntlzw\.\|crand\|crandc\|creqv\|crnand\|crnor\|cror\|crorc\|crxor\|dcba\|dcbae\|dcbf\|dcbfe\|dcbi\|dcbie\|dcbst\|dcbste\|dcbt\|dcbte\|dcbtst\|dcbtste\|dcbz\|dcbze\)\ze\s" contained

syn match	ppcMnemonic		"\<\(divd\|divdo\|divdu\|divduo\|divw\.\?\|divwo\.\?\|divwu\.\?\|divwuo\.\?\|eqv\.\?\|extsb\.\?\|extsh\.\?\|extsw\|fabs\.\?\|fadd\.\?\|fadds\.\?\|fcfid\|fcmpo\|fcmpu\|fctid\|fctidz\|fctiw\.\?\|fctiwz\.\?\|fdiv\.\?\|fdivs\.\?\|fmadd\.\?\|fmadds\.\?\|fmr\.\?\|fmsub\.\?\|fmsubs\.\?\)\ze\s" contained

syn match	ppcMnemonic		"\<\(fmul\.\?\|fmuls\.\?\|fnabs\.\?\|fneg\.\?\|fnmadd\.\?\|fnmadds\.\?\|fnmsub\.\?\|fnmsubs\.\?\|fres\.\?\|frsp\.\?\|frsqrte\.\?\|fsel\.\?\|fsqrt\.\?\|fsqrts\.\?\|fsub\.\?\|fsubs\.\?\|icbi\|icbie\|icbt\|icbte\|isync\|lbz\|lbze\|lbzu\|lbzue\|lbzux\|lbzuxe\|lbzx\|lbzxe\|ldarxe\)\ze\s" contained

syn match	ppcMnemonic		"\<\(ld\|lde\|ldue\|lduxe\|ldx\|ldxe\|lfd\|lfde\|lfdu\|lfdue\|lfdux\|lfduxe\|lfdx\|lfdxe\|lfs\|lfse\|lfsu\|lfsue\|lfsux\|lfsuxe\|lfsx\|lfsxe\|lha\|lhae\|lhau\|lhaue\|lhaux\|lhauxe\|lhax\|lhaxe\|lhbrx\|lhbrxe\|lhz\|lhze\|lhzu\|lhzue\|lhzux\|lhzuxe\|lhzx\|lhzxe\|lmw\|lswi\|lswx\|lwarx\|lwarxe\|lwbrx\|lwbrxe\|lwz\|lwze\)\ze\s" contained

syn match	ppcMnemonic		"\<\(lwzu\|lwzue\|lwzux\|lwzuxe\|lwzx\|lwzxe\|mbar\|mcrf\|mcrfs\|mcrxr\|mcrxr64\|mfapidi\|mfcr\|mfdcr\|mffs\.\?\|mfmsr\|mfspr\|mfsr\|mftb\|msync\|mtcrf\|mtdcr\|mtfsb0\.\?\|mtfsb1\.\?\|mtfsf\.\?\|mtfsfi\.\?\|mtmsr\|mtspr\|mtsr\|mtsrin\|mulhd\|mulhdu\|mulhw\.\?\|mulhwu\.\?\|mulld\|mulldo\|mulli\|mullw\.\?\|mullwo\.\?\|nand\.\?\)\>\ze\s" contained

syn match	ppcMnemonic		"\<\(neg\.\?\|nego\.\?\|nor\.\?\|or\.\|orc\.\?\|ori\|oris\|rfci\|rfi\|rldcl\|rldcr\|rldic\|rldicl\|rldicr\|rldimi\|rlwimi\.\?\|rlwinm\.\?\|rlwnm\.\?\|sc\|sld\|slw\.\?\|srad\|sradi\|sraw\.\?\|srawi\.\?\|srd\|srw\.\?\|stb\|stbe\|stbue\|stbu\|stbux\|stbuxe\|stbx\|stdcxe\.\?\)\ze\s" contained

syn match	ppcMnemonic		"\<\(std\|stde\|stdu\|stdue\|stduxe\|stdxe\|stfd\|stfde\|stfdu\|stfdue\|stfdux\|stfduxe\|stfdx\|stfdxe\|stfiwx\|stfiwxe\|stfs\|stfse\|stfsu\|stfsue\|stfsux\|stfsuxe\|stfsx\|stfsxe\|sth\|sthbrx\|sthbrxe\|sthe\|sthu\|sthue\|sthux\|sthuxe\|sthx\|sthxe\|stmw\|stswi\|stswx\|stw\|stwbrx\|stwbrxe\|stwcx\.\|stwcxe\.\|stwe\|stwu\|stwue\|stwux\|stwuxe\|stwx\|stwxe\)\ze\s" contained

syn match	ppcMnemonic		"\<\(subo\.\?\|subf\.\?\|subfc\.\?\|subfco\.\?\|subfe\.\?\|subfe64\|subfe64o\|subfeo\.\?\|subfic\|subfme\.\?\|subfme64\|subfme64o\|subfmeo\.\?\|subfo\.\?\|subfze\.\?\|subfze64\|subfze64o\|subfzeo\|subfzeo\.\?\|td\|tdi\|tlbivax\|tlbivaxe\|tlbre\|tlbsx\|tlbsxe\|tlbwe\|tw\|twi\|wrtee\|wrteei\|xor\.\?\|xori\|xoris\)\ze\s" contained

syn match	ppcSimplified		"\<\(extlwi\.\?\|extrwi\.\?\|inslwi\.\?\|insrwi\.\?\|la\|mr\.\?\|mtcr\|rotrwi\.\?\|slwi\.\?\|sli\.\?\|srwi\.\?\|sri\.\?\|clrrwi\.\?\|clrlslwi\.\?\)\ze\s" contained
syn keyword	ppcSimplified		nop

" Exclude dasc preproc.
syn match	ppcSimplified		"\(\.\(els\)\?if.*\|error.*\)\@<!\<\(not\|or\|and\)\ze\s" contained

syn keyword	ppcSimplified		bctr blr contained

" Simplified Mnemonics for Subtract Instructions.
syn match	ppcSimplified		"\<\(subi\|subis\|subic\.\?\)\ze\s" contained
syn match	ppcSimplified		"\<\(sub\.\?\|subc\)\ze\s" contained

" Simplified Mnemonics for Word Compare Instructions.
syn match	ppcSimplified		"\<\(cmpwi\|cmpw\|cmplwi\|cmplw\)\ze\s" contained

" Simplified branch mnemonics.
syn match	ppcSimplified		"\<\(blr\|bctr\|blrl\|bctrl\)\ze\s" contained

" Add bney bley bgty and so on.
" I don't know their semantics or where you can read their specs.
syn match	ppcSimplified		"\<\(bt\|bf\|bdnz\|bdnzt\|bdnzf\|bdz\|bdzt\|bdzf\|blt\|ble\|beq\|bge\|bgt\|bnl\|bne\|bng\|bso\|bns\|bun\|bnu\)\(a\|lr\|tlr\|ctr\|tl\|la\|lrl\|ctrl\|y\)\?\ze\s" contained

" Simplified mnemonics for traps.
syn match	ppcSimplified		"\<\(trap\|twlti\|twlt\|twlei\|twle\|tweqi\|tweq\|twgei\|twge\|twgti\|twgt\|twnli\|twnl\|twnei\|twne\|twngi\|twng\|twllti\|twllt\|twllei\|twlle\|twlgei\|twlge\|twlgti\|twlgt\|twlnli\|twlnl\|twlngi\|twlng\)\ze\s" contained

" Simplified mnemonics for SPRs.
syn match	ppcSimplified		"\<\(mtxer\|mtlr\|mtctr\|mtdsisr\|mtdar\|mtdec\|mtsdr1\|mtsrr0\|mtsrr1\|mtsprg\|mtear\)\ze\s" contained
syn match	ppcSimplified		"\<\(mttbl\|mttbu\|mtibatu\|mtibatl\|mtdbatu\|mtdbatl\)\ze\s" contained
syn match	ppcSimplified		"\<\(mfxer\|mflr\|mfctr\|mfdsisr\|mfdar\|mfdec\|mfsdr1\|mfsrr0\|mfsrr1\|mfsprg\|mfear\)\ze\s" contained
syn match	ppcSimplified		"\<\(mftb\|mftbu\|mfpvr\|mfibatu\|mfibatl\|mfdbatu\|mfdbatl\)\ze\s" contained

syn match	ppcSimplified		"\<\(li\|lis\|rotlwi\)\ze\s" contained

" arch specific ?
syn match	ppcMnemonic		"\<\(eieio\|sync\)\ze\s" contained

" Optional instructions.
syn match	ppcMnemonic		"\<\(tlbia\|tlbie\|tlbsync\)\ze\s" contained
" end of Instructions }}}

" Links {{{
syn cluster	dascInstruction		add=ppcMnemonic,ppcSimplified,ppcMnemonicSyn
hi def link	ppcMnemonic		Statement

hi def link	ppcSimplified		Statement
hi def link	ppcMnemonicSyn		Statement

syn cluster	dascRegister		add=ppcRegister,ppcSpr
hi def link	ppcRegister		Identifier
hi def link	ppcSpr			Identifier
" end of Links }}}

" vim: ts=8:fdm=marker:ff=unix:foldopen=all:foldclose=all
