FROM mcr.microsoft.com/devcontainers/javascript-node:1-20-bullseye

RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg \
    && sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/ \
    && sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-dev.list' \
    && sudo rm microsoft.gpg

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends microsoft-edge-stable

RUN su node -c "npx playwright install --with-deps chromium"
