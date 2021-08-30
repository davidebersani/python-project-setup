#!/bin/bash

if [ "$#" -ne 1 ]
then
    echo "Wrong usage!"
    echo "Usage: ./setup_project.sh <project_dir_to_setup>"
    echo "<project_dir_to_setup> must exists"
    exit 1
fi

check_exit_code() {
    if [ "$?" -ne 0 ]
    then
        echo "Exiting, an error occurred. "
        exit 1
    fi
}

project_dir=$1
input_file="./to_copy.txt"

echo "==> Copying files..."
while IFS= read -r line
do
echo "Coping $line"
  cp $line $project_dir
done < "$input_file"

echo ""
echo "==> Installing dev-requirements in a new virtual env..."
cd $project_dir
python3 -m venv venv
check_exit_code
source venv/bin/activate
check_exit_code
pip install -r requirements-dev.txt
check_exit_code
echo "==> Installing pre-commits..."
if ! [ -d .git ]; then
    git init
fi
pre-commit install
