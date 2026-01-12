# Changelog

All notable changes to BudgetBudy will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2026-01-12

### Added
- 💰 Personal spending tracker with category-based transactions
- 📒 Khatabook-style party ledger for credit/debit management
- 📊 Visual analytics with charts and graphs using fl_chart
- 🗓️ Multiple time-based views: Daily, Weekly, Monthly, Yearly
- 💾 Offline-first architecture with SQLite database
- 📱 Phone number management with direct call integration
- 🎨 Modern Material Design UI with custom theming
- 🔄 Real-time balance calculations
- 📈 Transaction history grouped by date
- 🎯 12+ expense categories (Food, Transportation, Health, etc.)
- 👥 Party management with color-coded avatars
- 🔍 Recent activity view (last 7 days)
- ⚙️ Party settings with edit and delete functionality

### Features
- Two separate SQLite databases for better data organization
- Provider state management for reactive UI updates
- Color-coded balance indicators (red for debt, green for credit)
- Portrait-only orientation lock
- Custom fonts (OpenSans, Quicksand)
- Automatic balance aggregation
- Transaction CRUD operations
- Party CRUD operations

### Technical Details
- Flutter SDK: >=2.12.0 <4.0.0
- Dependencies: provider, sqflite, intl, fl_chart, url_launcher
- Platform: Android (iOS support pending)
- Database: SQLite with foreign key constraints

[1.0.0]: https://github.com/devaldaki3/BudgetBudy/releases/tag/v1.0.0
