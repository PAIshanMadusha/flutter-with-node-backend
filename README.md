# 🧑‍🏫 Flutter With Node Backend - A Flutter Crud App

A full-stack CRUD (Create, Read, Update, Delete) app built with Flutter for the frontend and Node.js for the backend. It allows users to add, view, update, and delete user data. The backend uses Express.js to expose a RESTful API and MongoDB (via Mongoose) for data storage. On the frontend, Flutter offers a user interface, using Provider for state management and HTTP for backend communication. The application also features an animated Lottie splash screen, adding a polished and engaging user experience.

## 🌟 Features:

### 📱 Client Side (Flutter):
- Create users by inserting (Name, Job Title, Email, Mobile Number).
- View list of users.
- Update user details.
- Delete a single user.
- Animated splash screen using Lottie.

### 🧱 Backend (Node.js):
- RESTful API built with Express.js.
- MongoDB for data storage using Mongoose.
- Environment variables handled with dotenv.
- CORS enabled for cross-origin requests.

---

## 🧑‍💻 Tech Stack:
The following tech stack was used in this project for both the frontend and backend:

### ⚙️ Technologies Used:
- Flutter & Dart :  For building the mobile frontend.
- Node.js & Express.js : For creating the backend RESTful API.
- MongoDB : NoSQL database used to store user data.
- Mongoose : For interacting with MongoDB.
- Provider & HTTP (Flutter) : For state management and API calls
- Lottie : For animated splash screen.
- CORS & Dotenv : For handling cross-origin requests and environment variables.
- Nodemon : For auto-reloading the backend during development.

### 📱 Frontend : Flutter:
| Dependency | Description |
|------------|-------------|
| `http: ^1.3.0` | For making API requests |
| `provider: ^6.1.4` | Manages user data and app state in Flutter |
| `lottie: ^3.3.1` | Splash screen animation |

### 🧱 Backend : Node.js:
| Package | Description |
|---------|-------------|
| `express: ^5.1.0` | Web framework that handles API routes for user CRUD operations |
| `mongoose: ^8.13.2` | MongoDB object modeling |
| `cors: ^2.8.5` | Cross-Origin Resource Sharing |
| `dotenv: ^16.5.0` | Loads environment variables |
| `nodemon: ^3.1.9` | Automatically restarts the server on changes |

---

## 📡 API Endpoints:

> Replace `[your Wireless IPv4 Address]` with your actual local IP address when testing.

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST   | `http://[your Wireless IPv4 Address]:5000/api/users` | Create a new user |
| GET    | `http://[your Wireless IPv4 Address]:5000/api/users` | Get all users |
| PUT    | `http://[your Wireless IPv4 Address]:5000/api/users/update/[user.id]` | Update a user |
| DELETE | `http://[your Wireless IPv4 Address]:5000/api/users/delete/[user.id]` | Delete a user |

---

## 🏃‍♂️ How to Run the Project:

### 1. **✅ Frontend Configuration (Flutter):**

#### Clone the repository:
```bash
git clone https://github.com/PAIshanMadusha/flutter-with-node-backend.git
```

#### Navigate to the project directory and to the **Client Side**:
```bash
cd flutter-with-node-backend
cd flutter_client
```

#### Install dependencies:
```bash
flutter pub get
```

#### Update the base URL in the client side:

1. Open `flutter_client/lib/services/user_services.dart`.
2. Replace the **base URL** on **line 8** (e.g., `"http://192.168.8.150:5000/api/users"`) with your **IP address**.

**How to find your IP address**:
- Open **Command Prompt** on your Windows machine.
- Type `ipconfig` and press Enter.
- Look for the **IPv4 Address** under the **Wireless LAN adapter Wi-Fi** section and use that as the IP to replace `192.168.8.150`.

---

### 2. **✅ Backend Configuration (Node.js):**

#### Navigate to the **Backend** directory:
```bash
cd node_node_backend
```

#### Install dependencies:
```bash
npm install
```

### 3. **✅ Database Setup (MongoDb):**

Install **MongoDB** if you haven’t already, or start it if it’s already installed. Then, create a `.env` file in the root of the `node_backend` directory and add the following content:

```env
PORT = 5000
MONGODB_URL = mongodb://127.0.0.1:27017/user_management_system
```

#### Start the backend server:
```bash
npm start
```

If the server starts successfully, you should see the following message in your terminal:
```
MongoDB Connected Successfully!
```

#### ✅ Now you can run the app. Make sure you're inside the flutter_client directory and there are no errors:

```bash
cd flutter_client
flutter run
```
## 📸 System Screenshots:

---

<p align="center">
  <img src="https://github.com/user-attachments/assets/2cb43732-b090-4f38-872b-6bb70687fde8" alt="Screenshot 1" width="175">&nbsp;&nbsp;&nbsp;
  <img src="https://github.com/user-attachments/assets/dc70ee6a-b142-450b-a83b-25285610e78a" alt="Screenshot 2" width="175">&nbsp;&nbsp;&nbsp;
  <img src="https://github.com/user-attachments/assets/d8d75f6f-8635-48a5-afa4-8d2cd8771a10" alt="Screenshot 3" width="175">&nbsp;&nbsp;&nbsp;
  <img src="https://github.com/user-attachments/assets/69bbabc5-3523-44e7-9c63-222f46ed9b4a" alt="Screenshot 4" width="175">&nbsp;&nbsp;&nbsp;
</p>

---

### 👨‍💻 Created by: 
**Ishan Madhusha**  
GitHub: [PAIshanMadusha](https://github.com/PAIshanMadusha)

Feel free to explore my work and get in touch if you'd like to collaborate! 🚀

---

## 📝 License:  
This project is open-source and available under the MIT License.
