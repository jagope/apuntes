# Use Multiple Git Configs on One Computer

Create the global .gitconfig file in your home directory if it doesn't already exist. Then add all the profile directories as an entry like in the example below:

```
[includeIf "gitdir:~/personal/"]
  path = ~/.gitconfig-personal
[includeIf "gitdir:~/work/"]
  path = ~/.gitconfig-work
```

Create individual Git configurations for profiles, these individual files can contain all the customization that you need, from user name and email to commit hooks.
