
---

### 📁 `purrvana-be/README.md`

```md
# Purrvana Backend 🐾🧘

This is the Ruby on Rails API backend for **Purrvana**, a cat-themed meditation app. It manages users, sessions, and the cat companions.

## 🛠 Tech Stack

- **Ruby on Rails** (API-only)
- **PostgreSQL** database
- **JWT Authentication**

## 🧩 Endpoints

| Method | Endpoint                  | Description                       |
|--------|---------------------------|-----------------------------------|
| GET    | /api/v1/cats              | List all cat companions           |
| POST   | /api/v1/sessions          | Create a meditation session       |
| GET    | /api/v1/users/me          | Get current user info             |
| GET    | /api/v1/users/:id/most_used_cat | Get the user's favorite cat |
| POST   | /signup /login            | Auth routes                       |

## 🚀 Setup Instructions

```bash
git clone https://github.com/your-username/purrvana-be.git
cd purrvana-be
bundle install
rails db:create db:migrate db:seed
rails s
```

🔐 Authentication

JWT tokens are issued upon login and must be passed in headers for protected routes:

Authorization: Bearer <token>

🐈 Data Models

User: has many sessions

Cat: preset cat companions

Session: belongs to user and cat

UserCat: tracks most used cat per user
