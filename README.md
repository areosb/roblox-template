# Roblox Template

A starter template for Roblox games that includes Roblox Studio sync, package and toolchain management, linting, formatting, compiling, networking, testing, support for feature-based architecture, require aliases, and a CI pipeline out of the box.

## Tech Stack

- **[lpm](https://luaupm.com/)** — Package and toolchain manager
- **[Rojo](https://github.com/rojo-rbx/rojo)** — Sync to Roblox Studio
- **[Rogen](https://github.com/ldgerrits/rogen)** — Feature-based
architecture for Roblox
- **[Larvae](https://github.com/larvae-luau/larvae)** — Luau linter, formatter, compiler to `dist`, and supports require aliases
- **[Blink](https://github.com/1Axen/blink)** — Buffer networking
- **[Lune](https://github.com/lune-org/lune)** — Luau runtime, backend for `tests`
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

## CI Pipeline
Every push and pull request to `main` runs a CI pipeline that goes through these steps:

1. Install lpm
2. Cache lpm
3. Install packages and tools
4. Format
5. Lint
6. Check
7. Build
8. Tests

## Getting Started

1. Create your own repo from this template.

2. Install packages and tools:
   ```bash
   lpm install
   ```

3. Sync to Roblox Studio:
   ```bash
   lpm serve
   ```

## Building

To produce a `.rbxl` place file:

```bash
lpm build
```