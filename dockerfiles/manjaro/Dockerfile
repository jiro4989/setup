FROM archlinux/base

RUN pacman -Syu --noconfirm git pacman-mirrorlist
RUN git clone https://github.com/jiro4989/setup 
WORKDIR setup
RUN ./setup.sh manjaro

ENTRYPOINT [ "bash" ]
