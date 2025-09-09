import React from 'react';
import ReactDOM from 'react-dom/client';
import { BrowserRouter, Routes, Route, Navigate } from 'react-router-dom';
import Login from './pages/Login.jsx';
import Pacientes from './pages/Pacientes.jsx';
import NuevoPaciente from './pages/NuevoPaciente.jsx';
import Expediente from './pages/Expediente.jsx';
import Citas from './pages/Citas.jsx';
import './styles.css';

function PrivateRoute({ children }) {
  const token = localStorage.getItem('token');
  return token ? children : <Navigate to='/login' replace />;
}

ReactDOM.createRoot(document.getElementById('root')).render(
  <BrowserRouter>
    <Routes>
      <Route path='/login' element={<Login />} />
      <Route path='/' element={<PrivateRoute><Pacientes /></PrivateRoute>} />
      <Route path='/pacientes/nuevo' element={<PrivateRoute><NuevoPaciente /></PrivateRoute>} />
      <Route path='/expedientes' element={<PrivateRoute><Expediente /></PrivateRoute>} />
      <Route path='/citas' element={<PrivateRoute><Citas /></PrivateRoute>} />
    </Routes>
  </BrowserRouter>
);
