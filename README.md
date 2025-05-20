# BAG Guild About Us - Flutter GetX Web Application

A professional web-based About Us page for BAG Guild built with Flutter and GetX, featuring a responsive sidebar navigation, section banners, and multiple content sections.

*[للغة العربية اضغط هنا](README_AR.md)*

![BAG Guild Logo](web/favicon.png)

## Overview

This project is a Flutter web application that implements an "About Us" page for BAG Guild using the GetX state management library. The application features a sidebar navigation system, banner images for each section, and multiple content sections that showcase different aspects of the BAG Guild organization.

## Features

- **Responsive Design**: Works seamlessly across desktop and mobile devices
- **Sidebar Navigation**: Easy access to all sections with visual feedback for active selection
- **Section Banners**: Eye-catching banner images at the top of each section
- **GetX State Management**: Efficient state management with minimal boilerplate code
- **BAG Guild Theming**: Custom theme that matches the BAG Guild brand identity
- **17 Content Sections**: Comprehensive structure covering all aspects of the organization

## Project Structure

```
lib/
├── controllers/
│   ├── content_controller.dart    # Manages section content and banner images
│   └── navigation_controller.dart # Handles sidebar navigation state
├── models/
│   └── section_model.dart         # Data model for content sections with imageUrl
├── screens/
│   └── home_screen.dart           # Main screen with sidebar and content area
├── theme/
│   └── app_theme.dart             # Custom theme definitions
├── widgets/
│   ├── section_content_widget.dart # Displays section content and banner
│   └── sidebar_widget.dart         # Sidebar navigation component
└── main.dart                       # Application entry point
```

## Sections Included

1. BAG Intro
2. About Us
3. Our Vision
4. The Team
5. Official Links
6. FAQ
7. BAG Royals
8. Strategic Investments
9. Our DApp
10. Nomad Point
11. Our Airdrop
12. Vote For Your Game (Idea)
13. Vote For Your Game (Result)
14. Tokenomics
15. Our Partners
16. Games We've Collabed With
17. Roadmap

## Getting Started

### Prerequisites

- Flutter SDK (version 3.19.0 or higher)
- Dart SDK (version 3.3.0 or higher)
- Web browser (Chrome recommended for development)

### Installation

1. Clone the repository or extract the provided ZIP file:

```bash
git clone <repository-url>
# or
unzip bag_about_us_flutter_getx.zip -d bag_about_us
```

2. Navigate to the project directory:

```bash
cd bag_about_us
```

3. Install dependencies:

```bash
flutter pub get
```

### Running the Application

Run the application in debug mode:

```bash
flutter run -d chrome
```

For a production build:

```bash
flutter build web
```

The built files will be available in the `build/web` directory.

## Customization

### Modifying Content and Banner Images

To update the content and banner images of each section, edit the `loadSections()` method in `lib/controllers/content_controller.dart`:

```dart
void loadSections() {
  sections.value = [
    SectionModel(
      id: 'intro',
      title: 'BAG Intro',
      content: 'Your updated content here...',
      imageUrl: 'https://example.com/your-banner-image.jpg', // Banner image URL
    ),
    // Other sections...
  ];
}
```

### Adding New Sections with Banners

1. Add a new `SectionModel` in the `loadSections()` method in `content_controller.dart`, including an imageUrl for the banner
2. The sidebar will automatically update to include the new section
3. The banner will be displayed at the top of the section content

Example:
```dart
SectionModel(
  id: 'new-section',
  title: 'New Section Title',
  content: 'Content for the new section...',
  imageUrl: 'https://example.com/new-section-banner.jpg',
),
```

### Banner Image Requirements

- Banner images should have a 16:9 or 3:1 aspect ratio for best display
- Recommended minimum resolution: 1200x400 pixels
- Supported formats: JPG, PNG, WebP
- For optimal performance, use compressed images under 500KB

### Changing Theme Colors

To modify the theme colors, edit the color constants in `lib/theme/app_theme.dart`:

```dart
static const Color primaryPurple = Color(0xFF9353D3); // Change this value
```

## Deployment

### Web Hosting

After building the web version with `flutter build web`, you can deploy the contents of the `build/web` directory to any web hosting service.

### GitHub Pages

1. Create a GitHub repository
2. Build the web version: `flutter build web`
3. Push the contents of `build/web` to the `gh-pages` branch

## Technologies Used

- [Flutter](https://flutter.dev/) - UI framework
- [GetX](https://pub.dev/packages/get) - State management
- [Dart](https://dart.dev/) - Programming language

## License

This project is proprietary and owned by BAG Guild.

## Contact

For any inquiries about this project, please contact BAG Guild through their official channels.

---

© 2025 BAG Guild. All Rights Reserved.
