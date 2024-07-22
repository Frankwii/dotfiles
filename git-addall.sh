# Add here the programs and folders to keep track of.
tracked="README.md nvim zathura"

for program in $tracked; do
	git add -A "$program"
done
