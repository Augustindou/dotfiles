return {
    cmd = { 'rust-analyzer' },
    filetypes = { 'rust' },
    root_markers = {
        'Cargo.toml',
        'rust-project.json',
        '.git',
    },
    settings = {
        ['rust-analyzer'] = {
            server = {
                extraEnv = {
                    RUST_ANALYZER_MEMORY_USAGE_THRESHOLD = '2048', -- MB
                },
            },
            check = {
                command = 'clippy',
            },
            procMacro = {
                enable = true,
            },
            cargo = {
                buildScripts = {
                    enable = false, -- disable if crashing on build.rs
                },
            },
        },
    },
}
