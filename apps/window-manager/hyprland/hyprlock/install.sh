if [ "$INSTALLER_OS" = Linux ]; then 
    git clone https://github.com/hyprwm/hyprlock.git /usr/local/hyprlock
    cd /usr/local/hyprlock

    cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -S . -B ./build
    cmake --build ./build --config Release --target hyprlock -j`nproc 2>/dev/null || getconf _NPROCESSORS_CONF`
    sudo cmake --install build

    INSTALLER_CONFIG_SOURCE=$INSTALLER_DIRECTORY/hyprlock.conf
    INSTALLER_CONFIG_DESTINATION=$HOME/.config/hypr/hyprlock.conf
    
    configure
fi
