// check-and-run.js
import express from "express";
import mysql from "mysql2/promise";
import jwt from "jsonwebtoken";
import bcrypt from "bcryptjs";
import nodemailer from "nodemailer";
import { spawn } from "child_process";

console.log("✅ Verificando entorno...");

// 1. Mostrar versiones
console.log("Node.js version:", process.version);
console.log("Platform:", process.platform);

// 2. Probar Express
try {
  const app = express();
  app.get("/", (req, res) => res.send("Express OK"));
  console.log("✅ Express cargado correctamente");
} catch (err) {
  console.error("❌ Error con Express:", err);
}

// 3. Probar MySQL2
try {
  mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "test"
  });
  console.log("✅ mysql2 cargado correctamente");
} catch (err) {
  console.error("❌ Error con mysql2:", err);
}

// 4. Probar JWT
try {
  const token = jwt.sign({ test: true }, "secret", { expiresIn: "1h" });
  jwt.verify(token, "secret");
  console.log("✅ JWT funcionando");
} catch (err) {
  console.error("❌ Error con JWT:", err);
}

// 5. Probar bcryptjs
try {
  const hash = bcrypt.hashSync("12345", 10);
  bcrypt.compareSync("12345", hash);
  console.log("✅ bcryptjs funcionando");
} catch (err) {
  console.error("❌ Error con bcryptjs:", err);
}

// 6. Probar nodemailer
try {
  nodemailer.createTransport({
    jsonTransport: true
  });
  console.log("✅ Nodemailer cargado correctamente");
} catch (err) {
  console.error("❌ Error con Nodemailer:", err);
}

console.log("🔍 Verificación de dependencias finalizada");

// 7. Intentar levantar el servidor
console.log("\n🚀 Iniciando servidor desde src/server.js ...");

const server = spawn("node", ["src/server.js"], { stdio: "inherit" });

server.on("close", (code) => {
  console.log(`💡 El servidor se cerró con código ${code}`);
});

