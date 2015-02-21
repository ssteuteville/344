r=''
w=''
x=''

read -p "Enter the name of the file " file_name

if [ ! -f $file_name ]; then
	echo "Invalid File"
	exit 1
fi

read -p "Do you want to allow read permission? (y/n) " yn
case $yn in
	[Yy]* ) r='r';;
esac

read -p "Do you want to allow write permission? (y/n) " yn
case $yn in
	[Yy]* ) w='w';;
esac

read -p "Dou you want to allow execute permission? (y/n) " yn
case $yn in
	[Yy]* ) x='x'
esac

chmod u-rwx $file_name
chmod 'u+'$r$w$x $file_name 
echo "Successfully updated permissions"
exit 0