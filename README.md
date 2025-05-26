# 🎬 movies_show

A Flutter app to browse and explore movies using **TMDb API**, built with **Clean Architecture** and **Flutter Bloc (Cubit)**.

---

## 🚀 Features

- 🔍 **Browse Popular Movies**
- 🧠 **Get Smart Movie Recommendations**
- 📝 **View Detailed Movie Info**:
  - Overview
  - Release Date
  - Runtime
  - Rating
- ⚙️ **Clean Architecture**:
  - Presentation (UI)
  - Domain (Business Logic)
  - Data (API, Models)
- 🔁 **State Management** using `Cubit`
- 🔒 **Error Handling**

---

## 🖼️ Screenshots

| Onboarding | Popular Movies | Recommendations List |
|--------------|------------------|---------------|
| ![Screenshot_1748203085](https://github.com/user-attachments/assets/b806b27c-b700-4b23-a371-948a51c2aa19) | ![Screenshot_1748202883](https://github.com/user-attachments/assets/b69ff707-e29e-49e5-93de-9e4be8e7f08e) | ![Screenshot_1748202878](https://github.com/user-attachments/assets/6edc780f-f63b-4ecc-a21a-7322396986ae) |

---

## 🛠️ Tech Stack

- **Flutter** 3.x
- **Dart**
- **Flutter Bloc** (Cubit)
- **Dio** – for API calls
- **GetIt** – for dependency injection
- **TMDb API** – movie data source

---

## 📂 Project Structure

``` lib/
├── core/ # Common utilities: errors, network, constants
├── features/ # Feature-based folder structure
│ └── movie_detail/
│ ├── data/ # Models, datasources, repository implementation
│ ├── domain/ # Entities, repositories (abstract), use cases
│ └── presentation/ # UI, blocs/cubits, widgets, pages
└── main.dart # App entry point```
