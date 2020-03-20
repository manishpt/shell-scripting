#! /bin/bash

if [[ ${UID} -ne 0 ]]
then
echo "u need root privilages to proceed" 1>&2
exit 1
fi
if [[ $# -eq 0 ]]
then
echo 'enter username as arguments and also provide option along with them' 1>&2
echo 'the options must be among these: -d, -r, -a.' 1>&2
echo 'enter it in the following format: # /.newusers <username> -<option>' 1>&2
exit 1
fi

while getopts dra: OPTION
do
USERNAME=${1}
ID=$(id -u ${USERNAME}
if [[ ${ID} -lt 1000 ]]
then
echo 'You are only authorised to alter system accounts, ie. with UID>1000' &>
exit 1
fi

case ${OPTION} in
d)
	userdel  ${USERNAME} &>;	OP='deleted';;
r)
	userdel -r ${USERNAME} &> ;  OP='deleted with the home directory';; 
a)
	tar cf /archives.tar /home/${USERNAME} &> ;	OP='archived' ;;
?)
	echo 'enter a valid option' ;	exit 1 ;;
esac

if [[ ${?} -eq 0 ]]
then 
echo "the user:${USERNAME} has been ${OPT}"
echo
fi 
shift
done
