# docker-plex-server
Dockerfile for the Plex Media Server

docker run -d -h *your_host_name* -v /*your_config_location*:/config -v /*your_videos_location*:/data -p 32400:32400  plex
