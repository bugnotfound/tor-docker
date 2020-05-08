# tor-docker

Kali based docker image with tor daemon managed by s6-overlay.
Password for the control port 9051 is `changeme`

Run the image using the command `docker run -p 9050:9050 --rm -it IMAGE_NAME`