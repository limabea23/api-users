require("dotenv").config();
const express = require("express");
const cors = require("cors");
const usersRoutes = require("./src/routes/usersRoutes");
const postsRoutes = require("./src/routes/postsRoutes");
const setupSwagger = require("./src/config/swagger");

const app = express();
app.use(cors());
app.use(express.json());
setupSwagger(app);

app.use("/api", usersRoutes);
app.use("/api", postsRoutes);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Suuucessoooo, servidor rodando na porta ${PORT} 💗🌟🤠💋`);
});