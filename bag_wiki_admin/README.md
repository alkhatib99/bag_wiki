
# Bag Wiki Admin

A professional Flutter Web admin dashboard for managing content on the Bag Wiki website.

## Overview

Bag Wiki Admin is a responsive Flutter Web application designed to manage content sections for the public-facing Bag Wiki website. This admin dashboard provides a clean, intuitive interface for content administrators to view, create, edit, and delete website sections through a REST API connected to a PostgreSQL database.

The dashboard serves as the content management system (CMS) for the main `bag_wiki` site, allowing administrators to update the website content without directly modifying code. It follows the same section structure and content format as the public site to ensure consistency.

## Key Features

-**Complete CRUD Operations**

- View all website sections in a responsive grid/list layout
- Create new sections with title, content, and image URL
- Edit existing section content with real-time image preview
- Delete sections with confirmation dialog

-**Responsive Design**

- Adapts between grid view (desktop) and list view (mobile)
- Clean, intuitive interface with proper form validation
- Optimized for various screen sizes and orientations

-**Modern State Management**

- Utilizes GetX for efficient state management
- Reactive UI updates without excessive rebuilds
- Clean separation of concerns (MVC architecture)

-**API Integration**

- Connects to RESTful API endpoints
- Handles asynchronous operations with loading states
- Provides user feedback for all operations

## Tech Stack

-**Flutter Web 3.x** - UI framework

-**GetX** - State management

-**HTTP package** - API communication

-**Dart 3.x** - Programming language

-**REST API** - Backend communication

-**PostgreSQL** - Database (backend)

## Project Structure

```

lib/

├── main.dart                    # Application entry point

├── models/

│   └── section_model.dart       # Data model for content sections

├── services/

│   └── section_service.dart     # API service for section operations

├── controllers/

│   └── section_controller.dart  # Business logic and state management

└── views/

    ├── dashboard_view.dart      # Main dashboard with section listing

    └── edit_section_view.dart   # Form for creating/editing sections

```

## Setup and Run Instructions

### Prerequisites

- Flutter SDK 3.0.0 or higher
- Dart SDK 3.0.0 or higher
- An active internet connection for API communication

### Installation

1. Clone the repository:

   ```bash

   git clone https://github.com/yourusername/bag_wiki_admin.git

   cd bag_wiki_admin

   ```
2. Install dependencies:

   ```bash

   flutter pub get

   ```
3. Run the application in debug mode:

   ```bash

   flutter run -d chrome

   ```

### Building for Production

Generate a production build with:

```bash

flutterbuildweb--release

```

The built files will be available in the `build/web` directory.

## API Integration

The admin dashboard connects to a REST API with the following endpoints:

### Endpoints

| Method | Endpoint          | Description                | Request Body                                       | Response                 |

| ------ | ----------------- | -------------------------- | -------------------------------------------------- | ------------------------ |

| GET    | /api/sections     | Fetch all sections         | -                                                  | Array of section objects |

| POST   | /api/sections     | Create a new section       | `{ "title": "", "content": "", "imageUrl": "" }` | Created section object   |

| PUT    | /api/sections/:id | Update an existing section | `{ "title": "", "content": "", "imageUrl": "" }` | Updated section object   |

| DELETE | /api/sections/:id | Delete a section           | -                                                  | 204 No Content           |

### Example API Usage

```dart

// Fetching sections

final response = await http.get(Uri.parse('/api/sections'));

List<dynamic> jsonResponse = json.decode(response.body);

return jsonResponse.map((data) => SectionModel.fromJson(data)).toList();


// Creating a section

final response = await http.post(

  Uri.parse('/api/sections'),

  headers: {'Content-Type': 'application/json'},

  body: json.encode(section.toJson()),

);

```

## Deployment

### Firebase Hosting

1. Install Firebase CLI:

   ```bash

   npm install -g firebase-tools

   ```
2. Login to Firebase:

   ```bash

   firebase login

   ```
3. Initialize Firebase in your project:

   ```bash

   firebase init hosting

   ```

   - Select your Firebase project
   - Specify `build/web` as your public directory
   - Configure as a single-page app: Yes
   - Set up automatic builds and deploys: No
4. Deploy to Firebase:

   ```bash

   firebase deploy --only hosting

   ```

### Vercel Deployment

1. Install Vercel CLI:

   ```bash

   npm install -g vercel

   ```
2. Login to Vercel:

   ```bash

   vercel login

   ```
3. Deploy to Vercel:

   ```bash

   vercel

   ```

   - Follow the prompts to link to your Vercel account
   - Specify `build/web` as your output directory

## Configuration

To configure the API base URL, modify the `baseUrl` variable in `lib/services/section_service.dart`:

```dart

finalString baseUrl = 'https://your-api-url.com/api/sections';

```

## License

This project is proprietary and owned by the Bag Wiki organization.

---

© 2025 Bag Wiki. All Rights Reserved.
