# This script is useful for forcing git into only tracking a given set of files or folders.
# Pass them as a valid Bash array or change the variable "default_tracked"
# Git directory path should be specified on the "path" variable. Default: $HOME/.config

path="${1:-$HOME/.config}"

# Add here the programs and folders to keep track of.
default_tracked="qtile nvim zathura git-addall.sh README.md .gitignore"

tracked="${2:-$default_tracked}"

for program in $tracked; do
	git add -A "$program"
done
