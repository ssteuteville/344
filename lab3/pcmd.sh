ps -ef | awk '{if ($7 !~ /00:00:00/) {$1=$2=$3=$4=$5=$6=$7=""; print $0}}' | sed -e "s/^ *//"
