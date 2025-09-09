import { useEffect, useState } from 'react';
import api from '../api/axios';
import { Link } from 'react-router-dom';

export default function Pacientes() {
  const [data, setData] = useState([]);
  useEffect(() => { api.get('/pacientes').then(r => setData(r.data)).catch(()=>{}); }, []);
  return (
    <div style={{ maxWidth:900, margin:'20px auto' }}>
      <h2>Pacientes</h2>
      <Link to='/pacientes/nuevo'>+ Nuevo</Link>
      <table border='1' width='100%' cellPadding='6'>
        <thead><tr><th>ID</th><th>Nombre</th><th>Apellido Paterno</th><th>Genero</th><th>Estatus</th></tr></thead>
        <tbody>{data.map(p => (<tr key={p.idpaciente}><td>{p.idpaciente}</td><td>{p.nombre}</td><td>{p.apellidoPaterno}</td><td>{p.genero}</td><td>{p.estatus}</td></tr>))}</tbody>
      </table>
    </div>
  );
}
