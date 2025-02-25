const express = require("express");
const cors = require("cors");
const usersRoutes = require("./src/routes/usersRoutes");
const postsRoutes = require("./src/routes/postsRoutes");

const app = express();
const PORT = 5080;

app.use(cors());
app.use(express.json());

app.use("/api/users", usersRoutes);
app.use("/api/posts", postsRoutes);

app.get("/", (req, res) => {
    res.send("HARRY STYLES IS THE BEST 💗🌟🤠💋");
});

app.listen(PORT, () => {
    console.log(`Suuucessoooo, servidor rodando na porta ${PORT} 💗🌟🤠💋`);
});