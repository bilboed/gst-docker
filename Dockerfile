FROM docker/whalesay:latest
RUN apt-get -y update && apt-get install -y fortunes
RUN apt-get clean -y
RUN apt-get autoclean -y
CMD /usr/games/fortune -a | cowsay
