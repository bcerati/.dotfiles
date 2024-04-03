# Dev environment

Here are my Ansible scripts for setting up a development environment.

## Update

Before you can use the development environment, you need to update your system.

```
sudo apt update
sudo apt dist-upgrade
```

## Install Ansible

```
sudo apt update
sudo apt install software-properties-common
sudo apt install -y ansible ssh sshpass
```

```
mkdir -p ~/.ssh && ssh-keyscan -H 127.0.0.1 >> ~/.ssh/known_hosts
```

This line is necessary to make ssh work.

## Executing Ansible

Caution: clone this repository with --recursive option (`git clone --recursive ...`) so it'll pull all the submodules for you!

```
ansible-playbook \
  -i hosts playbook.yml \
  --extra-vars "lsb_release=__RELEASE__ ansible_user=__USER__ ansible_password=__PASSWORD__ ansible_become_password=__PASSWORD__"
```

Don't forget to replace the `__RELEASE__`, `__USER__` and `__PASSWORD__` with the actual values.

* `__RELEASE__` : is your distribution name ;
* `__USER__` : is your username ;
* `__PASSWORD__` : is your password.

Be patient and wait for the end of the process because it can take a while.

## Post installation steps

You'll need to do some post installation steps. Here are the steps:

```shell
:CocInstall coc-json coc-tsserver # inside of nvim
:CocInstall coc-snippets # inside of nvim
:CocInstall coc-tsserver
:CocInstall coc-rust-analyzer # inside of nvim
:CocInstall coc-go # inside of nvim
:CocInstall coc-sh # inside of nvim
:CocInstall @yaegassy/coc-intelephense # inside of nvim
```

Here are all the extension that are install using coc:

"@yaegassy/coc-intelephense": ">=0.17.2",
"coc-css": ">=1.3.0",
"coc-emmet": ">=1.1.6",
"coc-go": ">=1.3.0",
"coc-html": ">=1.6.1",
"coc-json": ">=1.4.1",
"coc-prettier": ">=9.2.3",
"coc-rust-analyzer": ">=0.61.2",
"coc-sh": ">=0.6.1",
"coc-tslint-plugin": ">=1.2.0",
"coc-tsserver": ">=1.10.0",
"coc-yank": ">=1.2.1"

### Install rust-analyzer

For rust programming, I need to install rust analyzer using these commands:

```sh
mkdir -p ~/.local/bin
curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > ~/.local/bin/rust-analyzer
chmod +x ~/.local/bin/rust-analyzer
```

here is the doc: https://github.com/rust-lang/rust-analyzer/blob/master/docs/user/manual.adoc#rust-analyzer-language-server-binary

