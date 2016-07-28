#!/bin/bash
echo "lillypad's Vim configuration Install Script"
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt-get -y install vim git vim-pathogen vim-youcompleteme
vam install youcompleteme
vam install pathogen
mkdir ~/.vim/bundle
cd ~/.vim/bundle
git clone git://github.com/tpope/vim-fugitive.git
git clone https://github.com/vim-airline/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes
git clone https://github.com/scrooloose/nerdtree.git
cd ~
touch .vimrc
echo 'execute pathogen#infect()' >> .vimrc
echo 'autocmd VimEnter * NERDTree' >> .vimrc
echo "let NERDTreeIgnore = ['\.pyc$']" >> .vimrc
echo 'set laststatus=2' >> .vimrc
echo 'set mouse=a' >> .vimrc
echo 'color desert' >> .vimrc
echo 'set t_Co=256' >> .vimrc
echo 'syntax on' >> .vimrc
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
echo 'nnoremap <C-x> :bd <Enter>' >> .vimrc
echo 'inoremap <C-x> <C-c> :bd <Enter>' >> .vimrc
echo 'Vim Plugin sSetup is complete!'
