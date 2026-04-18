# Task: Build a Basic Nova AI Assistant App (Flutter + GetX + Gemini)

You are tasked with building a **basic AI assistant mobile app (Nova)** using a simple, lightweight tech stack.

---

## Tech Stack (Strict)

* Flutter
* GetX (state management, routing, dependency injection)
* Google Gemini API (for AI responses)

Do NOT introduce additional architectures, frameworks, or unnecessary complexity.

---

## Objective

Build a **minimal working AI chat assistant** with clean structure, basic UI, and proper GetX usage.

---

## Requirements

### 1. Project Structure

Create a simple feature-based structure:

```
lib/
 ├── core/
 │    ├── services/        (Gemini API service)
 │    └── utils/
 │
 ├── features/
 │    ├── chat/
 │    │    ├── controllers/
 │    │    ├── views/
 │    │    └── models/
 │    │
 │    └── home/
 │
 ├── routes/
 │
 └── main.dart
```

Keep everything minimal and easy to understand.

---

### 2. GetX Implementation

Use GetX for:

* State management (`GetxController`)
* Navigation (`GetMaterialApp`, named routes)
* Dependency injection (`Bindings`, `Get.lazyPut`)

#### Create:

* ChatController
* GeminiService

Controller should:

* Store messages using `.obs`
* Handle sending messages
* Call Gemini service

---

### 3. Routing & Bindings

Implement proper GetX routing.

#### Route Names

* `/` → Home
* `/chat` → Chat screen

#### Create:

* `AppRoutes`
* `AppPages`

Each page must have its own binding.

#### Bindings

* ChatBinding:

  * Inject `GeminiService`
  * Inject `ChatController`

* HomeBinding:

  * Keep minimal (only if needed)

---

### 4. Gemini API Integration

Create a simple service:

* Function: `sendMessage(String prompt)`
* Returns AI response string

No backend required (direct API call is acceptable for this basic project).

---

### 5. Chat Screen UI

Implement a basic chat interface:

* Text input field
* Send button
* Message list using `ListView.builder`
* Display user + AI messages

Optional (if easy):

* Markdown rendering
* Loading indicator

---

### 6. App Setup

Use `GetMaterialApp`:

* Set `initialRoute`
* Provide `getPages`
* Disable debug banner

---

### 7. UI Guidelines (Simple iOS-like Feel)

* Use Cupertino widgets where possible
* Keep UI clean and minimal
* Add smooth animations (200–300ms)
* Use rounded corners and spacing

---

### 8. Constraints

* Keep the app lightweight
* Avoid complex features (no memory systems, no backend)
* Do not overengineer

---

## Deliverables

Provide:

1. Folder structure

2. All required Dart files:

   * main.dart
   * routes (AppRoutes, AppPages)
   * bindings
   * controller
   * service
   * views

3. Working chat flow:

   * User sends message
   * Gemini returns response
   * Response displayed in UI

---

## Success Criteria

* App runs without errors
* Navigation works using GetX
* Chat flow works end-to-end
* Code is clean and minimal

---

**End of Task**
