import express from 'express';
import cors from 'cors';
import authRoutes from './routes/auth.routes.js';
import pacienteRoutes from './routes/paciente.routes.js';
import expedienteRoutes from './routes/expediente.routes.js';
import citaRoutes from './routes/cita.routes.js';
import encuestaRoutes from './routes/encuesta.routes.js';

const app = express();
app.use(cors());
app.use(express.json());

app.use('/api/auth', authRoutes);
app.use('/api/pacientes', pacienteRoutes);
app.use('/api/expedientes', expedienteRoutes);
app.use('/api/citas', citaRoutes);
app.use('/api/encuestas', encuestaRoutes);

export default app;
