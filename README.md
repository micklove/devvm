# Background

Example scripts for setting up a development VM using Ansible.

Includes:
* Various Linux command-line utilities
* AWS CLI (v2) + tooling (awslocal, CDK, cfn-flip, cfn-lint, SAM, sceptre, saml2aws)
* Chromium web browser
* Docker
* Docker Compose
* Git tools, Github CLI, diff-so-fancy
* Go, with GOPATH, etc...
* JetBrains IDEs (GoLand, pycharm, intellij, rider)
* .NET Core
* NodeJS (via NVM + Yarn)
* Postman
* Python tooling (e.g. pipenv)
* Slack
* Visual Studio Code

Currently tested and working on Ubuntu 20.04 LTS.

## Instructions

1. Create a new virtual machine (e.g. using VirtualBox) and install [Ubuntu 20.04 LTS Desktop](https://releases.ubuntu.com/20.04/).
   * Select the **Minimal** installation type during setup.
   * Make sure you install any virtual machine tooling (e.g. VirtualBox Guest Additions).

2. Install git and ansible.
```
sudo apt update
sudo apt -y install git ansible
```

3. Clone the devvm repository.
```
git clone git@github.com/micklove/devvm.git
```

4. Run the ansible playbook
```
cd devvm
ansible-playbook -K devvm.yml
```

---

#### TODO
[procmon](https://github.com/microsoft/ProcMon-for-Linux)

Configure ufw

Bunyan

---

## Running individual tasks
For now, using the `tags` command to target individual tasks to run. e.g. To run tasks with a `config` tag...

```
ansible-playbook -K devvm.yml --tags config -vvv
```

---

## Useful
[ubuntu shortcuts](https://help.ubuntu.com/stable/ubuntu-help/shell-keyboard-shortcuts.html.en)
