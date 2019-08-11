FROM archlinux/base

RUN pacman -S --noconfirm git
RUN git clone https://github.com/jiro4989/setup 
WORKDIR setup
RUN ./setup.sh manjaro

ENTRYPOINT [ "bash" ]
