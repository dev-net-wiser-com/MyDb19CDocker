#!/bin/bash
impdp system/"${ORACLE_PWD}"@ORCLPDB1 \
  DIRECTORY=DATA_PUMP_DIR \
  DUMPFILE=/opt/oracle/admin/ORCLCDB/dpdump/db19c.dmp \
  FULL=YES \
  LOGFILE=import.log \
  TRANSFORM=SEGMENT_ATTRIBUTES:N:table