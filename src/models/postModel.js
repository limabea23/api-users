const pool = require("../config/database");

const getAllPosts = async () => {
    const result = await pool.query(
        `SELECT posts.*, users.name AS user_name 
        FROM posts 
        LEFT JOIN users ON posts.user_id = users.id`
    );
    return result.rows;
};

const getPostById = async (id) => {
    const result = await pool.query(
        `SELECT posts.*, users.name AS user_name 
        FROM posts 
        LEFT JOIN users ON posts.user_id = users.id 
        WHERE posts.id = $1`, [id]
    );
    return result.rows[0];
};

const createPost = async (id_post, id_user, conteudo_post, anexo, data_publicacao) => {
    const result = await pool.query(
        "INSERT INTO posts (id_post, id_user, conteudo_post, anexo, data_publicacao) VALUES ($1, $2, $3, $4, $5) RETURNING *",
        [id_post, id_user, conteudo_post, anexo, data_publicacao]
    );
    return result.rows[0];
};

const updatePost = async (id, id_post, id_user, conteudo_post, anexo, data_publicacao) => {
    const result = await pool.query(
        "UPDATE posts SET id_post = $1, id_user = $2, conteudo_post = $3, anexo = $4, data_publicacao = $5 WHERE id = $6 RETURNING *",
        [id_post, id_user, conteudo_post, anexo, data_publicacao, id]
    );
    return result.rows[0];
};

const deletePost = async (id) => {
    const result = await pool.query("DELETE FROM posts WHERE id = $1 RETURNING *", [id]);

    if (result.rowCount === 0) {
        return { error: "Post não encontrado." };
    }

    return { message: "Post deletado com sucesso." };
};

module.exports = { getAllPosts, getPostById, createPost, updatePost, deletePost };