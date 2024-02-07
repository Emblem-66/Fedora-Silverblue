FROM quay.io/fedora/fedora-silverblue:latest AS builder
RUN rpm-ostree install distrobox 
FROM builder AS silverblue
RUN rpm-ostree override remove firefox firefox-langpacks
FROM builder AS steamblue
RUN rpm-ostree install steam
