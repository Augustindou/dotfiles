#!/bin/bash

# Thanks Donovan ! 
# https://gist.github.com/matthewjberger/7dd7e079f282f8138a9dc3b045ebefa0?permalink_comment_id=4005789#gistcomment-4005789

declare -a fonts=(
    Ubuntu
    UbuntuMono
)

version='3.4.0'
fonts_dir="${HOME}/.local/share/fonts"

if [[ ! -d "$fonts_dir" ]]; then
    mkdir -p "$fonts_dir"
fi

for font in "${fonts[@]}"; do
    if (fc-list | rg "$font Nerd Font") >/dev/null; then 
        info "Skipping font install: $font"
    else
        info "Installing font: $font"

        zip_file="${font}.zip"
        download_url="https://github.com/ryanoasis/nerd-fonts/releases/download/v${version}/${zip_file}"
        echo "Downloading $download_url"
        wget "$download_url"
        unzip "$zip_file" -d "$fonts_dir"
        rm "$zip_file"
    fi 
done

find "$fonts_dir" -name '*Windows Compatible*' -delete

fc-cache -fv >/dev/null
