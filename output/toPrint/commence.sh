#!/bin/bash
ABS_PATH=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd);
PRT_NAME="PrintDis";

for fileToP in "${ABS_PATH}"/queue/*;
do
  lpr -P "${PRT_NAME}" "${fileToP}";
  sleep 4;
done

mv "${ABS_PATH}"/queue/* "${ABS_PATH}"/printed/;
