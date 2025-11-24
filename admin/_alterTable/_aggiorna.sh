##echo ######## ricordati di cancellare pg_log
##echo ######## mysqladmin -uroot -proot drop pg_log
##mysqladmin -uroot -proot drop pg_log
echo ######## pg2rus.sql
mysql -uroot -proot pg < pg2rus.sql
##echo ######## dump LOG
##mysqldump -uroot -proot pg LOG > pg_log.sql
echo ######## create pg_log
mysqladmin -uroot -proot create pg_log
##echo ######## ripristino pg_log
##mysql -uroot -proot pg_log < pg_log.sql
echo ######## logmail
mysql -uroot -proot pg_log < logmail.sql
##echo ######## drop log
##mysql -uroot -proot pg < droplog.sql