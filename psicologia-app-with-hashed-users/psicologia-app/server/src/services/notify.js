import nodemailer from 'nodemailer';
import dotenv from 'dotenv';
dotenv.config();

const transporter = nodemailer.createTransport({
  host: process.env.MAIL_HOST,
  port: +process.env.MAIL_PORT,
  secure: false,
  auth: { user: process.env.MAIL_USER, pass: process.env.MAIL_PASS }
});

export async function notifyNewPatient({ nombre, apellidoPaterno, apellidoMaterno }) {
  const to = process.env.NOTIFY_TO;
  if (!to) return null;
  const html = `<p>Nuevo paciente: <b>${nombre} ${apellidoPaterno || ''} ${apellidoMaterno || ''}</b></p>`;
  const info = await transporter.sendMail({
    from: `"Psicologia App" <${process.env.MAIL_USER}>`,
    to,
    subject: `Nuevo paciente registrado: ${nombre}`,
    html
  });
  return info.messageId;
}
