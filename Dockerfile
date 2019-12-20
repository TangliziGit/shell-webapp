FROM archlinux:latest

RUN pacman -Sy --noconfirm gnu-netcat

WORKDIR /usr/local/shell-webapp
COPY . /usr/local/shell-webapp
RUN chmod +x dispatcher.sh handler/* util/* render/*

ENTRYPOINT ["/usr/local/shell-webapp/dispatcher.sh"]
CMD ["8080"]
EXPOSE 8080
