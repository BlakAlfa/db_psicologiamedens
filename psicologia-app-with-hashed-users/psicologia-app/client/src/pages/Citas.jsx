import { useEffect, useState } from 'react';
import api from '../api/axios';

export default function Citas() {
  const [rows, setRows] = useState([]);
  useEffect(() => { api.get('/citas').then(r => setRows(r.data)).catch(()=>{}); }, []);
  return (
    <div style={{ maxWidth:1000, margin:'20px auto' }}>
      <h2>Citas</h2>
      <table border='1' width='100%' cellPadding='6'>
        <thead><tr><th>ID</th><th>Paciente</th><th>Psicólogo</th><th>Fecha</th><th>Estado</th></tr></thead>
        <tbody>{rows.map(c => (<tr key={c.IdCita}><td>{c.IdCita}</td><td>{c.paciente}</td><td>{c.psicologo}</td><td>{new Date(c.fecha_cita).toLocaleString()}</td><td>{c.estado}</td></tr>))}</tbody>
      </table>
    </div>
  );
}

