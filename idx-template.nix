# idx-template.nix
{ pkgs, azure_api_key ? "", ... }: {
  bootstrap = ''
    # Create the output directory
    mkdir -p "$out"
    
    # Copy the repository files to the workspace
    cp -rf ${./.} "$out"
    
    # Set environment variables
    echo "export AZURE_OPENAI_API_KEY=${azure_api_key}" >> "$out/.env"

    # Set some permissions
    chmod -R +w "$out"
    
    # Remove the template files themselves
    rm -rf "$out/.git" "$out/idx-template".{nix,json}
  '';
}
