# devspace-perl

This repo builds a Perl container image meant to be used for [devspace][0].

[0]: https://devspace.sh

### Quick Start

- Run `devspace init` on your Perl project

- Edit `devspace.yaml` so it uses this image for your `dev` 
  container, and add a custom `start` command:

```yaml
dev:
  app:
    imageSelector: my-image-registry.tld/username/app
    devImage: ghcr.io/zakame/devspace-perl:5.40-slim-bookworm

commands:
  start:
    command: |-
      devspace enter -- bash -c 'morbo ./path/to/app -l http://0.0.0.0:3000'
```

- Edit `devspace_start.sh` to set up your `dev` container:

```sh
# If your project has a Carton snapshot, for example:
apt-get update
apt-get install -y --no-install-recommends gcc libssl-dev
echo "Installing Carton snapshot support for cpm"
cpm install -g Carton

echo "Installing cpanfile dependencies"
cpm install -g
```

- Run `devspace dev` and hack away!


### See Also

- [Available image versions](https://github.com/zakame/devspace-perl/pkgs/container/devspace-perl/versions)
- [Templates of app devspace config and start script](./template)
- [devspace introduction](https://devspace.sh/docs/getting-started/introduction)
