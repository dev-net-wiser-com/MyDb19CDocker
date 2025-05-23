

# Oracle Database DB19c On Docker

## 1. Pull image and run container

### 1.1 Pull image(This step need oracle account)
```bash
docker login container-registry.oracle.com

docker pull container-registry.oracle.com/database/free:latest
```
### 1.2 Run container
```bash
docker run -d \
  --name oracle19c \
  -p 1521:1521 -p 5500:5500 \
  -e ORACLE_PWD=abc123 \
  -v oradata:/opt/oracle/oradata \
  oracle/database:19.3.0-ee

  ```
or


```bash
docker run -d  --name oracle19c -p 1521:1521 -p 5500:5500  -e ORACLE_PWD=abc123  -v oradata:/opt/oracle/oradata container-registry.oracle.com/database/free

```

or

```batch
```batch
docker run -d ^
  --name oracle19c ^
  -p 1521:1521 -p 5500:5500 ^
  -e ORACLE_PWD=abc123 ^
  -v oradata:/opt/oracle/oradata ^
  oracle/database:19.3.0-ee

  ```

## 2. Run container with existing dump files
2.1 dp
```bash
docker build -t oracle-db19c-copy .
docker run -d --name db19c-container -p 1521:1521 -e ORACLE_PWD=abc123  oracle-db19c-copy

```
Alternative

```bash
 
docker run -d --name temp-db  container-registry.oracle.com/database/free:latest
docker exec -it temp_db bash -c 'impdp system/abc123@FREE DIRECTORY=DATA_PUMP_DIR DUMPFILE=db19c.dmp FULL=YES'
```


  ```bash
docker build -t temp-db .
docker cp oradata/db19c.dmp temp-db:/opt/oracle/admin/ORCLCDB/dpdump/
docker run -d  --name db19c-container  -p 1521:1521  -e ORACLE_PWD=abc123 oracle-db19c-image
  ```

## 3. Run DB 19c
```batch
docker pull doctorkirk/oracle-19c

docker run -d --name oracle-19c -p 1521:1521 -e ORACLE_SID=DB19C -e ORACLE_PWD=abc123 -e ORACLE_CHARACTERSET=AL32UTF8 -v ./oradata:/opt/oracle/oradata doctorkirk/oracle-19c

docker exec -it oracle-19c

sqlplus sys/abc123@localhost:1521/DB19C as sysdba

docker volume create oracle19c_data

docker run -d --name oracle19c -p 1521:1521 -p 5500:5500 -e ORACLE_PWD=abc123 -v oracle19c_data:/opt/oracle/oradata doctorkirk/oracle-19c
```


