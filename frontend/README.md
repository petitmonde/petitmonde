# Frontend

Vue 3 + Quasar + TypeScript frontend application for PetitMonde.

## Setup

```bash
# From root directory
make install-frontend

# Or directly
cd frontend
npm install
```

## Structure

```
frontend/
├── src/
│   ├── assets/         # Static assets
│   ├── boot/           # Quasar boot files
│   ├── components/     # Vue components
│   ├── composables/    # Composition functions
│   ├── config/         # App configuration
│   ├── css/            # Global styles
│   ├── layouts/        # Page layouts
│   ├── pages/          # Page components
│   ├── router/         # Vue Router config
│   ├── services/       # API services
│   ├── stores/         # Pinia stores
│   └── types/          # TypeScript types
├── public/             # Public static files
└── .quasar/            # Quasar generated files
```

## Development

```bash
# Start dev server
npm run dev
# or: quasar dev

# Build for production
npm run build

# Lint
npm run lint

# Format
npm run format
```

## Environment Variables

Create `.env` file:

```env
VITE_API_BASE_URL=http://localhost:8000
```

## Tech Stack

- **Vue 3** (Composition API with `<script setup>`)
- **Quasar** (UI Framework)
- **TypeScript** (Strict mode)
- **Pinia** (State management)
- **Vue Router** (Routing)
- **Vite** (Build tool)
- **ESLint + Prettier** (Code quality)

# or

npm run format

````

### Build the app for production

```bash
quasar build
````

### Customize the configuration

See [Configuring quasar.config.js](https://v2.quasar.dev/quasar-cli-vite/quasar-config-js).
