sqlplus sys/abc123@DB19C as sysdba

CREATE OR REPLACE DIRECTORY DUMP_DIR AS '/opt/oracle/dpdump';

GRANT READ, WRITE ON DIRECTORY DUMP_DIR TO SYSTEM;

impdp sys/abc123@DB19C \
      DIRECTORY=DUMP_DIR \
      DUMPFILE=DB19C_FULL.DMP \
      LOGFILE=import_log.log \