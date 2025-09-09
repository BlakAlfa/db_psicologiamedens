import dotenv from 'dotenv';
dotenv.config();
import app from './app.js';

const port = process.env.PORT || 5500;
app.listen(port, () => console.log('API escuchando en puerto', port));
