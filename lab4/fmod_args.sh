r=''
w=''
x=''
file_name=''
for var in "$@"
do
	case $var in
		read ) r='r';;
		write ) w='w';;
		execute ) x='x';;
		* ) file_name=$var
	esac
done

if [ ! -f $file_name ]; then
	echo "Invalid File"
	exit 1
fi

chmod u-rwx $file_name
chmod 'u+'$r$w$x $file_name 
echo "Successfully updated permissions"
exit 0