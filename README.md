# python-project-setup

Repository to track common config files I use in my Python projects.

Contents:
- .gitignore: with common Python, MacOS, VSCode, environment ignores
- .pre-commit-config.yaml: Configuration of [pre-commit](https://pre-commit.com/) with common checks on files and Python-specific checks (isort, black, pyupgrade, pylint)
- pyproject.toml: with the configuration of used tools
- requirements-dev.txt: pip requirements for used tools
- setup_project.sh: bash script to copy files and configure destination directory
- to_copy.txt: list of files to copy to destination directory

### Usage
```bash
./setup_project.sh <project_dir_to_setup>
```

