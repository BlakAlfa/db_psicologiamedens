import { Router } from 'express';
import { pool } from '../config/db.js';
import { auth } from '../middleware/auth.js';

const router = Router();

router.get('/', auth, async (req, res) => {
  try {
    const [rows] = await pool.query(`
      SELECT c.*, p.nombre AS paciente, u.nombre AS psicologo
      FROM citas c
      INNER JOIN paciente p ON c.IdPaciente = p.idpaciente
      INNER JOIN usuario u ON c.idusuario = u.idusuario
      ORDER BY c.fecha_cita DESC
    `);
    res.json(rows);
  } catch (e) {
    res.status(500).json({ message: 'Error listando citas', error: e.message });
  }
});

router.post('/', auth, async (req, res) => {
  const { IdPaciente, fecha_cita, motivo, estado } = req.body;
  try {
    const [result] = await pool.query(`
      INSERT INTO citas (IdPaciente, idusuario, fecha_cita, motivo, estado)
      VALUES (?, ?, ?, ?, ?)
    `, [IdPaciente, req.user.idusuario, fecha_cita, motivo ?? null, estado ?? 'programada']);
    res.status(201).json({ IdCita: result.insertId });
  } catch (e) {
    res.status(500).json({ message: 'Error creando cita', error: e.message });
  }
});

export default router;

