# Add here the programs and folders to keep track of.
tracked="qtile nvim zathura git-addall.sh README.md"

for program in $tracked; do
	git add -A "$program"
done
