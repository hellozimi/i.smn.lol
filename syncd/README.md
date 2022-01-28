# syncd

This is used to upload all screenshots taken by the built-in macos screenshot
tool.

```sh
# set macos default screenshots location to ~/screenshots instead of ~/Desktop
$ mkdir ~/screenshots
$ defaults write com.apple.screencapture location ~/screenshots

# install and start the start the agent
$ cp local.syncd.plist ~/Library/LaunchAgents
$ launchctl load -w ~/Library/LaunchAgents/local.syncd.plist
$ launchctl start local.syncd
```

