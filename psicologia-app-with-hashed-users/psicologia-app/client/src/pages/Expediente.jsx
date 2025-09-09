import { useEffect, useState } from 'react';
import api from '../api/axios';

export default function Expediente() {
  const [rows, setRows] = useState([]);
  useEffect(() => { api.get('/expedientes').then(r => setRows(r.data)).catch(()=>{}); }, []);
  return (
    <div style={{ maxWidth:1000, margin:'20px auto' }}>
      <h2>Expedientes clínicos</h2>
      <table border='1' width='100%' cellPadding='6'>
        <thead><tr><th>ID</th><th>Paciente</th><th>Psicólogo</th><th>Motivo</th><th>Estado emocional</th></tr></thead>
        <tbody>{rows.map(e => (<tr key={e.idexpediente}><td>{e.idexpediente}</td><td>{e.paciente_nombre} {e.apellidoPaterno}</td><td>{e.psicologo||'-'}</td><td>{e.motivo_consulta}</td><td>{e.estado_emocional}</td></tr>))}</tbody>
      </table>
    </div>
  );
}
