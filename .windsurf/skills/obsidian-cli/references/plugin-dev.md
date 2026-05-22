# Plugin & Theme Development

Commands for developing and debugging Obsidian plugins and themes via the CLI.

## Develop/test cycle

After making code changes to a plugin or theme:

1. **Reload** the plugin to pick up changes:
   ```bash
   obsidian plugin:reload id=my-plugin
   ```
2. **Check for errors** — if errors appear, fix and repeat from step 1:
   ```bash
   obsidian dev:errors
   ```
3. **Verify visually** with a screenshot or DOM inspection:
   ```bash
   obsidian dev:screenshot path=screenshot.png
   obsidian dev:dom selector=".workspace-leaf" text
   ```
4. **Check console output** for warnings or unexpected logs:
   ```bash
   obsidian dev:console level=error
   ```

## Developer commands

```bash
obsidian eval code="app.vault.getFiles().length"            # run JavaScript
obsidian dev:dom selector=".workspace-leaf" text             # query DOM elements
obsidian dev:dom selector=".nav-file" all total              # count elements
obsidian dev:dom selector=".tag" attr=class                  # get attribute
obsidian dev:dom selector=".tag" css=color                   # get CSS property value
obsidian dev:dom selector=".workspace-leaf" inner            # innerHTML instead of outerHTML
obsidian dev:css selector=".workspace-leaf" prop=background-color  # inspect CSS with source locations
obsidian dev:console limit=20 level=warn                     # console messages
obsidian dev:console clear                                   # clear console buffer
obsidian dev:errors                                          # show captured errors
obsidian dev:errors clear                                    # clear error buffer
obsidian dev:screenshot path=screenshot.png                  # take screenshot
obsidian dev:mobile on                                       # enable mobile emulation
obsidian dev:mobile off                                      # disable mobile emulation
obsidian dev:cdp method="Page.reload" params="{}"            # Chrome DevTools Protocol
obsidian dev:debug on                                        # attach CDP debugger
obsidian dev:debug off                                       # detach CDP debugger
obsidian devtools                                            # toggle Electron dev tools
```

| Command | Parameters | Description |
|---------|------------|-------------|
| `eval` | `code=` (required) | Execute JavaScript and return result |
| `dev:dom` | `selector=` (required), `total`, `text`, `inner`, `all`, `attr=`, `css=` | Query DOM elements |
| `dev:css` | `selector=` (required), `prop=` | Inspect CSS with source locations |
| `dev:console` | `clear`, `limit=`, `level=log\|warn\|error\|info\|debug` | Show or clear captured console messages |
| `dev:errors` | `clear` | Show or clear captured errors |
| `dev:screenshot` | `path=` | Take a screenshot |
| `dev:mobile` | `on` / `off` | Toggle mobile emulation |
| `dev:cdp` | `method=` (required), `params=` | Run a Chrome DevTools Protocol command |
| `dev:debug` | `on` / `off` | Attach/detach CDP debugger |
| `devtools` | — | Toggle Electron dev tools |
