{ lib, config, pkgs, ... }:
let
  cfg = config.vscode;
  userCfg = config.user;
in
{
  options.vscode = {
    enable = lib.mkEnableOption "Enable vscode & keymappings";
  };

  config = lib.mkIf cfg.enable {
    home-manager.users.${userCfg.username}.programs.vscode = {
      enable = true;
      extensions = with pkgs.vscode-extensions; [
        vscodevim.vim
      ];
      userSettings = {
        "files.autoSave" = "afterDelay";
        "explorer.confirmDelete" = false;
        "explorer.confirmDragAndDrop" = false;
        "explorer.confirmPasteNative" = false;
        "editor.lineNumbers" = "relative";
        "editor.stickyScroll.enabled" = false;
        "editor.bracketPairColorization.enabled" = false;
        "editor.formatOnSave" = true;
        "editor.suggestSelection" = "recentlyUsed";
        "window.zoomLevel" = 1;
        "workbench.tree.stickyScrollMaxItemCount" = 5;
        "workbench.activityBar.location" = "hidden";
        "git.confirmSync" = false;
        "git.autofetch" = true;
        "editor.fontFamily" = "'Hack Nerd Font', 'Droid Sans Mono', 'monospace', monospace";
        "terminal.integrated.fontFamily" = "'Hack Nerd Font', 'Droid Sans Mono', 'monospace', monospace";
      };
      keybindings = [
        # sidebar shortcuts
        { key = "ctrl+shift+b"; command = "workbench.action.toggleActivityBarVisibility"; }
        { key = "ctrl+[IntlBackslash]"; command = "workbench.action.toggleSidebarVisibility"; }
        { key = "ctrl+1"; command = "workbench.view.explorer"; }
        { key = "ctrl+2"; command = "workbench.view.search"; }
        { key = "ctrl+3"; command = "workbench.scm.focus"; }
        { key = "ctrl+4"; command = "workbench.view.debug"; }
        { key = "ctrl+5"; command = "workbench.view.extensions"; }
        { key = "alt+1"; command = "workbench.view.explorer"; }
        { key = "alt+2"; command = "workbench.view.search"; }
        { key = "alt+3"; command = "workbench.scm.focus"; }
        { key = "alt+4"; command = "workbench.view.debug"; }
        { key = "alt+5"; command = "workbench.view.extensions"; }
        { key = "ctrl+escape"; command = "workbench.action.toggleSidebarVisibility"; }
        { key = "ctrl+escape"; command = "-workbench.action.chat.cancel"; }
        # removed keyboard shortcuts
        { key = "ctrl+p"; command = "-extension.vim_ctrl+p"; }
        { key = "ctrl+w"; command = "-extension.vim_ctrl+w"; }
        # format document on ctrl+s
        { key = "ctrl+s"; command = "editor.action.formatDocument"; when = "editorHasDocumentFormattingProvider && editorTextFocus && !editorReadonly && !inCompositeEditor"; }
        { key = "ctrl+shift+i"; command = "-editor.action.formatDocument"; when = "editorHasDocumentFormattingProvider && editorTextFocus && !editorReadonly && !inCompositeEditor"; }
        { key = "ctrl+s"; command = "-workbench.action.files.save"; }
        { key = "ctrl+s"; command = "-extension.vim_ctrl+s"; when = "editorTextFocus && vim.active && vim.use<C-s> && !inDebugRepl"; }
      ];
    };

    environment.systemPackages = with pkgs; [
      vscode
    ];
  };
}
