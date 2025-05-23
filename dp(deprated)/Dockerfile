FROM container-registry.oracle.com/database/free:latest
ENV ORACLE_SID=DB19c \
    ORACLE_PDB=DB19cPDB \
    ORACLE_PWD=abc123
# Copy the Data Pump dump file to the container
COPY ./oradata/db19c.dmp /opt/oracle/admin/ORCLCDB/dpdump/

# Copy the import script
COPY import_script.sh /docker-entrypoint-initdb.d/