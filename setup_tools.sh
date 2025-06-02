cd $HOME
npm install mcp-hub@latest

# My LLM CLI tool
mkdir -p $HOME/tools
cd $HOME/tools
git clone git@github.com:antonpetrovmain/llm-cli.git
cd $HOME/tools/llm-cli
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
deactivate

cd -
mkdir -p $HOME/.local/bin
ln -s $HOME/dotfiles/tools/* $HOME/.local/bin

unalias l
