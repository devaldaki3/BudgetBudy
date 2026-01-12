# Contributing to BudgetBudy

First off, thank you for considering contributing to BudgetBudy! 🎉

## How Can I Contribute?

### Reporting Bugs 🐛

Before creating bug reports, please check the existing issues to avoid duplicates. When you create a bug report, include as many details as possible:

- **Use a clear and descriptive title**
- **Describe the exact steps to reproduce the problem**
- **Provide specific examples**
- **Describe the behavior you observed and what you expected**
- **Include screenshots if possible**
- **Mention your Android version and device model**

### Suggesting Enhancements 💡

Enhancement suggestions are tracked as GitHub issues. When creating an enhancement suggestion:

- **Use a clear and descriptive title**
- **Provide a detailed description of the suggested enhancement**
- **Explain why this enhancement would be useful**
- **List any similar features in other apps**

### Pull Requests 🔧

1. Fork the repository
2. Create a new branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Test thoroughly
5. Commit your changes (`git commit -m 'Add some amazing feature'`)
6. Push to the branch (`git push origin feature/amazing-feature`)
7. Open a Pull Request

## Development Setup

1. **Install Flutter SDK** (>=2.12.0 <4.0.0)
   ```bash
   flutter doctor
   ```

2. **Clone the repository**
   ```bash
   git clone https://github.com/devaldaki3/BudgetBudy.git
   cd BudgetBudy
   ```

3. **Install dependencies**
   ```bash
   flutter pub get
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

## Code Style Guidelines

- Follow [Dart style guide](https://dart.dev/guides/language/effective-dart/style)
- Use meaningful variable and function names
- Add comments for complex logic
- Keep functions small and focused
- Use proper indentation (2 spaces)

## Project Structure

```
lib/
├── main.dart              # App entry point
├── models/                # Data models
├── screens/               # UI screens
├── widgets/               # Reusable widgets
├── database/              # Database helpers
└── constants/             # App constants
```

## Database Changes

If you're making changes to the database schema:
- Update the database version number
- Provide migration logic
- Test with existing data
- Document the changes in CHANGELOG.md

## Testing

Before submitting a PR:
- Test on multiple Android versions if possible
- Verify all features work correctly
- Check for memory leaks
- Ensure no crashes occur

## Commit Messages

Use clear and meaningful commit messages:
- ✨ `feat: Add new feature`
- 🐛 `fix: Fix bug in transaction calculation`
- 📝 `docs: Update README`
- 🎨 `style: Format code`
- ♻️ `refactor: Refactor database helper`
- ⚡ `perf: Improve chart rendering performance`
- ✅ `test: Add unit tests`

## Questions?

Feel free to open an issue with the `question` label or reach out to [@devaldaki3](https://github.com/devaldaki3).

## License

By contributing, you agree that your contributions will be licensed under the MIT License.

---

Thank you for contributing! 🙏
