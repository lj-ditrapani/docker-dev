A terminal-based development environment in a docker image

    docker pull ljditrapani/dev:0.1.0
    docker run -it --rm ljditrapani/dev:0.1.0 /bin/zsh

Development
    
    sh build.sh
    sh docker-run.sh  # to test it out
    docker login --username=ljditrapani
    docker tag dev ljditrapani/dev:0.1.0
    docker push ljditrapani/dev:0.1.0
