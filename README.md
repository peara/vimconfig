# vimconfig

## build Vim from source

```
// install vim-gtk dependencies
sudo apt build-dep vim-gtk

cd ~
git clone https://github.com/vim/vim.git
cd vim

./configure --with-features=huge \
            --enable-multibyte \
	    --enable-rubyinterp=yes \
	    --enable-pythoninterp=yes \
	    --with-python-config-dir=/usr/lib/python2.7/config \
	    --enable-python3interp=yes \
	    --with-python3-config-dir=/usr/lib/python3.6/config \
	    --enable-perlinterp=yes \
            --with-x \
	    --enable-luainterp=yes \
            --enable-gui=gtk2 \
            --enable-cscope \
	   --prefix=/usr/local

make VIMRUNTIMEDIR=/usr/local/share/vim/vim81
```
