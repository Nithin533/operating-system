echo "enter the file name"
read file
if [ -f "$file" ]; then 
echo "file exist"
else 
echo "file doest exit"
fi
