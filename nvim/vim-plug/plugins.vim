call plug#begin("~/.config/nvim/autoload/plugged")

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'kovisoft/paredit', { 'for': ['clojure', 'scheme'] }

call plug#end()
