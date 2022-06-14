1. <br/>![img_100.png](img_100.png)<br/>
![img_101.png](img_101.png)<br/>
2. <br/>![img_102.png](img_102.png)<br/>
3. <br/>![img_103.png](img_103.png)<br/>
![img_104.png](img_104.png)<br/>
используется engine InnoDB<br/>
время переключения на MyISAM =  0.02203425<br/>
время переключения на InnoDB = 0.02441950<br/>
4. <br/>![img_106.png](img_106.png)<br/>
добавлены строки:<br/>
innodb_flush_log_at_trx_commit = 0<br/>
innodb_compression_level=9<br/>
innodb_log_buffer_size= 1000000<br/>
key_buffer_size = 300000000<br/>
max_binlog_size= 100000000<br/>
