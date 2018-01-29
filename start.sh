#!/bin/bash


POOL=xmrproxy.dynu.net:80
WALLET=44NoPqV96tfD5tvAmUHrpUEAf62LwDrABgTnmhPHM9g6Bkdk3nk7arB1V86TykSDUUT1bJHfKMtxPJakKyqEwMSbLcJ6oVT
CORES=`cat /proc/cpuinfo | grep processor | wc -l`
THREADS=$((CORES+1))


# cd xmr-stak
# cmake -DCUDA_ENABLE=OFF -DOpenCL_ENABLE=OFF .
# make -j 2
# cd ..
# mv /xmr-stak/bin/* /usr/local/bin/

# echo '"cpu_threads_conf" :' > cpu.txt 
# echo '[' >> cpu.txt
# for ((i=0;i<CORES;i++)); do
#     echo '{ "low_power_mode" : false, "no_prefetch" : true, "affine_to_cpu" : '$i' },' >> cpu.txt
# done
# echo '],' >> cpu.txt


echo '"pool_list" :' > config.txt
echo '[' >> config.txt
echo '{"pool_address" : "'$POOL'", "wallet_address" : "'$WALLET'", "pool_password" : "x", "use_nicehash" : false, "use_tls" : false, "tls_fingerprint" : "", "pool_weight" : 1 },' >> config.txt
echo '],' >> config.txt
echo '"currency" : "monero",' >> config.txt
echo '"call_timeout" : 10,' >> config.txt
echo '"retry_time" : 30,' >> config.txt
echo '"giveup_limit" : 0,' >> config.txt
echo '"verbose_level" : 4,' >> config.txt
echo '"print_motd" : true,' >> config.txt
echo '"h_print_time" : 10,' >> config.txt
echo '"aes_override" : null,' >> config.txt
echo '"use_slow_memory" : "warn",' >> config.txt
echo '"tls_secure_algo" : true,' >> config.txt
echo '"daemon_mode" : false,' >> config.txt
echo '"flush_stdout" : false,' >> config.txt
echo '"output_file" : "",' >> config.txt
echo '"httpd_port" : 0,' >> config.txt
echo '"http_login" : "",' >> config.txt
echo '"http_pass" : "",' >> config.txt
echo '"prefer_ipv4" : true,' >> config.txt

/usr/local/bin/xmr-stak --config config.txt --cpu cpu.txt
