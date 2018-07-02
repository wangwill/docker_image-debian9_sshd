# Docker image: debian9_sshd

## Description

Official Debian 9 (debian:9) image + openssh-server docker image with some customization:
* python package is installed (this allows ie. using Ansible to play with container when running)
* CMD/ENTRYPOINT set to autostart sshd service

## Usage

There are two main run-time settings that may need to be passed to newly created container from this image:
* Container provides SSH service on port 22. If you want this port to be published on host interfaces add `-p 22:22` to your `docker run` statement or set IP/PORT accordingly
* This container will have very limited use if you cannot connect to it. Best way to fix this is to attach a volume with your `authorized_keys` file and mount it to `/root/.ssh/authorized_keys` like this: `-v <path_to_your_authorized_keys_file>:/root/.ssh/authorized_keys`

## Example

To successfully start a new container using this image please specify port (here port 22) and volume options as in following example:
`docker run -dp 22:22 -v <path_to_your_authorized_keys_file>:/root/.ssh/authorized_keys --name <your-app-name> ajbisoft/debian9-lap`

## Summary

I use this image to play with clean Debian 9 containers, ie. using Ansible to test my playbooks and Debian roles, or as simple ssh enabled nodes to test my applications interacting with external servers.
It can also be used as a base image to do some more interesting stuff. With some extra modifications it can be used as ie. simple VPN client/server by taking advantage of ssh tuneling features or even using pppd to tunel whole networks. 
I'm sure you can find some other even more interesting ways to use it or build on top of it.
Happy modding!
