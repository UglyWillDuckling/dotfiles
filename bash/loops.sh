
# Loop over an array
arr=(apples oranges tomatoes)

for element in "${arr[@]}"; do
    printf '%s\n' "$element"
done

# Loop over an array with an index

# Alternative method. Adjusted the counter to 1 for zsh
for ((i=1;i<=${#arr[@]};i++)); do
    printf '%s\n' "$i: ${arr[i]}"
done


# Loop over the contents of a file
# while read -r line; do
#     printf '%s\n' "$line"
# done < "file"


