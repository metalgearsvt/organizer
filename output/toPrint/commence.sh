#!/bin/bash
ABS_PATH=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd);
PRT_NAME=$( cat ${ABS_PATH}/printer.cfg );

${ABS_PATH}/comp.sh &> /dev/null;

for fileToP in "${ABS_PATH}"/queue/*;
do
  if [ ${fileToP##*.} != "fmt" ]; then
    fold -s ${fileToP} > "${fileToP}.fmt";
    rm ${fileToP};
    lpr -P "${PRT_NAME}" "${fileToP}.fmt";
  else
    lpr -P "${PRT_NAME}" "${fileToP}";
  fi
  sleep 1;
done

mv "${ABS_PATH}"/queue/* "${ABS_PATH}"/printed/;
