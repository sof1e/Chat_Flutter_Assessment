# 📱 Messaging App with Embedded Internal Tools Dashboard

## Flutter + Angular/Tailwind Coding Assessment

This project showcases a native Flutter messaging interface integrated with an Angular + Tailwind Internal Tools Dashboard, rendered inside a WebView.

It demonstrates cross-stack development, UI/UX design, and real-world mobile ↔ web integration.

---

## 🧭 Project Overview

### Tech Stack

- **Flutter** (UI, messaging, WebView integration)
- **Angular 16+** (Internal dashboard)
- **Tailwind CSS** (Responsive UI)
- **webview_flutter** (for in-app webpage rendering)

### Features

- ✅ Full chat UI (bubbles, timestamps, simulated replies)
- ✅ WebView loading local Angular server over HTTP
- ✅ Internal dashboard with:
  - Ticket Viewer
  - Knowledgebase Editor
  - Live Logs Panel
  - Navigation via Angular Router

---

## 📂 Project Structure

```
/
├── flutter_app/       # Flutter messaging app + WebView
├── webpage/           # Angular + Tailwind dashboard
└── README.md          # This document
```

---

## 🚀 Getting Started

### 1️⃣ Running the Angular Dashboard

#### Install dependencies
```bash
cd webpage
npm install
```

#### Start local server
```bash
ng serve --host 0.0.0.0 --port 4200
```

#### URL to use in WebView

| Platform | URL |
|----------|-----|
| Browser | `http://localhost:4200` |
| Android Emulator | `http://10.0.2.2:4200` |
| Android Device | `http://<your-local-ip>:4200` |
| iOS Simulator | `http://localhost:4200` |
| iOS Device | `http://<your-local-ip>:4200` |

💡 **For real devices**, phone + computer must be on the same Wi-Fi network.

### 2️⃣ Running the Flutter Messaging App

#### Install packages
```bash
cd flutter_app
flutter pub get
```

#### Run the app
```bash
flutter run
```

---

## 🛠 WebView Configuration Notes

### Android

**Use correct URL**
```dart
Uri.parse("http://10.0.2.2:4200")
```

**Add permissions** (AndroidManifest.xml)
```xml
<uses-permission android:name="android.permission.INTERNET"/>
<application android:usesCleartextTraffic="true">
```

### iOS

**Allow arbitrary loads** (Info.plist)
```xml
<key>NSAppTransportSecurity</key>
<dict>
  <key>NSAllowsArbitraryLoads</key><true/>
</dict>
```

---

## 💬 Flutter Messaging Features

✔ **Native chat interface**
- Incoming/outgoing message bubbles
- Timestamps
- Auto-scroll on new message
- Send text messages
- Image picker (camera + gallery)
- Simulated support agent reply
- Dark and light mode

✔ **Dashboard Screen**
- WebView with pull-to-refresh and reconnect behavior

---

## 🖥 Angular Dashboard Features

### 1. Ticket Viewer
- Dummy ticket data
- Filters: Open, In Progress, Closed
- Responsive Tailwind table

### 2. Knowledgebase Editor
- Two-pane text input + preview
- Save button (client-side only)

### 3. Live Logs
- Generates fake logs every few seconds
- Auto-scrolls to the bottom

### 4. Navigation
- Angular routing
- Sidebar/top navigation

---

## 🎯 Stretch Goals

- ✅ Chat auto-responder
- ✅ Image sending
- ✅ Tailwind responsive layout
- ✅ WebView fallback handling
- ✅ Message persistence (Shared Preferences)
- ✅ Notification badge
- ✅ Emoji support
- ✅ Dark/Light Mode

---

## 🎥 Demo Video

[▶️ Watch Demo Video](images/Flutter_Chat.gif)

---

## 📄 License

MIT License


For issues or questions, please open an issue on the repository.
