## Contributing to Board Buddy

Thank you for considering contributing to **Board Buddy**! We welcome all kinds of contributions, whether it's fixing a bug, adding a feature, improving documentation, or reporting an issue.

## How to Contribute

### Reporting Issues

- Check the [existing issues](https://github.com/khlebobul/board_buddy/issues) to see if your issue has already been reported.
- If not, [open a new issue](https://github.com/khlebobul/board_buddy/issues/new) with a clear description, steps to reproduce, and any relevant screenshots.

### Submitting Code Changes

> [!IMPORTANT]
> scoring in most games can be done with a common counter, so before creating a game it is better to write to me

1. **Fork the Repository**: Click the "Fork" button at the top of the repository.
2. **Clone Your Fork**:
   ```sh
   git clone https://github.com/khlebobul/board_buddy.git
   cd board_buddy
   ```
3. **Create a New Branch**:
   ```sh
   git checkout -b feature/your-feature-name
   ```
4. **Make Changes & Commit**:
   - Keep commits clear and concise.
   - Follow the coding style and guidelines.
   - Use descriptive commit messages.
   ```sh
   git commit -m "Add feature: description of your change"
   ```
5. **Push to Your Fork**:
   ```sh
   git push origin feature/your-feature-name
   ```
6. **Submit a Pull Request (PR)**:
   - Go to the original repository.
   - Click "New Pull Request".
   - Choose your fork and branch, then describe your changes.

> [!NOTE]
> [pull request template](https://github.com/khlebobul/board_buddy/blob/main/.github/pull_request_template.md)

> [!IMPORTANT]
> - If scoring for the game you want to add can be done with a universal counter, you can add only the rules

### Code Guidelines

- Ensure code follows best practices and is well-documented.
- Format your code using [Dart's formatting guidelines](https://dart.dev/guides/language/effective-dart/style).

### Building & Running the Project

- To set up the project locally, ensure you have [Flutter](https://flutter.dev) installed. Then run:

```sh
flutter pub get
flutter run
```

- you can use [Makefile](https://github.com/khlebobul/board_buddy/blob/main/Makefile) to run the project:

```sh
make get
make run
```

- for VS Code users `launch.json` (`.vscode/launch.json`):

```json
{
  "configurations": [
    {
      "name": "board_buddy_debug",
      "type": "dart",
      "request": "launch",
      "program": "lib/main.dart"
    },
    {
      "name": "board_buddy_release",
      "type": "dart",
      "request": "launch",
      "program": "lib/main.dart",
      "args": ["--release"]
    }
  ]
}
```

### Dependency Management

- Run `flutter pub upgrade` to check for package updates.
- Ensure all dependencies are up-to-date and compatible.

### Localisation

- Add new translations in the `lib/l10n/` directory.
- Use the `intl` package to translate strings.

## How to Get in Touch

- Open an issue for discussion.

[![Email - khlebobul@gmail.com](https://img.shields.io/badge/Email-khlebobul%40gmail.com-414141?style=for-the-badge&logo=Email&logoColor=F1F1F1)](mailto:khlebobul@gmail.com) [![@khlebobul](https://img.shields.io/badge/%40khlebobul-414141?style=for-the-badge&logo=Telegram&logoColor=F1F1F1)](https://t.me/khlebobul) [![Personal - Website](https://img.shields.io/badge/Personal-Website-414141?style=for-the-badge&logo=Personal&logoColor=F1F1F1)](https://khlebobul.github.io/)

We appreciate your contribution and look forward to working together!
