const pool = require("../config/database");

const getAllUsers = async () => {
    const result = await pool.query(
        `SELECT users.*, posts.name AS post_name 
        FROM users 
        LEFT JOIN posts ON users.post_id = posts.id`
    );
    return result.rows;
};

const getUserById = async (id) => {
    const result = await pool.query(
        `SELECT users.*, post.name AS post_name 
        FROM users 
        LEFT JOIN post ON users.post_id = post.id 
        WHERE users.id = $1`, [id]
    );
    return result.rows[0];
};

const createUser = async (name, email, age) => {
    const result = await pool.query(
        "INSERT INTO users (name, email, age) VALUES ($1, $2, $3) RETURNING *",
        [name, email, age]
    );
    return result.rows[0];
};

const updateUser = async (id, name, email, age) => {
    const result = await pool.query(
        "UPDATE users SET name = $1, email = $2 age = $3 WHERE id = $4 RETURNING *",
        [name, email, age, id]
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