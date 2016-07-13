#!/bin/bash
ABS_PATH=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd);

cd "$ABS_PATH";
cd ..;

FLD=$( pwd );
NTI="${FLD}/noTicket"
JIR="${FLD}/jira"
MSC="${FLD}/msc"
HDR="${FLD}/headers"

for file in "${NTI}"/*; do
	DEST="${ABS_PATH}/queue/${file##*/}"
	cat ${HDR}/main > ${DEST};
	echo $( date --date='1 day ago' +"%A %B %d, %Y"  ) >> ${DEST};
	echo "" >> ${DEST};
	cat ${HDR}/noti >> ${DEST};
	cat ${file} >> ${DEST};
	if [ -a ${JIR}/${file##*/} ]; then
		cat ${HDR}/jira >> ${DEST};
		cat ${JIR}/${file##*/} >> ${DEST};
	fi
	if [ -a ${MSC}/${file##*/} ]; then
		cat ${HDR}/msc >> ${DEST};
		cat ${MSC}/${file##*/} >> ${DEST};
	fi
	cat ${HDR}/others >> ${DEST};
done

rm "${NTI}"/* &> /dev/null;
rm "${JIR}"/* &> /dev/null;
rm "${MSC}"/* &> /dev/null;
