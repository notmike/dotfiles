percent=`acpi -b | acpi -b | awk '{print $4}' | cut -d % -f 1`
adapter=`acpi -a | awk '{print $3}'`
if [ $percent -le 25 ] && [ "$adapter" == "off-line" ]
then 
	notify-send " Battery Low" "Battery percent at $percent"
else
	:
fi