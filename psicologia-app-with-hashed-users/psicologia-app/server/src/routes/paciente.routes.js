import { Router } from 'express';
import { pool } from '../config/db.js';
import { auth } from '../middleware/auth.js';
import { notifyNewPatient } from '../services/notify.js';

const router = Router();

router.get('/', auth, async (req, res) => {
  try {
    const [rows] = await pool.query('SELECT * FROM paciente ORDER BY idpaciente DESC');
    res.json(rows);
  } catch (e) {
    res.status(500).json({ message: 'Error listando pacientes', error: e.message });
  }
});

router.post('/', auth, async (req, res) => {
  const {
    nombre, apellidoPaterno, apellidoMaterno, fechaNacimiento, genero, curp,
    estadoCivil, Nohijos, religion, ocupacion, gradoEstudios, noHermanos, posicionOcupa, estatus
  } = req.body;
  try {
    const [result] = await pool.query(
      `INSERT INTO paciente (nombre, apellidoPaterno, apellidoMaterno, fechaNacimiento, genero, curp, estadoCivil, Nohijos, religion, ocupacion, gradoEstudios, noHermanos, posicionOcupa, estatus)
       VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)`,
      [nombre, apellidoPaterno, apellidoMaterno, fechaNacimiento, genero, curp, estadoCivil, Nohijos, religion, ocupacion, gradoEstudios, noHermanos, posicionOcupa, estatus ?? 1]
    );
    await notifyNewPatient({ nombre, apellidoPaterno, apellidoMaterno });
    res.status(201).json({ idpaciente: result.insertId });
  } catch (e) {
    res.status(500).json({ message: 'Error creando paciente', error: e.message });
  }
});

router.get('/:idpaciente', auth, async (req, res) => {
  try {
    const [rows] = await pool.query('SELECT * FROM paciente WHERE idpaciente = ?', [req.params.idpaciente]);
    if (!rows.length) return res.status(404).json({ message: 'No encontrado' });
    res.json(rows[0]);
  } catch (e) {
    res.status(500).json({ message: 'Error obteniendo paciente', error: e.message });
  }
});

router.put('/:idpaciente', auth, async (req, res) => {
  const data = req.body;
  const fields = ['nombre','apellidoPaterno','apellidoMaterno','fechaNacimiento','genero','curp','estadoCivil','Nohijos','religion','ocupacion','gradoEstudios','noHermanos','posicionOcupa','estatus'];
  const set = fields.map(f => `${f} = ?`).join(', ');
  const values = fields.map(f => data[f]);
  values.push(req.params.idpaciente);
  try {
    await pool.query(`UPDATE paciente SET ${set} WHERE idpaciente = ?`, values);
    res.json({ ok: true });
  } catch (e) {
    res.status(500).json({ message: 'Error actualizando paciente', error: e.message });
  }
});

export default router;
