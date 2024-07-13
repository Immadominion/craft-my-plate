# craftmyplate

## Overview

Craft My Plate is a test project I built for an interview for a remote job. Would definitely update y'all if eventually I get the job.{CMP} is a very modern design food tech application.

## Features

- **Phone Auth:** Easy and quick login with phone
- **Sleek and modern UI** Don't know this designer personally, but he did a great job.

## Screenshots

### OTP Verification Screen

![OTP Screen](ss/img1.png)

### Home Screen

![Home Screen](ss/img2.png)

## Setup Instructions

### Prerequisites

- Flutter installed on your machine. Follow the instructions ([Test live here](https://appetize.io/app/b_fhq3l5zt3xt7natrel5fx32cb4)) to install Flutter.

### Steps

1. **Clone the Repository**

   ```sh
   git clone https://github.com/Immadominion/craft-my-plate.git
   cd simple_shopping_app
   ```

2. **Get Flutter Packages**

   ```sh
   flutter pub get

   ```

3. **Run the App**
   ```sh
   flutter run
   ```

<!-- ## Appetize Demo

- You can view a live demo of the app on Appetize.io ([here](would-add-link-here-soon)) -->

## Project Structure

```

    lib/
    |- main.dart
    |- core/
    |   |- constants/
    |   |    |- enum.dart
    |- data/
    |   |- model/
    |   |- controllers/
    |   |- local/
    |   |- services/
    |   |- types/
    |   |- presentation/
    |       |- screens/
    |       |- sections/
    |       |- widgets/
    |    |- dashboard.dart/
    |    |- splash.dart/
    |- utils/
    |- firebase_options_super_secret_intelligence.dart
    |- main.dart
```

## Code Overview

### Main file

- Main File (lib/main.dart): Contains the main entry point of the app, sets up navigation, and manages the state of the checkout list.
