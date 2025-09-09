import { useState } from 'react';
import api from '../api/axios';
import { useNavigate } from 'react-router-dom';

export default function NuevoPaciente() {
  const [form, setForm] = useState({ nombre:'', apellidoPaterno:'', apellidoMaterno:'', genero:'', estatus:1 });
  const [msg, setMsg] = useState('');
  const nav = useNavigate();
  const onChange = e => setForm(f=>({...f, [e.target.name]: e.target.value}));

  async function onSubmit(e) {
    e.preventDefault();
    setMsg('');
    try {
      await api.post('/pacientes', form);
      setMsg('Paciente creado y psicóloga notificada');
      setTimeout(()=>nav('/'),800);
    } catch (e) {
      setMsg(e.response?.data?.message || 'Error al crear');
    }
  }

  return (
    <form onSubmit={onSubmit} style={{ maxWidth:600, margin:'20px auto' }}>
      <h3>Nuevo Paciente</h3>
      <input name='nombre' placeholder='Nombre' onChange={onChange} />
      <input name='apellidoPaterno' placeholder='Apellido Paterno' onChange={onChange} />
      <input name='apellidoMaterno' placeholder='Apellido Materno' onChange={onChange} />
      <input name='genero' placeholder='Género' onChange={onChange} />
      <button>Guardar</button>
      {msg && <div>{msg}</div>}
    </form>
  );
}
