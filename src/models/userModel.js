const pool = require("../config/database");

const getAllUsers = async () => {
    const result = await pool.query(`SELECT * FROM users`);
    return result.rows;
};

const getUserById = async (id) => {
    const result = await pool.query(
        `SELECT * FROM users WHERE id_user = $1`, 
        [id]
    );
    return result.rows[0];
};

const createUser = async (name, username, email, photo) => {
    const result = await pool.query(
        "INSERT INTO users (name, username, email, photo) VALUES ($1, $2, $3, $4) RETURNING *",
        [name, username, email, photo]
    );
    return result.rows[0];
};

const updateUser = async (id, name, username, email, photo) => {
    const result = await pool.query(
        "UPDATE users SET name = $1, username = $2, email = $3, photo = $4 WHERE id = $4 RETURNING *",
        [name, username, email, photo, id]
    );
    return result.rows[0];
};

const deleteUser = async (id) => {
    const result = await pool.query("DELETE FROM users WHERE id = $1 RETURNING *", [id]);

    if (result.rowCount === 0) {
        return { error: "Usuário não encontrado." };
    }

    return { message: "Usuário deletado com sucesso." };
};

module.exports = { getAllUsers, getUserById, createUser, updateUser, deleteUser };