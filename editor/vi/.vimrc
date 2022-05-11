set autoindent			" auto indenting
"set background=light
set backspace=eol,start,indent
set cindent
set enc=utf-8
set encoding=utf-8
set expandtab			" convert to space on tab
set fileencoding=utf-8	" file saving encoding
set history=1000		" keep 1000 lines of history
set hlsearch            " highlight the last searched term
set ignorecase			" ignore case when search
set incsearch			" incremental search
set nobackup
set nocompatible
"set number
set ruler               " show the cursor position
set shiftwidth=4		" auto indent size
set smartindent
set softtabstop=2		" use space for tab and delete bundle
set tabstop=4
set visualbell			" blink insted of beep when wrong key input
set wrap

syntax on               " syntax highlighting
filetype plugin on      " use the file type plugins
"colorscheme evening

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
\ if ! exists("g:leave_my_cursor_position_alone") |
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\ exe "normal g'\"" |
\ endif |
\ endif
