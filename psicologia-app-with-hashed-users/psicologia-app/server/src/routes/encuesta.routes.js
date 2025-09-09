import { Router } from 'express';
import { pool } from '../config/db.js';
import { auth } from '../middleware/auth.js';

const router = Router();

router.get('/', auth, async (_req, res) => {
  const [rows] = await pool.query(`SELECT * FROM encuestas WHERE activa=1 ORDER BY fecha_creacion DESC`);
  res.json(rows);
});

router.get('/:id_encuesta/preguntas', auth, async (req, res) => {
  const [rows] = await pool.query(`SELECT * FROM preguntas WHERE id_encuesta = ?`, [req.params.id_encuesta]);
  res.json(rows);
});

router.post('/:id_encuesta/responder', auth, async (req, res) => {
  const { IdPaciente, respuestas } = req.body;
  const conn = await pool.getConnection();
  try {
    await conn.beginTransaction();
    for (const r of respuestas) {
      await conn.query(`INSERT INTO respuestas (IdPaciente, id_pregunta, respuesta_texto) VALUES (?,?,?)`, [IdPaciente, r.id_pregunta, r.respuesta_texto]);
    }
    await conn.commit();
    res.json({ ok: true });
  } catch (e) {
    await conn.rollback();
    res.status(500).json({ message: 'Error guardando respuestas', error: e.message });
  } finally {
    conn.release();
  }
});

export default router;
