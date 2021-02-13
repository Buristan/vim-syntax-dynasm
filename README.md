DynASM Syntax for Vim
=========================

Syntax file and other settings for [DynASM](https://luajit.org/dynasm.html).

Install
-------

Can be installed via Vim add-in manager such as
[Plug](https://github.com/junegunn/vim-plug),
[Vundle](https://github.com/gmarik/vundle) or
[Pathogen](https://github.com/tpope/vim-pathogen).

Usage
-----

Once the files are installed the syntax highlighting will be
automatically enabled anytime you edit a `.dasc` file.

Also global variable `g:DascArch` is set to the name of the corresponding
CPU architecture:
- `"x86"`
- `"x64"`
- `"arm"`
- `"arm64"`
- `"mips"`
- `"mips64"`
- `"ppc"`

and can be used for your own needs. If architecture is unknown variable
contains an empty string.

If you want to create your own syntax groups declare them as
contained to `@dascExtra` cluster.

Syntax highlighting
-------------------

Syntax highlighting for DynASM supports the following DynASM arches:

### X86 and X64

For these architectures syntax file is adapted from
[Shirk/vim-gas](https://github.com/Shirk/vim-gas) repository.
It looks like:
![Obligatory screenshot](https://raw.github.com/Buristan/vim-syntax-dynasm/master/img-examples/example-x86.png)

### ARM

For this architecture syntax file is adapted from
[ARM9/arm-syntax-vim](https://github.com/ARM9/arm-syntax-vim) repository.
It looks like:
![Obligatory screenshot](https://raw.github.com/Buristan/vim-syntax-dynasm/master/img-examples/example-arm.png)

### AARCH64 (a.k.a arm64)

For this architecture syntax file is adapted from
[compnerd/arm64asm](http://github.com/compnerd/arm64asm) repository.
It looks like:
![Obligatory screenshot](https://raw.github.com/Buristan/vim-syntax-dynasm/master/img-examples/example-arm64.png)

### MIPS and MIPS64

For these architectures syntax file is adapted from
[harenome/vim-mipssyntax](http://github.com/harenome/vim-mipssyntax) repository.
It looks like:
![Obligatory screenshot](https://raw.github.com/Buristan/vim-syntax-dynasm/master/img-examples/example-mips.png)

### PPC

For this architecture syntax file is adapted from
[gerard/dotfiles](http://github.com/gerard/dotfiles) repository.
It looks like:
![Obligatory screenshot](https://raw.github.com/Buristan/vim-syntax-dynasm/master/img-examples/example-ppc.png)

Feedback
--------

Please report bugs or asked questions at [issues](https://github.com/Buristan/vim-syntax-dynasm/issues).
Pull requests are welcome!

See also
--------

You may be interested in
[after syntax extension](https://github.com/Buristan/vim-after-syntax-dasc-luajit)
for LuaJIT DynASM highlighting.
