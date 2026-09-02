# Roblox Template

A starter template for Roblox games that includes Roblox Studio sync, package and toolchain management, linting, formatting, compiling, networking, testing, support for feature-based architecture, require aliases, and a CI pipeline out of the box.

## Tech Stack

- **[Ember](https://github.com/ember-luau/ember)** — Package and toolchain manager
- **[Rojo](https://github.com/rojo-rbx/rojo)** — Sync to Roblox Studio
- **[Rogen](https://github.com/ldgerrits/rogen)** — Feature-based
architecture for Roblox
- **[Larvae](https://github.com/larvae-luau/larvae)** — Luau linter, formatter, compiler to `dist`, and supports require aliases
- **[Blink](https://github.com/1Axen/blink)** — Buffer networking
- **[Lest](https://github.com/lest-luau/lest)** — Test framework, used to run `tests`

## Structure

```
src/
    feature/
        client/   → StarterPlayerScripts.client.feature
        server/   → ServerScriptService.server.feature
        shared/   → ReplicatedStorage.shared.feature
    remotes/
        client/   → generated client-side remotes
        server/   → generated server-side remotes

remotes/
    main.blink    → networking schema

tests/
    unit/         → *.spec.luau, tests in isolation
    integration/  → *.spec.luau, tests multiple modules
```

## Conventions

This template encourages a few conventions to keep the codebase consistent:

- **Commits:** Use [Conventional Commits](https://www.conventionalcommits.org/), such as `feat: initial commit`, `fix: correct damage calculation`.

- **Naming:** Use `camelCase` for directory and file names.

- **Code:** Follow standard Luau style conventions and keep code consistently formatted and styled with the provided tooling.


## CI Pipeline

Every push and pull request to `main` runs a CI pipeline that goes through these steps:

1. Checkout repository
2. Install Ember
3. Cache Ember
4. Install packages and tools
5. Format
6. Lint
7. Check
8. Build
9. Tests

## Getting Started

1. Create your own repository from this template.

2. Install packages and tools:
   ```bash
   embr install
   ```

3. Sync to Roblox Studio:
   ```bash
   embr serve
   ```

## Building

To produce a `.rbxl` place file:

```bash
embr build
```