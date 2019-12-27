# Hyper.js

## make bash the default shell

1. Click the top left hamburger menu (☰) => Edit => Preferences or Ctrl + ,. A file .hyper.js would be opened in Notepad
2. Change the shell key in the config to the following:
```sh
config: {
...
shell: 'C:\\Program Files\\Git\\git-cmd.exe',
...
}
```
3. Change the shellArgs key in the config to the following:
```sh
config: {
...
shellArgs: ['--command=usr/bin/bash.exe', '-l', '-i'],
...
}
```
4. Change the env key in the config to the following:
```sh
config: {
...
env: {TERM: 'cygwin'},
...
}
```
5. Save the file and close Notepad.

## selected text will automatically be copied to the clipboard
```sh
    copyOnSelect: true,
```
