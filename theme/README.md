# `themer`

Your theme's unique URL:

https://themer.dev/?activeColorSet=dark&colors.dark.shade0=%23161522&colors.dark.shade7=%23f0f7ff&colors.dark.accent0=%23ee3932&colors.dark.accent1=%23FCFE71&colors.dark.accent2=%2334febb&colors.dark.accent3=%2334febb&colors.dark.accent4=%2334febb&colors.dark.accent5=%235d8cc0&colors.dark.accent6=%235d8cc0&colors.dark.accent7=%23FCFE71&colors.light.shade0=%23ffffff&colors.light.shade7=%23183052&colors.light.accent0=%23ee3932&colors.light.accent1=%23f91c00&colors.light.accent2=%233eddaa&colors.light.accent3=%233eddaa&colors.light.accent4=%233eddaa&colors.light.accent5=%2300149e&colors.light.accent6=%2300149e&colors.light.accent7=%23f91c00

If you find `themer` useful, here are some ways to support the project:

- Star [`themer` on GitHub](https://github.com/themerdev/themer)
- Follow [@themerdev](https://twitter.com/themerdev) on Twitter
- [Send a tip through the Brave Browser](https://brave.com/the537), either on [the repository page](https://github.com/themerdev/themer) or [the Web UI](https://themer.dev)
- Pay what you want when downloading your theme from [themer.dev](https://themer.dev)
- [Sponsor the @themerdev GitHub org](https://github.com/sponsors/themerdev)

# Installation instructions

## iTerm

1. Launch iTerm
2. Press `command`-`I` to open the iTerm preferences
3. Choose Colors > Color Presets... > Import... and choose the generated theme file (`iTerm/themer-iterm-dark.itermcolors` or `iTerm/themer-iterm-light.itermcolors`)

## Terminal

1. Launch Terminal.app and open the preferences (`cmd`-`,`)
2. Click Profile > (...) icon > Import...
3. Choose the generated files (`Terminal/themer-dark.terminal` / `Terminal/themer-light.terminal`)

## VS Code

Copy (or symlink) the generated package directory into the VS Code extensions directory:

    cp -R 'VS Code/theme-themer-vscode' ~/.vscode/extensions/

Then reload or restart VS Code. The generated theme package should be in the list of installed extensions, and "Themer Dark" / "Themer Light" will be available in the list of themes.