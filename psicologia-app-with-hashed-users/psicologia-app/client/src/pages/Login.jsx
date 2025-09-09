import { useState } from 'react';
import api from '../api/axios';

export default function Login() {
  const [login, setLogin] = useState('');
  const [password, setPassword] = useState('');
  const [err, setErr] = useState('');

  async function onSubmit(e) {
    e.preventDefault();
    try {
      const { data } = await api.post('/auth/login', { login, password });
      localStorage.setItem('token', data.token);
      window.location.href = '/';
    } catch (e) {
      setErr(e.response?.data?.message || 'Error');
    }
  }

  return (
    <form onSubmit={onSubmit} style={{ maxWidth:360, margin:'60px auto' }}>
      <h3>Ingresar</h3>
      <input placeholder='Usuario' value={login} onChange={e=>setLogin(e.target.value)} />
      <input placeholder='Contraseña' type='password' value={password} onChange={e=>setPassword(e.target.value)} />
      {err && <div style={{color:'red'}}>{err}</div>}
      <button>Entrar</button>
    </form>
  );
}
