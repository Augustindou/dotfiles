
# Use this as `install apt:vscode brew:visual-studio-code`
install () {
    if [ -z "${INSTALLER_OS}" ]; then 
        error "INSTALLER_OS not set"; 
        exit 1; 
    fi 

    for arg in "$@"
    do
        local installer=${arg%\:*}
        local program_name=${arg#*\:}

        case $installer in 
            apt)
                
                if command -v apt 2>&1 >/dev/null; then 
                    sudo apt install $program_name;
                    success "Installed $program_name";
                    return;
                fi
                ;;
            brew)
                if command -v brew 2>&1 >/dev/null; then
                    brew install $program_name;
                    success "Installed $program_name";
                    return;
                fi
                ;;
            *) 
                error "Unknown installer: $installer";
                exit 1;
                ;;
        esac
    done

}

# Set all three variables and the settings will be symlinked
configure () {
    if [ -z "${INSTALLER_CONFIG_SOURCE}" ]; then 
        error "INSTALLER_CONFIG_SOURCE not set"; exit 1; 
    fi 
    if [ -z "${INSTALLER_CONFIG_DESTINATION}" ]; then 
        error "INSTALLER_CONFIG_DESTINATION not set"; exit 1; 
    fi 
    if [ -z "${INSTALLER_DIRECTORY}" ]; then 
        error "INSTALLER_DIRECTORY not set"; exit 1; 
    fi 

    if [ ! -d "$INSTALLER_CONFIG_DESTINATION" ] && [ ! -f "$INSTALLER_CONFIG_DESTINATION" ]; then 
        mkdir -p $(dirname "$INSTALLER_CONFIG_DESTINATION")
        ln -s "$INSTALLER_CONFIG_SOURCE" "$INSTALLER_CONFIG_DESTINATION"
        success "$(basename "$INSTALLER_DIRECTORY") config files symlinked"
    else 
        warning "Could not write $(basename "$INSTALLER_DIRECTORY") config: Path already exists"
    fi
}

# Logging methods
CLEAR='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'

info () {
    echo -e "${BLUE} $1 ${CLEAR}"
}

success () {
    echo -e "${GREEN} $1 ${CLEAR}"
}

warning () {
    echo -e "${ORANGE} $1 ${CLEAR}"
}

error () {
    echo -e "${RED} $1 ${CLEAR}"
}
