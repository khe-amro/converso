# 🎓 Converso: Real-Time Voice AI Tutoring Platform

Converso is a modern, interactive SaaS Learning Management System (LMS) that lets students learn any topic in real-time through voice conversations with customized AI companions. Built with Next.js (Turbopack), Supabase, Clerk, Sentry, and Vapi.

---

## 🚀 Key Features

* **🗣️ AI Voice Companions**: Have live voice-to-voice tutoring sessions with AI avatars specializing in subjects like Mathematics, Coding, Science, Languages, and Economics.
* **🛡️ Secure Authentication**: User sign-in and profile synchronization powered by Clerk, including custom `/sign-in` and `/sign-up` catch-all flows.
* **📂 Session History**: Track your progress with completed lessons saved automatically to your profile journey.
* **🔖 Bookmarked Companions**: Save your favorite AI companions to quickly launch sessions with them from your dashboard.
* **🛠️ Companion Customizer**: Build your own AI companion, selecting custom parameters like voice gender, conversational style (formal vs. casual), subject, and custom topics.
* **⚡ Ultra Low-Latency Audio**: Seamless voice-to-voice latency using Vapi SDK and Daily.co WebRTC integrations.
* **💅 Modern Glassmorphic UI**: Beautiful, fully responsive layout styled using modern CSS variables, Tailwind, and Shadcn UI.

---

## ⚙️ Tech Stack

* **Framework**: [Next.js 16 (App Router)](https://nextjs.org/)
* **Database & BaaS**: [Supabase](https://supabase.com/)
* **Authentication**: [Clerk](https://clerk.com/)
* **Voice AI Engine**: [Vapi](https://vapi.ai/) (integrated with [ElevenLabs](https://elevenlabs.io/) & [Daily.co](https://www.daily.co/))
* **Styling**: [Tailwind CSS](https://tailwindcss.com/) & [Shadcn UI](https://ui.shadcn.com/)
* **Type Safety**: [TypeScript](https://www.typescriptlang.org/)
* **Form Validation**: [React Hook Form](https://react-hook-form.com/) & [Zod](https://zod.dev/)
* **Error Tracking**: [Sentry](https://sentry.io/)

---

## 🛠️ Local Installation

Follow these steps to set up the project locally on your machine.

### Prerequisites
Make sure you have installed:
* [Node.js 18+](https://nodejs.org/en)
* [npm](https://www.npmjs.com/)
* [Git](https://git-scm.com/)

### 1. Clone the repository
```bash
git clone https://github.com/your-username/converso.git
cd converso
```

### 2. Install dependencies
```bash
npm install
```

### 3. Set up environment variables
Create a `.env.local` file in the root directory and configure the variables:

```env
# Sentry Configuration
SENTRY_AUTH_TOKEN=your_sentry_token

# Vapi AI Web Integration
NEXT_PUBLIC_VAPI_WEB_TOKEN=your_vapi_public_token

# Clerk Authentication Configuration
NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY=your_clerk_publishable_key
CLERK_SECRET_KEY=your_clerk_secret_key
NEXT_PUBLIC_CLERK_SIGN_IN_URL=/sign-in
NEXT_PUBLIC_CLERK_SIGN_UP_URL=/sign-up
NEXT_PUBLIC_CLERK_SIGN_IN_FALLBACK_REDIRECT_URL=/
NEXT_PUBLIC_CLERK_SIGN_UP_FALLBACK_REDIRECT_URL=/

# Supabase Configuration
NEXT_PUBLIC_SUPABASE_URL=your_supabase_url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your_supabase_anon_key
```



### 4  . Running the Application
```bash
npm run dev
```
Open [http://localhost:3000](http://localhost:3000) in your browser.

---

## 📄 License
This project is licensed under the MIT License - see the [LICENSE.md](file:///c:\Users\amrok\Downloads\Converso\LICENSE.md) file for details.
