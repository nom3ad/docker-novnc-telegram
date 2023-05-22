FROM debian:bullseye

# Install git, supervisor, VNC, & X11 packages
RUN set -ex; \
    apt-get update; \
    apt-get install -y \
      bash \
      fluxbox \
      git \
      net-tools \
      novnc \
      supervisor \
      x11vnc \
      xterm \
      xvfb

# Setup demo environment variables
ENV HOME=/root \
    DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=C.UTF-8 \
    DISPLAY=:0.0 \
    DISPLAY_WIDTH=1024 \
    DISPLAY_HEIGHT=768 \
    RUN_XTERM=no \
    RUN_FLUXBOX=yes
COPY . /app

# -------------------------
RUN cd /usr/share/novnc && ln -s vnc_auto.html index.html
RUN apt-get install -y \
    apt-utils \
    dbus-x11 \
    dunst \
    hunspell-en-us \
    python3-dbus \
    software-properties-common \
    libx11-xcb1 \
    libpulse0 \
    gconf2 \
    libdrm2 \
    libgtk-3-0 \
    libice6 \
    libsm6 \
    libegl1-mesa-dev \
    libgl1-mesa-glx \
    --no-install-recommends
RUN wget https://telegram.org/dl/desktop/linux \
      -O /tmp/telegram.tar.xz \
    && cd /tmp/ \
    && tar xvfJ /tmp/telegram.tar.xz \
    && mv /tmp/Telegram/Telegram /usr/bin/telegram \
    && rm -rf /tmp/{telegram.tar.xz,Telegram}

CMD ["/app/entrypoint.sh"]
EXPOSE 8080
