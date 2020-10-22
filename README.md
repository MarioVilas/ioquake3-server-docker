Dockerized ioquake3 headless server
-----------------------------------

Does what it says on the box. :)

There are other dockerfiles already out there but I found them either too complex or they made decisions I did not like (for example bundling the .pk3 and .cfg files inside the docker image, which is not very practical if you want to tweak the settings or add new maps). I also made mine fully immutable and runs with a non-privileged user for extra security.

Install
-------

1) Grab the data files from your original Quake III Arena CD-ROM or GOG.com install directory (Steam won't work since they encrypt the files).
2) Copy the files into the q3a/baseq3 and q3a/missionpack directories.
3) Run "docker-compose up -d" and you're done!

Configuration
-------------

There are two configuration files in the baseq3 directory:
* [autoexec.cfg](../blob/master/q3a/baseq3/autoexec.cfg)
* [server.cfg](../blob/master/q3a/baseq3/server.cfg)

In *autoexec.cfg* you should only set the most basic server settings, such as the IP address to bind to or the port number, whether the server should be listed globally or stay private, etc. By default it will bind on 0.0.0.0 on port 27960 and will **not** be listed publicly, which is useful for a LAN party. **NOTE**: if you change the port number you'll have to adjust the [Dockerfile](../blob/master/Dockerfile) and [docker-compose.yml](../blob/master/docker-compose.yml) files too.

In *server.cfg* you will find the vast majority of settings. These are too many to list here so check out the file itself for comments. By default it will start in FFA mode with every single default map in order.

**IMPORTANT: MAKE SURE TO SET A NEW PASSWORD!**

Acknowledgements
----------------

A big thank you to @roguephysicist for their handy [install guide](https://github.com/roguephysicist/q3a-server), Erik Max Francis for his amazing Quake III Arena guide at [BossKey.Net](http://www.bosskey.net/q3a/index.html), and the [Quake3World](https://www.quake3world.com/forum/) forums which are simply the best for troubleshooting the server.