# KiCad + Codex

Official `kicad/kicad:10.0-full` plus the latest Codex CLI, Node.js 24, Git,
curl and ripgrep. Codex runs as root with its sandbox and approval prompts
disabled. The pcbparts MCP at `https://pcbparts.dev/mcp` is configured.

## Pull

Download the published image:

```powershell
docker pull philipwold/codex-kicad:latest
```

## Run

From any project directory (PowerShell):

```powershell
docker run --rm -it --init -v codex-home:/root/.codex -v "${PWD}:/workspace" philipwold/codex-kicad:latest
```

This starts Codex directly, with your current directory mounted at `/workspace`
and credentials, settings and sessions saved in the `codex-home` volume.
On first launch, choose **Sign in with Device Code** and complete login in your
host browser. Exit Codex to stop and remove the container. Project files and
Codex home persist; other container changes are discarded.

Defaults, including the MCP server, live in `/etc/codex/config.toml`.
User and project Codex configuration can override them.
This is a KiCad CLI environment; no graphical desktop is configured.

To update, repeat the pull command and start a new container with the run command.

## Build locally

Alternatively, build from this repository:

```powershell
docker build --pull -t philipwold/codex-kicad:latest .
```

The default tracks stable KiCad 10.0 patches and the latest stable Codex package.
Use `--build-arg KICAD_IMAGE=kicad/kicad:nightly-full` for KiCad nightly builds,
or `--build-arg KICAD_CODEX_VERSION=<version>` to pin Codex.

[KiCad image](https://www.kicad.org/download/docker/) ·
[Codex permissions](https://learn.chatgpt.com/docs/agent-approvals-security) ·
[Codex MCP configuration](https://developers.openai.com/codex/mcp/)
