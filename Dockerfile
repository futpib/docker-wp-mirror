FROM ubuntu:trusty

# https://www.nongnu.org/wp-mirror/

RUN set -xe; \
    gpg --keyserver zimmermann.mayfirst.org --recv-key 0x320AFC9D382FBD0C; \
    gpg --armor --export 0x320AFC9D382FBD0C | apt-key add -; \
    echo deb http://download.savannah.gnu.org/releases/wp-mirror/debian-wpmirror/ wheezy main \
        >> /etc/apt/sources.list; \
    apt-get update; \
    apt-get install -y --force-yes wp-mirror;

CMD wp-mirror --mirror
