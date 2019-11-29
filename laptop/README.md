# Setup For Laptop on Crostini

Occassionally the Pixelbook VM that is used for develpment has issues restoring or starting the virtual machine.  This is exacerbated when utilizing Docker and Docker images because of the amount of resources these applications utiliize.  This is a script to setup the VM with all the basic software to get it back up and running for develpoment.


- Software Updates and Upgrades
  - `apt-get update && apt-get upgrade`
- Install:
  - [git](https://git-scm.com/)
  - [tmux](https://github.com/tmux/tmux)
  - [vim](https://www.vim.org/)
  - [ruby](https://www.ruby-lang.org/en/)
  - [rbenv](https://github.com/rbenv/rbenv)
  - [python3](https://www.python.org/download/releases/3.0/)
  - [pip (python3)](https://pip.pypa.io/en/stable/)
  - [nodejs](https://nodejs.org/en/)
- Configure:
  - vim

Items that are left to do in the script:

- Install
  - [AWS CLI](https://github.com/aws/aws-cli)
  - [VS Code](https://code.visualstudio.com/)
  - [SCM_BREEZE](https://github.com/scmbreeze/scm_breeze)
- Configure
  - git
  - tmux
  - AWS CLI
