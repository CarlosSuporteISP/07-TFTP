docker network create \
--subnet="172.29.3.52/30" \
--gateway="172.29.3.53" \
Rede-TFTP

docker run -itd \
--restart unless-stopped \
--name tftp_server \
--hostname tftp-server \
--network=Rede-TFTP \
--ip 172.29.3.54 \
--hostname TFTP-Server \
-p 10.101.101.13:69:69/udp \
-p 10.101.101.13:69:69 \
-p 10.101.101.13:56922:55022 \
-v tftp_bkp:/home/suporteisptftp/tftp \
-v tftp_etc:/etc/ \
-v tftp_var:/var/ \
suporteisptftp:1.0