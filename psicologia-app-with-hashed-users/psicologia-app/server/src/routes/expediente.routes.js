import { Router } from 'express';
import { pool } from '../config/db.js';
import { auth } from '../middleware/auth.js';

const router = Router();

router.get('/', auth, async (req, res) => {
  try {
    const [rows] = await pool.query(`
      SELECT e.*, p.nombre AS paciente_nombre, p.apellidoPaterno, u.nombre AS psicologo
      FROM expediente_clinico e
      INNER JOIN paciente p ON e.idpaciente = p.idpaciente
      LEFT JOIN usuario u ON e.idusuario = u.idusuario
      ORDER BY e.idexpediente DESC
    `);
    res.json(rows);
  } catch (e) {
    res.status(500).json({ message: 'Error listando expedientes', error: e.message });
  }
});

router.post('/', auth, async (req, res) => {
  const {
    idpaciente, motivo_consulta, estado_emocional, historial_personal,
    antecedentes_psicologicos, medicamentos, diagnostico, plan_terapeutico,
    seguimiento_evolucion, expectativas_atencion, objetivo_atencion
  } = req.body;
  try {
    const [result] = await pool.query(`
      INSERT INTO expediente_clinico
       (idpaciente, idusuario, motivo_consulta, estado_emocional, historial_personal, antecedentes_psicologicos, medicamentos, diagnostico, plan_terapeutico, seguimiento_evolucion, expectativas_atencion, objetivo_atencion, fecha, estatus)
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW(), 'activo')
    `, [
      idpaciente, req.user?.idusuario ?? null, motivo_consulta, estado_emocional, historial_personal,
      antecedentes_psicologicos, medicamentos, diagnostico, plan_terapeutico,
      seguimiento_evolucion, expectativas_atencion, objetivo_atencion
    ]);
    res.status(201).json({ idexpediente: result.insertId });
  } catch (e) {
    res.status(500).json({ message: 'Error creando expediente', error: e.message });
  }
});

router.get('/:idexpediente', auth, async (req, res) => {
  const { idexpediente } = req.params;
  try {
    const [rows] = await pool.query(`
      SELECT e.*, p.nombre AS paciente_nombre, u.nombre AS psicologo
      FROM expediente_clinico e
      INNER JOIN paciente p ON e.idpaciente = p.idpaciente
      LEFT JOIN usuario u ON e.idusuario = u.idusuario
      WHERE e.idexpediente = ?
    `, [idexpediente]);
    if (!rows.length) return res.status(404).json({ message: 'No encontrado' });
    res.json(rows[0]);
  } catch (e) {
    res.status(500).json({ message: 'Error', error: e.message });
  }
});

export default router;
