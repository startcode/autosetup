git clone https://github.com/vim/vim.git
cd vim/src
make distclean
./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-pythoninterp=yes \
            --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            --enable-gui=gtk2 --enable-cscope \
               --prefix=/usr  \
            --enable-fontset \
            --enable-xim \
            --enable-gui=auto \
            --enable-luainterp=yes \
            --enable-pythoninterp=yes \
            --enable-rubyinterp=yes \
            --enable-cscope \
            --with-x \
            --with-compiledby=erocpil \
            --with-features=huge
make
sudo make install

cd ../..
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
cp vimrc ~/.vimrc
vim +PluginInstall +qall
~/.vim/bundle/YouCompleteMe/install.sh --clang-completer
