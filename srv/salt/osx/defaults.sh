#!/bin/sh

# Via: https://github.com/mathiasbynens/dotfiles

# Skip delay
defaults write com.apple.dock autohide-delay -float 0
# Speed up animation when hiding/showing dock
defaults write com.apple.dock autohide-time-modifier -float 0.1
# Auto hide dock
defaults write com.apple.dock autohide -bool true

# Hot corners
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center

# Top left, desktop
defaults write com.apple.dock wvous-tl-corner -int 4
defaults write com.apple.dock wvous-tl-modifier -int 0

# Bottom left, sleep
defaults write com.apple.dock wvous-bl-corner -int 10
defaults write com.apple.dock wvous-bl-modifier -int 0

# Set mouse tracking to ludicrous speed.
defaults write -g com.apple.mouse.scaling -float 5.5

# Right click is not evil.
defaults write com.apple.AppleMultitouchMouse MouseButtonMode -string "TwoButton"

# Swipe between pages.
defaults write -g AppleEnableMouseSwipeNavigateWithScrolls -bool true

# Locale settings.
defaults write -g AppleICUForce24HourTime -bool true
defaults write -g AppleTemperatureUnit -string Celsius

# Menu bar customizations.
# Restart SystemUIServer process for these to activate.
defaults write com.apple.menuextra.clock DateFormat -string "EEE MMM d  H:mm:ss"
