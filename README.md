# Psicologia App (Node.js + React)

## Contenido
- `server/` - Backend Express + MySQL2 (JWT auth, roles, nodemailer notify)
- `client/` - Frontend React (Vite) with login and modules (Pacientes, Expedientes, Citas)
- `psicologiamedens.sql` - Your DB dump (included)

## Requisitos
- Node.js 16+
- npm
- XAMPP / MySQL with the imported database `dbsistema`

## Pasos rápidos
1. Importa `psicologiamedens.sql` a tu phpMyAdmin (asegúrate que la BD se llame `psicologia`).

2. Backend:

   ```bash
   cd psicologia-app/server
   cp .env.example .env
   # editar .env con tus credenciales DB y correo
   npm install
   npm run dev
   ```

3. Frontend:

   ```bash
   cd ../client
   npm install
   npm run dev
   ```

4. Abre http://localhost:5173 (Vite) para acceder al frontend.


## Credenciales de prueba (según tu dump)

- user: `admin` (revisar contraseña en la tabla `usuario` en el dump)


## Notas

- El backend usa un archivo `.env` con las variables: DB_HOST, DB_USER, DB_PASSWORD, DB_NAME, JWT_SECRET, MAIL_*

- He incluido lógica básica de roles usando la tabla `usuario_permiso`. Revisa y ajusta permisos según tu preferencia.

