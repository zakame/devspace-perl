# devspace-perl

This is a Perl container image meant to be used for [devspace][0].

[0]: https://devspace.sh

Feel free to fork this repo and make customizations especially on 
`Dockerfile` to install/configure your application's dependencies
as needed!

### Quick Start

- Run `devspace init` on your Perl project

- Edit `devspace.yaml` so it uses this image for your `dev` 
  container:

```yaml
dev:
  replacePods:
  - imageSelector: ${IMAGE}
    replaceImage: ghcr.io/zakame/devspace-perl:master
```

- Edit `devspace_start.sh` to set up your `dev` container:

```sh
# If your project has a Carton snapshot, for example:
apt-get update
apt-get install -y --no-install-recommends gcc libssl-dev
echo "Installing Carton snapshot support for cpm"
cpm install -g Carton

echo "Installing cpanfile dependencies"
cpm install
```

- Run `devspace dev` and hack away!


### See Also

- https://devspace.sh/docs/5.x/introduction
