IFS="
"
less=()
more=()
dir="/user/faculty"
while getopts 'sh' opt ; do
	case $opt in
		h) 	
			echo "No options:"
			echo "	analyzes faculty"
			echo "s:" 
			echo "	analyzes students"
			exit 0
		;;
		s) dir="/user/student"
	esac
done

cd $dir
for x in $(du -s * 2> /dev/null | sort -n)
do
	cur_user=`echo $x | awk '{print $2}'`
	cur_usage=`echo $x | awk '{print $1}'` 
	id -u $cur_user > /dev/null 2> /dev/null
	if [ $? -eq 0 ] && [ $cur_usage -gt 100 ]; then
		less+=($x)
		if [ $cur_usage -gt 1000 ]; then
			more+=($x)
		fi
	fi	
done
echo "Users having > 100kb"
printf "%s\n" "${less[@]}"
echo ""
echo "Users having > 1000kb"
printf "%s\n" "${more[@]}"
exit 0