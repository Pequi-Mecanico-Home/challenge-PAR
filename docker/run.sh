#!/bin/bash

# Enable local X11 display access
xhost local:

# Run the Docker container with the specified configuration
docker run -it \
    --name aldo_par_challenge \
    --env="DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --privileged \
    --network host \
    --volume /dev:/dev \
    --volume $PWD:/workspace \
    --device /dev/bus/usb \
    --device /dev/snd \
    --ulimit memlock=-1:-1 \
    --ulimit stack=67108864:67108864 \
    --workdir /workspace \
    --gpus=1 \
    challenge_PAR bash