
if [ ! -f "/home/greg/.vim/autoload/pathogen.vim" ]; then
	echo "creating directory"
	mkdir -p ~/.vim/autoload/ ~/.vim/bundle 
	curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim 
	echo "curled"
fi
