case $OS in
    Linux)
        apt install nvim;
        ;;
    Mac)
        brew install nvim;
        ;;
esac

ln -s $DOTFILES_PATH/apps/terminal/nvim/config ~/.config/nvim
