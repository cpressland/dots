# /usr/bin/env zsh

function log() {
    echo "$(date -u) - $1"
}

# Disable Dictation
defaults write com.apple.HIToolbox AppleDictationAutoEnable -int 1

function setup_system() {
    log "--- Setting up System ---"
    log "Set Highlight Colour to Pink"
    defaults write NSGlobalDomain "AppleHighlightColor" -string "1.000000 0.749020 0.823529 Pink"
    log "Set Accent Colour to Pink"
    defaults write NSGlobalDomain "AppleAccentColor" -int "6"
    log "Enable Window Drag from Anywhere"
    defaults write -g "NSWindowShouldDragOnGesture" -bool "true"
    defaults write -g "NSWindowShouldDragOnGestureFeedback" -bool "false"
    log "Enable three finger drag"
    defaults write com.apple.AppleMultitouchTrackpad "TrackpadThreeFingerDrag" -bool "true"
    log "Disable Smart Quotes"
    defaults write NSGlobalDomain "NSAutomaticQuoteSubstitutionEnabled" -bool "false"
    log "Disable Smart Dashes"
    defaults write NSGlobalDomain "NSAutomaticDashSubstitutionEnabled" -bool "false"
    log "Disable automatic period substitution"
    defaults write NSGlobalDomain "NSAutomaticPeriodSubstitutionEnabled" -bool "false"
    log "Disable automatic capitalisation"
    defaults write NSGlobalDomain "NSAutomaticCapitalizationEnabled" -bool "false"
    log "Disable automatic correction"
    defaults write NSGlobalDomain "NSAutomaticSpellingCorrectionEnabled" -bool "false"
    log "Save panel expanded by default"
    defaults write NSGlobalDomain "NSNavPanelExpandedStateForSaveMode" -bool "true"
    log "Print panel expanded by default"
    defaults write NSGlobalDomain "PMPrintingExpandedStateForPrint" -bool "true"
    log "Save to disk by default"
    defaults write NSGlobalDomain "NSDocumentSaveNewDocumentsToCloud" -bool "false"
    log "Use Metric Units"
    defaults write NSGlobalDomain "AppleMeasurementUnits" -string "Centimeters"
    defaults write NSGlobalDomain "AppleMetricUnits" -bool "true"
    defaults write NSGlobalDomain "AppleTemperatureUnit" -string "Celsius"
    log "Always show scrollbars"
    defaults write NSGlobalDomain "AppleShowScrollBars" -string "Always"
    log "Enable Keyboard Navigation"
    defaults write NSGlobalDomain "AppleKeyboardUIMode" -int "3"
}

function setup_activity_monitor() {
    log "--- Setting up Activity Monitor ---"
    log "Show all processes in Activity Monitor"
    defaults write com.apple.ActivityMonitor "ShowCategory" -int "100"
    log "Set Network to show data rates"
    defaults write com.apple.ActivityMonitor "NetworkGraphType" -int 1
}

# Dock Setup
function setup_dock() {
    log "--- Setting up Dock ---"
    dockutil --remove all
    for app in "Safari" "Visual Studio Code" "Ghostty" "Messages" "Telegram" "Slack" "1Password"; do
        dockutil --add "/Applications/$app.app" --no-restart
    done
    log "Moving Dock to the left"
    defaults write com.apple.dock "orientation" -string "left"
    log "Setting Autohide"
    defaults write com.apple.dock "autohide" -bool "true"
    log "Setting Autohide Delay"
    defaults write com.apple.dock "autohide-delay" -float "0.2"
    log "Disabling Recent Applications"
    defaults write com.apple.dock "show-recents" -bool "false"
    log "Restarting Dock"
    killall Dock
}

# Finder Setup
function setup_finder() {
    log "--- Setting up Finder ---"
    log "Show Path Bar"
    defaults write com.apple.finder "ShowPathbar" -bool "true"
    log "Show Status Bar"
    defaults write com.apple.finder "ShowStatusBar" -bool "true"
    log "Always show extensions"
    defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"
    log "Empty Trash after 30 days"
    defaults write com.apple.finder "FXRemoveOldTrashItems" -bool "true"
    log "Disable warning when changing file extension"
    defaults write com.apple.finder "FXEnableExtensionChangeWarning" -bool "false"
    log "Set default view to Column"
    defaults write com.apple.finder "FXPreferredViewStyle" -string "clmv"
    log "Set default search scope to current folder"
    defaults write com.apple.finder "FXDefaultSearchScope" -string "SCcf"
    log "Set default New Window location to home folder"
    defaults write com.apple.finder "NewWindowTarget" -string "PfHm"
}

function setup_safari() {
    log "--- Setting up Safari ---"
    log "Show full URL in Safari"
    defaults write com.apple.Safari "ShowFullURLInSmartSearchField" -bool "true"
    log "Disable preload top hit"
    defaults write com.apple.Safari "PreloadTopHit" -bool "false"
    log "Disable favourites in Smart Search"
    defaults write com.apple.Safari "ShowFavoritesUnderSmartSearchField" -bool "false"
    log "Enable Developer Mode"
    defaults write com.apple.Safari "IncludeDevelopMenu" -bool "true"
    defaults write com.apple.Safari "WebKitDeveloperExtrasEnabledPreferenceKey" -bool "true"
    defaults write com.apple.Safari "WebKitPreferences.developerExtrasEnabled" -bool "true"
    defaults write com.apple.Safari "PreferencesModulesMinimumWidths" -dict-add DeveloperMenuVisibility -bool "true"
    log "Disable AutoFill"
    defaults write com.apple.Safari "AutoFillFromAddressBook" -bool "false"
    defaults write com.apple.Safari "AutoFillPasswords" -bool "false"
    defaults write com.apple.Safari "AutoFillCreditCardData" -bool "false"
    defaults write com.apple.Safari "AutoFillMiscellaneousForms" -bool "false"
    log "Don't open safe files after downloading"
    defaults write com.apple.Safari "AutoOpenSafeDownloads" -bool "false"
    log "Limit History to 365 days"
    defaults write com.apple.Safari "HistoryAgeInDaysLimit" -int "365"
}

setup_system
setup_activity_monitor
setup_dock
setup_finder
setup_safari
