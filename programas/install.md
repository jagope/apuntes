# Hyper.js

## make bash the default shell

1. Click the top left hamburger menu (☰) => Edit => Preferences or Ctrl + ,. A file .hyper.js would be opened in Notepad
2. Change the shell key in the config to the following:
```xml
config: {
...
shell: 'C:\\Program Files\\Git\\git-cmd.exe',
...
}
```
3. Change the shellArgs key in the config to the following:
```xml
config: {
...
shellArgs: ['--command=usr/bin/bash.exe', '-l', '-i'],
...
}
```
4. Change the env key in the config to the following:
```xml
config: {
...
env: {TERM: 'cygwin'},
...
}
```
5. Save the file and close Notepad.

## selected text will automatically be copied to the clipboard
```xml
    copyOnSelect: true,
```

## change de prompt

1. create a .bashrc file
```sh
   $ cd ~ && touch .bashrc
```
2. insert the text
```
#!/bin/bash

# PROMPT
PS1='\[\033[33m\]pwd: \w\[\033[36m\] branch: `__git_ps1`\[\033[0m\]\n> '
export PS1
```

## change the font

set cascadia font
```xml
    // font family with optional fallbacks
    fontFamily: '"Cascadia Code", Menlo, "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',
```

## plugins

hyper-opacity

```xml
config: {
...
  opacity: 0.7
...
}
```
