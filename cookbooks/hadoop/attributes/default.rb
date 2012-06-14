
set[:hadoop][:version] = '1.0.3'
set[:hbase][:version] = '0.94.0'
set[:hadoop][:install_dir]='/home/hadoop'
set[:hbase][:install_dir]='/home/hbase'
set[:env][:java_home]='/usr/java/default'


default[:hadoop][:name_dir]='/mnt/storage/logs'
default[:hadoop][:data_dir]='/mnt/storage/data'
