cp  pharmadb.dmp  pharmadb.dmp.$$
PATH=$PATH:/usr/pgsql-14/bin/
pg_dump   -U pharmaadmin   -h localhost  -d pharmadb   -f pharmadb.dmp
