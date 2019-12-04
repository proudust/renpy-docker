FROM ubuntu:19.04

ARG RENPY_VERSION

RUN apt-get update && \
    apt-get install --yes bzip2 wget && \
    wget -q -O - https://www.renpy.org/dl/${RENPY_VERSION}/renpy-${RENPY_VERSION}-sdk.tar.bz2 | tar xfj - && \
    mv ./$(ls -d renpy-*) ./renpy

ENV SDL_AUDIODRIVER dummy
ENV SDL_VIDEODRIVER dummy

ENTRYPOINT ["./renpy.sh"]

CMD ["./launcher", "distribute", "."]
