# Contributing

Thanks for your interest in improving devspace-perl.

## Commit messages: Scoped Commits

This repository follows the [Scoped Commits](https://scopedcommits.com/)
convention instead of Conventional Commits. Every commit subject has the form:

```text
<scope>: <description>
```

- **scope** is the path to the file, directory, or subsystem the commit
  changes. It is not a change-type keyword like `feat` or `fix`.
- **description** is a short, imperative summary of what changed in that
  scope.

A commit that touches more than one unrelated scope should usually be split
into multiple commits, one per scope.

### Examples

```text
dependabot.yaml: enable actions workflow version updates
Dockerfile: update loft installation
workflows: bump docker/setup-qemu-action 3.2.0 -> 3.7.0 (#3)
```

See `git log` for the full commit history of this repository.

### Why scope instead of type

A scope tells reviewers and future readers *where* to look, which matters
more in a small controller codebase than *what kind* of change it was. `git
log -- workflows` becomes a meaningful changelog for that package without
needing a separate type taxonomy.

## Code of conduct

Be respectful and constructive in issues, pull requests, and reviews.
