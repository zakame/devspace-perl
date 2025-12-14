# syntax=docker/dockerfile:1.4
ARG TAG=5.42-slim-bookworm
FROM perl:${TAG}

WORKDIR /app

RUN <<EOT bash -euo pipefail
    apt-get update
    apt-get install -y --no-install-recommends \
        libc6-dev \
        gcc \
        g++ \
        make \
        vim \
        inetutils-ping \
        bind9-dnsutils \
        wget \
        git \
        openssl \
        procps \
        jq

    curl -sL https://deb.nodesource.com/setup_lts.x -o nodesource_setup.sh
    bash nodesource_setup.sh
    apt-get install -y --no-install-recommends nodejs
    npm install -g yarn
    rm -fr /var/lib/apt/lists/* /var/lib/apt/cache/* nodesource_setup.sh
EOT

RUN <<EOT bash -euo pipefail
    ARCH_SHORT="arm64"
    ARCH=\$(arch)
    if [ \$ARCH = "x86_64" ]; then
        ARCH_SHORT="amd64"
    fi

    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/\$ARCH_SHORT/kubectl"
    chmod +x kubectl
    install -p kubectl /usr/local/bin;
    rm kubectl

    curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
    chmod +x get_helm.sh
    ./get_helm.sh
    rm get_helm.sh

    curl -fsSL -o devspace "https://github.com/devspace-sh/devspace/releases/latest/download/devspace-linux-\$ARCH_SHORT"
    chmod +x devspace
    install -p devspace /usr/local/bin;
    rm devspace

    devspace add plugin https://github.com/loft-sh/loft-devspace-plugin

    LOFT_URL=\$(curl -fsSL https://api.github.com/repos/loft-sh/loft/releases/latest \
        | jq --arg arch \${ARCH_SHORT}.tar.gz -r \
        '.assets[] | select(.name | test(\$arch)) | .browser_download_url')
    curl -fsSL -o loft.tar.gz \$LOFT_URL
    tar xzf loft.tar.gz loft
    install -p loft /usr/local/bin;
    rm loft.tar.gz
EOT
