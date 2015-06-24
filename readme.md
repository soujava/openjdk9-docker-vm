Description
===========
This is a minimal Ubuntu base image modified for Docker-friendliness.
This box is used for running and testing JSR-363 with latest OpenJDK 9 build.

#Create

Create the vm
-------------
```
$ docker build -t soujava/openjdkdockervm .
```

Save
=====

Save the build to a image so you can re-run it after

Open the vm
```
$ docker run -it --name openjdkdockervm soujava/openjdkdockervm /bin/bash
```

Exit
```
$ root@cdc7c2e3cfd9:/# exit
```

Commit changes
```
$ docker commit openjdkdockervm soujava/openjdkdockervm
```

Check Java
------------
To check if the correct java version have been installed, run the following command

```
$ docker run soujava/openjdkdockervm java -version
```

Output
-------

```
openjdk version "1.9.0-internal"
OpenJDK Runtime Environment (build 1.9.0-internal-_2015_06_24_16_05-b00)
OpenJDK 64-Bit Server VM (build 1.9.0-internal-_2015_06_24_16_05-b00, mixed mode)
```


Execute commands
-----------------
```
$ docker run soujava/openjdkdockervm mvn -version
Apache Maven 3.0.5
Maven home: /usr/share/maven
Java version: 1.9.0-internal, vendor: Oracle Corporation
Java home: /opt/openjdk9
Default locale: en_US, platform encoding: ANSI_X3.4-1968
OS name: "linux", version: "4.0.3-boot2docker", arch: "amd64", family: "unix"
```


License
=======
The GNU General Public License (GPL)

Author
=======
Thomas Modeneis @thomasmodeneis