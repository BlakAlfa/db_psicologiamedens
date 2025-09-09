import { Router } from 'express';
import { pool } from '../config/db.js';
import jwt from 'jsonwebtoken';
import bcrypt from 'bcryptjs';
import dotenv from 'dotenv';
dotenv.config();

const router = Router();

router.post('/login', async (req, res) => {
  const { login, password } = req.body;
  try {
    const [rows] = await pool.query('SELECT idusuario, nombre, login, clave, email, cargo FROM usuario WHERE login = ? LIMIT 1', [login]);
    if (!rows.length) return res.status(401).json({ message: 'Credenciales inválidas' });
    const user = rows[0];
    let ok = false;
    if (user.clave && user.clave.startsWith('$2')) {
      ok = await bcrypt.compare(password, user.clave);
    } else {
      ok = password === user.clave;
    }
    if (!ok) return res.status(401).json({ message: 'Credenciales inválidas' });
    const token = jwt.sign({ idusuario: user.idusuario, nombre: user.nombre }, process.env.JWT_SECRET, { expiresIn: '8h' });
    res.json({ token, user: { idusuario: user.idusuario, nombre: user.nombre } });
  } catch (e) {
    res.status(500).json({ message: 'Error login', error: e.message });
  }
});

export default router;
