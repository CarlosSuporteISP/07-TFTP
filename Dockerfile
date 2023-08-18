FROM debian

# Define o usuario que execulta os comandos
USER root

# Copia arquivo de configuracao para o container
COPY supervisord.conf /tmp
COPY produtividade.sh /tmp
COPY tftpd-hpa /tmp

# Instalacao de softwares utilizados pelo container
RUN apt-get update && apt-get upgrade -y \
        && apt-get install -y apt-utils vim bash-completion \
        && apt-get install -y tftpd-hpa openssh-server curl wget fail2ban tcpdump sudo net-tools \
        && apt install -y htop nano nftables dpkg locales supervisor \
        && cd /tmp && chmod +x produtividade.sh && sudo ./produtividade.sh && mkdir -p /var/log/supervisor \
        && mkdir -p /home/suporteisptftp/tftp && useradd suporteisptftp && chown -R suporteisptftp.suporteisptftp /home/suporteisptftp/tftp/ \
        && chmod -R 775 /home/suporteisptftp/tftp/ \
        && cd /tmp && cp supervisord.conf /etc/supervisor/conf.d/supervisord.conf \
        && cd /etc/default/ && rm -rf tftpd-hpa \
        && cd /tmp && mv tftpd-hpa /etc/default/ \
        && echo user=root >>  /etc/supervisor/supervisord.conf && service supervisor restart

# Porta utilizada pelo container
EXPOSE 69

# Volumes utilizados pelo container
VOLUME /etc/
VOLUME /var/
VOLUME /home/suporteisptftp/tftp


# Comando executado quando o container e criado
CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]