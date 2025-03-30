if [ "$INSTALLER_OS" = Linux ]; then 
    git clone https://github.com/hyprwm/hyprpaper.git /usr/local/hyprpaper
    cd /usr/local/hyprpaper

    cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
    cmake --build ./build --config Release --target hyprpaper -j`nproc 2>/dev/null || getconf _NPROCESSORS_CONF`
    sudo cmake --install build

    INSTALLER_CONFIG_SOURCE=$INSTALLER_DIRECTORY/hyprpaper.conf
    INSTALLER_CONFIG_DESTINATION=$HOME/.config/hypr/hyprpaper.conf
    
    configure
fi
