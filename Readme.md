# heroku-toolbelt

Heroku Toolbelt within a Docker container.

# Usage

__Build:__

    make build-docker

__Usage:__

Run commands inside the container

    docker run --rm -it --entrypoint=/bin/bash heroku-toolbelt

    $ (you got prompt)
    $ heroku login
    $ Enter your Heroku credentials.
    $ Email:
    $ ...
    $ Logged in as <...>

*This requires you to login on each use.*

---

Run your commands via the container

    touch ~/.netrc

If you already have a `~/.netrc` you can skip this. Else the next command will create the file as a directory.

    docker run --rm -it --volume=${HOME}/.netrc:/root/.netrc heroku-toolbelt login

    $ heroku login
    $ Enter your Heroku credentials.
    $ Email:
    $ ...
    $ Logged in as <...>

    docker run --rm -it --volume=${HOME}/.netrc:/root/.netrc heroku-toolbelt config -a my-app-name

    $ === my-app-name Config Vars
    $ ....

