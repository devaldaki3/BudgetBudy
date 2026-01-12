<div align="center">

# BUDGETBUDY

_Detects Spendings, Ensures Quality, Accelerates Money Management_

[![Download APK](https://img.shields.io/badge/Download-APK%20v1.0.0-brightgreen?style=for-the-badge&logo=android)](https://github.com/devaldaki3/BudgetBudy/releases/latest)

![last commit](https://img.shields.io/github/last-commit/devaldaki3/BudgetBudy) ![version](https://img.shields.io/badge/version-1.0.0-blue) ![dart](https://img.shields.io/badge/dart-100%25-blue) ![license](https://img.shields.io/badge/license-MIT-green)

_Built with the tools and technologies:_

![Flutter](https://img.shields.io/badge/Flutter-02569B?logo=flutter&logoColor=white) ![Dart](https://img.shields.io/badge/Dart-0175C2?logo=dart&logoColor=white) ![Provider](https://img.shields.io/badge/Provider-FF6B6B?logo=flutter) ![SQLite](https://img.shields.io/badge/SQLite-003B57?logo=sqlite&logoColor=white) ![Material Design](https://img.shields.io/badge/Material%20Design-757575?logo=material-design)

</div>

---

<!-- App screenshot for quick visual reference -->

<div align="center">
  <img src="assets/images/app_icon.png" alt="App Screenshot" width="260" />
</div>

<hr>

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Getting Started](#getting-started)
  - [Clone the Repository](#1-clone-the-repository)
  - [Install Requirements](#2-install-requirements)
  - [Run the Application](#3-run-the-application)
- [Model & Data Layer](#model--data-layer)
- [Analytics](#analytics)
- [Export Options](#export-options)
- [License](#license)
- [Author](#author)
- [Screenshots](#screenshots)

## Overview

**BudgetBudy** is a personal finance and ledger management app built with **Flutter**. It combines:

- a **daily spending tracker** for your own expenses, and
- a **Khatabook-style party ledger** for tracking who you will give / who you will get money from.

It's designed to streamline **personal finance management**, reduce manual calculation errors, and provide real-time insights using local SQLite storage — all **offline**, no internet required.

## Features

- 📊 **Daily/Weekly/Monthly/Yearly Views**

  Track your spending across multiple time ranges with tabbed navigation.

- 💰 **Category-Based Transactions**

  Add expenses with title, amount, date, and category for better organization.

- 👥 **Khatabook-Style Party Ledger**

  Create parties (contacts) and track "gave" or "got" transactions per party.

- 📈 **Automatic Balance Calculation**

  See **You will give** and **You will get** totals automatically calculated.

- 🎨 **Modern UI Design**

  Clean Material Design with custom fonts (`OpenSans`, `Quicksand`) and color-coded balances.

- 📊 **Visual Analytics**

  Charts and graphs using `fl_chart` for spending patterns and trends.

- 💾 **Offline Storage**

  All data stored locally using SQLite — no backend or internet connection needed.

- 🔄 **Real-Time Updates**

  Provider state management ensures UI updates instantly when data changes.

## Tech Stack

- **Framework/UI**: Flutter, Material Design
- **Language**: Dart
- **State Management**: Provider
- **Local Database**: SQLite (sqflite)
  - Separate databases for spendings (`spendings.db`) and party ledger (`khatabook.db`)
- **Utilities & Libraries**:
  - `intl` – Date formatting and localization
  - `fl_chart` – Beautiful charts and graphs
  - `random_color` – Color utilities for UI
  - `url_launcher` – Open external links

## Getting Started

### 📥 Option 1: Download APK (Recommended for Users)

**For Android users who just want to use the app:**

1. **Download the latest APK** from the [Releases page](https://github.com/devaldaki3/BudgetBudy/releases/latest)
2. **Enable "Install from Unknown Sources"** in your Android settings:
   - Go to Settings → Security → Unknown Sources (Enable)
   - Or Settings → Apps → Special Access → Install Unknown Apps → Select your browser → Allow
3. **Install the APK** by opening the downloaded file
4. **Open BudgetBudy** and start tracking your finances! 🎉

**Requirements:**
- Android 5.0 (Lollipop) or higher
- ~20 MB storage space

---

### 🛠️ Option 2: Build from Source (For Developers)

**For developers who want to modify or contribute:**

#### 1. Clone the Repository

```bash
git clone https://github.com/devaldaki3/BudgetBudy.git
cd BudgetBudy
```

#### 2. Install Requirements

Make sure Flutter is installed and configured:

```bash
flutter doctor
```

Then install project dependencies:

```bash
flutter pub get
```

#### 3. Run the Application

```bash
flutter run
```

Select your device/emulator when prompted.  
The app will start with the **Home** screen (spending tabs). You can navigate to the Khatabook ledger from the drawer or dedicated navigation option.

#### 4. Build APK (Optional)

To build your own release APK:

```bash
flutter build apk --release
```

The APK will be generated at: `build/app/outputs/flutter-apk/app-release.apk`


## Model & Data Layer

### Personal Spending (`Transaction` / `Transactions`)

- **Transaction Model**:
  - `id`, `title`, `amount`, `date`, `category`
- **Transactions Provider**:
  - Stores list of transactions in memory
  - Persists data via `DBhelp/dbhelper.dart` into `spendings.db`
  - Provides CRUD operations: `addTransactions`, `deleteTransaction`, `fetchTransactions`
  - Filters: daily, weekly, monthly, yearly, recent (last 7 days)
  - Aggregations for charts and totals

### Party Ledger (`Party`, `TransactionModel`)

- **Party Model**:
  - `id`, `name`, `phone`
- **TransactionModel**:
  - `id?`, `partyId`, `amount`, `type (gave/got)`, `date`, `note`
- **Database Helper** (`database/db_helper.dart`):
  - Creates and manages `khatabook.db`
  - Tables:
    - `parties` (id, name, phone)
    - `transactions` (linked to parties via foreign key)
  - Provides functions to:
    - Insert/update/delete parties and transactions
    - Compute per-party balance and totals
    - Get transactions by party ID

## Analytics

- **Time-Based Analytics**: Daily, weekly, monthly, yearly spending breakdowns
- **Chart Visualizations**: Using `fl_chart` for pie charts and bar graphs
- **Balance Summary**:
  - Total spending across all transactions
  - "You will give" vs "You will get" totals for party ledger
- **Recent Activity**: Last 7 days transaction view

## 🤝 Contributing

Contributions are welcome! Please check out our [Contributing Guidelines](CONTRIBUTING.md) for details on how to get started.

### Ways to Contribute:
- 🐛 Report bugs
- 💡 Suggest new features
- 🔧 Submit pull requests
- 📝 Improve documentation
- ⭐ Star this repository

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

Developed with ❤️ by [@devaldaki3](https://github.com/devaldaki3)

## 🙏 Support

If you find this project helpful:
- ⭐ **Star this repository** to show your support
- 🐛 **Report issues** on the [Issues page](https://github.com/devaldaki3/BudgetBudy/issues)
- 💬 **Share feedback** and suggestions
- 🔄 **Fork and contribute** to make it better

## 📞 Contact

Have questions or suggestions? Feel free to:
- Open an [issue](https://github.com/devaldaki3/BudgetBudy/issues)
- Start a [discussion](https://github.com/devaldaki3/BudgetBudy/discussions)


## Screenshots

<div align="center">

<table>
<tr>
<td width="50%">

**Home Screen - Daily Spending**

<img src="assets/images/Home_Screen.png" alt="Home Screen" width="100%" />

</td>
<td width="50%">

**Party List - Khatabook Ledger**

<img src="assets/images/Party_List.png" alt="Party List" width="100%" />

</td>
</tr>
</table>

</div>

[⬆️ Back to Top](#table-of-contents)
