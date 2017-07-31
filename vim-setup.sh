#!/bin/bash
#Title: vim-lillypad install
#Author: lillypad
echo "lillypad's Vim configuration Install Script"
sudo apt-get -y update
sudo apt-get -y install vim git nodejs npm tidy build-essential cmake python-dev python3-dev curl
sudo npm install -g jshint
mkdir -p ~/.fonts
cd ~/.fonts
curl -LSso ~/.fonts/powerline.ttf https://github.com/powerline/fonts/raw/master/DejaVuSansMono/DejaVu%20Sans%20Mono%20for%20Powerline.ttf
fc-cache -fv
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
cd ~/.vim/bundle
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/vim-airline/vim-airline.git
git clone https://github.com/vim-airline/vim-airline-themes.git
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/SirVer/ultisnips.git
git clone https://github.com/nathanaelkane/vim-indent-guides.git
git clone https://github.com/scrooloose/nerdcommenter.git
git clone https://github.com/ternjs/tern_for_vim.git
cd ~/.vim/bundle/tern_for_vim
npm install
cd ~
>.tern-config
echo '{' >> .tern-config
echo '    "libs": [' >> .tern-config
echo '    "browser",' >> .tern-config
echo '    "jquery"' >> .tern-config
echo '    ],' >> .tern-config
echo '    "plugins": {' >> .tern-config
echo '    "node": {}' >> .tern-config  
echo '    }' >> .tern-config
echo '}' >> .tern-config
cd ~/.vim/bundle
git clone https://github.com/Valloric/YouCompleteMe.git
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
./install.py --tern-completer
./install.py --clang-completer
cd ..
git clone https://github.com/tweekmonster/spellrotate.vim.git
git clone https://github.com/davidhalter/jedi.git
git clone https://github.com/vim-syntastic/syntastic.git
git clone https://github.com/vim-scripts/SyntaxRange.git
git clone https://github.com/mattn/emmet-vim.git
git clone https://github.com/honza/vim-snippets.git
git clone https://github.com/severin-lemaignan/vim-minimap.git
git clone https://github.com/kien/ctrlp.vim.git
git clone https://github.com/jiangmiao/auto-pairs.git
git clone https://github.com/flazz/vim-colorschemes.git
cd ~
>.vimrc
echo 'execute pathogen#infect()' >> .vimrc
echo '"AutoStart NERDTree, Minimap, and Airline' >> .vimrc
echo 'autocmd VimEnter * NERDTree' >> .vimrc
echo 'autocmd VimEnter * Minimap' >> .vimrc
echo 'autocmd VimEnter * AirlineTheme jellybeans' >> .vimrc
echo 'filetype plugin on' >> .vimrc
echo '"Set Color Scheme' >> .vimrc
echo 'colorscheme tir_black' >> .vimrc
echo '"Settings for Indentation Guides' >> .vimrc
echo 'set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab' >> .vimrc
echo '"set ts=4 sw=4 et' >> .vimrc
echo 'let g:indent_guides_enable_on_vim_startup = 1' >> .vimrc
echo 'let g:indent_guides_guide_size = 1' >> .vimrc
echo '"Set Snippet Bindings' >> .vimrc
echo 'let g:UltiSnipsExpandTrigger="<c-j>"' >> .vimrc
echo 'let g:UltiSnipsJumpForwardTrigger="<c-b>"' >> .vimrc
echo 'let g:UltiSnipsJumpBackwardTrigger="<c-z>"' >> .vimrc
echo 'let g:ConqueTerm_StartMessages = 0' >> .vimrc
echo '"NERDTree Ignore Files' >> .vimrc
echo "let NERDTreeIgnore = ['\.pyc$']" >> .vimrc
echo '"YouCompletMe Close Preview Pane' >> .vimrc
echo 'let g:ycm_autoclose_preview_window_after_insertion = 1' >> .vimrc
echo 'let g:ycm_autoclose_preview_window_after_completion = 1' >> .vimrc
echo 'set laststatus=2' >> .vimrc
echo 'set mouse=a' >> .vimrc
echo 'set encoding=utf-8' >> .vimrc
echo 'let g:airline_powerline_fonts = 1' >> .vimrc
echo 'set t_Co=256' >> .vimrc
echo 'syntax on' >> .vimrc
echo '"Syntastic Settings' >> .vimrc
echo 'set statusline+=%#warningmsg#' >> .vimrc
echo 'set statusline+=%{SyntasticStatuslineFlag()}' >> .vimrc
echo 'set statusline+=%*' >> .vimrc
echo 'let g:syntastic_always_populate_loc_list = 1' >> .vimrc
echo 'let g:syntastic_auto_loc_list = 1' >> .vimrc
echo 'let g:syntastic_check_on_open = 1' >> .vimrc
echo 'let g:syntastic_check_on_wq = 0' >> .vimrc
echo "let g:syntastic_javascript_checkers = ['jshint']" >> .vimrc
echo 'let g:airline#extensions#tabline#enabled = 1' >> .vimrc
echo 'set number' >> .vimrc
echo 'nnoremap <C-n> :bn <Enter>' >> .vimrc
echo 'inoremap <C-n> <C-c> :bn <Enter>' >> .vimrc
echo 'nnoremap <C-b> :bp <Enter>' >> .vimrc
echo 'inoremap <C-b> <C-c> :bp <Enter>' >> .vimrc
echo 'map Q :qa <Enter>' >> .vimrc
echo 'map W :w <Enter>' >> .vimrc
echo 'nnoremap <C-o> :E <Enter>' >> .vimrc
echo 'inoremap <C-o> <C-c> :E <Enter>' >> .vimrc
echo 'nnoremap <C-x> :MinimapClose <Enter> :NERDTreeClose <Enter> :bd <Enter> :bp <Enter> :NERDTree <Enter> :wincmd w <Enter> :Minimap <Enter>' >> .vimrc
echo 'nnoremap <C-t> :ConqueTermSplit bash <Enter>' >> .vimrc
echo 'inoremap <C-x> <C-c> :bd <Enter>' >> .vimrc
echo '' >> .vimrc
echo '"Spelling On' >> .vimrc
echo 'nnoremap <leader>zc :set spell spelllang=en_us <Enter>' >> .vimrc
echo '"Spelling Off' >> .vimrc
echo 'nnoremap <leader>zq :set nospell <Enter>' >> .vimrc
echo '' >> .vimrc
echo '"Syntax for Multi Language Files' >> .vimrc
echo "nmap <leader>shtml :call SyntaxRange#Include('@begin=html@', '@end=html@', 'html', 'SpecialComment') <Enter>" >> .vimrc
echo "nmap <leader>sc :call SyntaxRange#Include('@begin=c@', '@end=c@', 'c', 'SpecialComment') <Enter>" >> .vimrc
echo "nmap <leader>sjs :call SyntaxRange#Include('@begin=js@', '@end=js@', 'js', 'SpecialComment') <Enter>" >> .vimrc
echo "nmap <leader>spy :call SyntaxRange#Include('@begin=py@', '@end=py@', 'python', 'SpecialComment') <Enter>" >> .vimrc
echo '' >> .vimrc
echo '"Spell Rotate Bindings' >> .vimrc
echo 'nmap <leader>zn <Plug>(SpellRotateForward)' >> .vimrc
echo 'nmap <leader>zp <Plug>(SpellRotateBackward)' >> .vimrc
echo 'vmap <leader>zn <Plug>(SpellRotateForwardV)' >> .vimrc
echo 'vmap <leader>zp <Plug>(SpellRotateBackwardV)' >> .vimrc
echo '' >> .vimrc
echo '"Move cursor to file buffer from NERDTree' >> .vimrc
echo 'autocmd VimEnter * wincmd w' >> .vimrc
echo 'Vim Plugin Setup is complete!'
