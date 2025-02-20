const express = require("express");
const cors = require("cors");
const usersRoutes = require("./src/routes/usersRoutes");

const app = express();
const PORT = process.env.PORT || 5080;

app.use(cors());
app.use(express.json());
app.use("/api", usersRoutes);

app.get("/", (req, res) => {
    res.send("HARRY STYLES IS THE BEST 💗🌟🤠💋");
});

app.listen(PORT, () => {
    console.log(`Suuucessoooo, servidor rodando na porta ${PORT} 💗🌟🤠💋`);
});