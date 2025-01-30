# Astronomy Picture of the Day App

## Introduction

This iOS/Android application utilizes the Astronomy Picture of the Day (APOD) API to fetch and display daily astronomical images along with their detailed metadata. The app allows users to view the image of the day or select a different date to retrieve historical images.

## Features

- **Daily Images**: Automatically fetches and displays the astronomy picture of the day along with its title, description, and copyright notice.
- **Date Selection**: Users can select any valid past date to view images from previous days.
- **Input Validation**: Ensures that all user inputs for dates are valid and not in the future.
- **Network Handling**: Properly handles network requests and displays appropriate error messages for various potential issues, such as API limits or missing content.
- **HTTPS Enforcement**: All network requests are made via HTTPS for security.

## Network and API Interaction

- **API Key**: Utilizes the APOD demo API key which is subject to request limits (30 requests per hour and 50 per day). Users can also register for their own API key for higher limits.
- **Error Handling**: Displays user-friendly error messages directly in the app interface in case of API limit exceedance or other network issues.
- **Media Support**: While the primary focus is on displaying images, the app acknowledges when the media of the day is a video by informing the user, as video playback is not supported.

## Getting Started

### Prerequisites

- iOS: Xcode and a valid iOS development environment.
- Android: Android Studio and a valid Android development environment.

### Installation

1. Clone the repository:
2. Open the project in Xcode or Android Studio.
3. Build and run the application on your device or emulator.

## Usage

Upon launching, the app displays the current day's astronomical image. To view images from other dates:
1. Use the date selection feature in the app to input a desired date.
2. Validate the input and view the image from the selected date.


## Submission

- Zip up your project directory.
- If applying for extra credit, include a note in the project submission detailing the implemented extra features and how to use them.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
