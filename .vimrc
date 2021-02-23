" URL: http://vim.wikia.com/wiki/Example_vimrc
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
" Description: A minimal, but feature rich, example .vimrc. If you are a
"              newbie, basing your first .vimrc on this file is a good choice.
"              If you're a more advanced user, building your own .vimrc based
"              on this file is still a good idea.

"------------------------------------------------------------
set scrolloff=5
set guicursor=
" set spelllang=en_us,sp
" set spell

" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live withn regs
"   call setreg(r, [])
"   endforut.

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

filetype plugin on

" Enable syntax highlighting
syntax on

set clipboard=unnamedplus
"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.

" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden

" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline


"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number
set norelativenumber

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>


"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.

" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
    set shiftwidth=4
    set softtabstop=4
    set expandtab

" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
"set shiftwidth=4
"set tabstop=4

"Path de tutorial Vin as an IDE (VimConf 2020 Talk)
set path+=./**,~,~/.vim
"set runtimepath^=~/.vim
set rtp+=/mnt/c/Users/usr/.fzf/bin


set noswapfile

"------------------------------------------------------------
" Mappings {{{th': '~/vimwiki/',
"                       \ 'syntax': 'markdown', 'ext': '.md'}]1
"
" Useful mappings
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
    map Y y$
    map <F6> :w<Enter>
    imap <F6> <Esc>:w<Enter>a

" Va a la guia, la borra e inserta
    inoremap ;gui <++><Esc>
    inoremap <F8> <Esc>/<++><Enter>"-c4l
    vnoremap <F8> <Esc>/<++><Enter>"-c4l
    nnoremap <F8> <Esc>/<++><Enter>"-c4l

" Toggle nohl
    inoremap <F9> <Esc>:nohl<CR>
    vnoremap <F9> <Esc>:nohl<CR>
    nnoremap <F9> <Esc>:nohl<CR>
" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
    nnoremap <C-L> :nohl<CR><C-L>
"Nick Janetakis leader + r sobre palabra seleccionada con * para remplazar en todo el documento
nnoremap <Leader>r :%s///g<Left><Left>

"TheFrugalComputerGuy Vim(20) Tab Indent pt1
"	set listchars=tab:	u2192
"	set listchars=eol:	u21b2
"------------------------------------------------------------

" plugins video 41 TheFrugalComputerGuy

call plug#begin('~/.vim/plugged')

Plug 'mattn/emmet-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimwiki/vimwiki'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

call plug#end()

"set leader key
let mapleader ="\<Space>"

"Vimwiki
"let g:vimwiki_list = [{'auto_diary_index': 1}]

let g:vimwiki_diary_months = {
    \1: 'Enero', 2: 'Febrero', 3: 'Marzo',
    \4: 'Abril', 5: 'Mayo', 6:'Junio',    
    \7: 'Julio', 8: 'Agosto', 9: 'Septiembre',
    \10: 'Octubre', 11: 'Noviembre', 12:'Diciembre'    
    \}
"set markdown syntax for vimwiki ~/vimwiki/
let g:vimwiki_list = [{'path': '/mnt/c/Users/User/documents/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md',
                      \'auto_diary_index': 1
                      \}]

"Enable just for html/css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" plugins airline -video 42 TheFrugalComputerGuy airline
"let g:airline_powerline_fonts = 1
"set guifont=Hack-Regular:h20


" vim-airline

"let g:airline_theme = 'powerlineish'
"let g:airline#extensions#branch#enabled = 1
"let g:airline#extensions#ale#enabled = 1
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tagbar#enabled = 1
"let g:airline_skip_empty_sections = 1

"*****************************************************************************

" vim-airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif

"autocompletado de php
"https://www.simplified.guide/vim/auto-complete-php
"https://www.youtube.com/watch?v=0k6zqjx3myI
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
