#!/bin/bash
curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --version 2.2.401
# Add the appropriate paths to $PATH through the bash profile.
cat << \EOF >> ~/.bash_profile
export DOTNET_ROOT="$HOME/.dotnet"
export PATH="$DOTNET_ROOT:$DOTNET_ROOT/tools:$HOME/.local/bin:$PATH"
EOF
# Apply the bash profile now, to make sure we override any existing .NET Core installations.
source ~/.bash_profile
# Install Python requirements.
pip3 install --user notebook qsharp
# Alias Python 3 → just `python` for convienence.
cat << \EOF >> ~/.bash_aliases
alias python='python3'
EOF
mkdir -p ~/.config/powershell/
cat << \EOF >> ~/.config/powershell/Microsoft.PowerShell_profile.ps1
Set-Alias -Name python -Value python3
EOF
# Install required .NET Global Tools.
dotnet tool install -g Microsoft.Quantum.IQSharp
dotnet tool install -g PowerShell
# Install project templates.
dotnet new -i Microsoft.Quantum.ProjectTemplates
# Configure IQ# for use with Jupyter and qsharp.py.
dotnet iqsharp install --user
# Install required PowerShell modules for demos.
# Note that the global tool version of pwsh uses different args.
pwsh "Install-Module -Force posh-tex"

# Install LaTeX.
sudo apt-get update && \
sudo apt-get install -y texlive \
                        texlive-latex-recommended \
                        texlive-latex-extra \
                        texlive-fonts-extra \
                        texlive-publishers \
                        texlive-science \
                        latexmk


# Pre-build C# project. This prevents the C# extension
# from raising errors.
pushd ~/workspace/src/
    dotnet build
popd

# Print out some diagnostic info.
echo "dotnet: $(which dotnet)"
echo "pwsh: $(which pwsh)"
echo "dotnet iqsharp: $(which dotnet-iqsharp)"
echo "latexmk: $(which latexmk)"
echo "pdflatex: $(which pdflatex)"
