# Changelog

## [1.0.3]

### New Features
- Added timer tracking and persistence for both Common Counter and Set games, including saving/restoring timer state during app lifecycle events and navigation.

### Improvements
- Enhanced iOS app icons with dark mode variants.

## [1.0.2]

### New Features
- Introduced a "Keep Awake Mode" setting to prevent the device screen from turning off during use.
- Added a "Bingo" button and bonus scoring rule to Scrabble, with updated dialogs and input validation.

### Improvements
- Added extra spacing below trademark notices in game rules screens for better readability.

### Chores
- Added the wakelock_plus package as a new dependency.

## [1.0.1]

### New Features
- Introduced custom blurred dialogs and scroll views to enhance visual appeal and user experience.
- Added a new text style for consistent UI typography.
- Implemented in-app review prompts triggered after specific usage conditions.
- Added sharing functionality for users to recommend the app.
- Linked the my other app on the About screen.

### Improvements
- Updated dialogs and modals to include blurred backgrounds and fade-in animations.
- Enhanced scrollable areas in the Rules and About screens with blurred edge effects.
- Improved Snackbar behavior with floating style and longer visibility.
- Refined text and color styles for better readability and theme consistency.
- Improved bottom game bar layout to better handle device safe areas.
- Updated device language detection to use the latest platform API.
- Revamped About screen with updated styling, interactive elements, sharing, and rating options.

### Removed
- Removed the game results bottom sheet component.

## [1.0.0]

- Initial release of **board buddy**.
- Core functionality for tracking scores and key moments for
    - uno
    - uno flip
    - dos
    - scrabble
    - set
    - munchkin
    - universal counter
- Support for saving and loading game sessions.