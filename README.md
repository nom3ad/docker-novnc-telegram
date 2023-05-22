# noVNC Display Container with Telegram


## Image Contents

* [Xvfb](http://www.x.org/releases/X11R7.6/doc/man/man1/Xvfb.1.xhtml) - X11 in a virtual framebuffer
* [x11vnc](http://www.karlrunge.com/x11vnc/) - A VNC server that scrapes the above X11 server
* [noNVC](https://kanaka.github.io/noVNC/) - A HTML5 canvas vnc viewer
* [Fluxbox](http://www.fluxbox.org/) - a small window manager
* [xterm](http://invisible-island.net/xterm/) - to demo that it works
* [supervisord](http://supervisord.org) - to keep it all running
* [Telgram](https://telegram.org/) - 

## Usage

### Variables

You can specify the following variables:
* `DISPLAY_WIDTH=<width>` (1024)
* `DISPLAY_HEIGHT=<height>` (768)

```
git clone https://github.com/nom3ad/docker-novnc-telegram
cd docker-novnc-telegram
docker build -t novnc-telegram .  
docker run --rm -it -p 8080:8080 novnc-telegram
```

# Thanks
___
Forked from  theasp/docker-novnc
This is based on the alpine container by @psharkey: https://github.com/psharkey/docker/tree/master/novnc
Based on [wine-x11-novnc-docker](https://github.com/solarkennedy/wine-x11-novnc-docker) and [octave-x11-novnc-docker](https://hub.docker.com/r/epflsti/octave-x11-novnc-docker/).
