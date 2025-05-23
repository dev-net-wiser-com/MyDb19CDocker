# Use the official Oracle Database 19c Enterprise Edition image as the base
FROM container-registry.oracle.com/database/free:latest

# Set environment variables for Oracle
ENV ORACLE_SID=DB19c \
    ORACLE_PDB=DB19cPDB \
    ORACLE_PWD=abc123
# Copy the exported dump file into the container
COPY oradata/db19c.dmp /opt/oracle/admin/ORCLCDB/dpdump/

# Import the database dump file
RUN impdp system/${ORACLE_PWD}@${ORACLE_SID} directory=DATA_PUMP_DIR dumpfile=db19c.dmp logfile=impdp_db19c.log FULL=YES

# Expose the Oracle port
EXPOSE 1521