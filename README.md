# CommandCenter Overview

The [AWS Cyber Range](https://github.com/secdevops-cuse/CyberRange) is the world's first open-source Cyber Range blueprint in the world.

## purpose
This Command Center container provides a pre-built environment capable of fully managing the AWS Cyber Range.

For Windows Users: install [Docker Desktop](https://hub.docker.com/editions/community/docker-ce-desktop-windows/)  
For Mac Users: [Docker Desktop for Mac](https://docs.docker.com/docker-for-mac/install/)
All others: [Docker Desktop Installers](https://docs.docker.com/get-docker/)
 

# AWS Cyber Range 
The AWS Cyber Range is the world's first open-source Cyber Range framework offering a complete set of offensive, defensive, 
reverse engineering, & security intelligence tooling in a scalable yet disposable research lab in the AWS Cloud.

This project builds a purposely vulnerable environment containing a toolkit of the most powerful open-source tooling & 
free-license edition tools known to Cyber Security Engineers testers.

## Cyber Range Developers
Want to add testing, a feature, or tool into the Range? Create a fork of the project then send a Pull-Request. 
Automated testing & or updated circleci steps are always embraced.


![alt text](https://github.com/secdevops-cuse/CyberRange/raw/master/img/CyberRange-architecture-v2.png)
 
### Maintainer notes ###
 CICD is now fully building / testing & pushing the images automatically.  Locally was a bit tricky despite 
 this is the combination of commands to push the image manually.
 ```
 docker build -t awscyberange/commandcenter:0.1 .
docker tag <id> awscyberrange/commandcenter:0.1
docker push awscyberrange/commandcenter:0.1
```




