# Database migrate to docker container


## 方向1. export dump file <span style='color: green; font-weight:700;font-size:20px'>[OK]</span>

### export dump file
```bash
expdp <username>/<passwd>@DB19c directory=prf_dir dumpfile=db19c_full.dmp logfile=expdp_db19c.log  TRANSPORTABLE=ALWAYS  full=Y


expdp crs/hkhs123@DB19c directory=prf_dir dumpfile=db19c_full.dmp logfile=expdp_db19c.log  TRANSPORTABLE=ALWAYS schemas=fsc,hkhs,hou,hs_ccls,hs_haa,hs_haa2,hs_haa3,hs_hmms,hs_ns,hs_sen
```
commands to create directory
```bash
sqlplus / <DB>
create directory prf_dir as '/opt/oracle/dpdump'

```

### import dump file
```bash
impdp system/abc123@DB19C directory=prf_dir dumpfile=DB19C_FULL.DMP logfile=schema.log
```

Refer to [Dockerfile](gk/Dockerfile)


## 方向2. export backup file

it's too slow


## 方向3. docker-compose

docker container can not started
