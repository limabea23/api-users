const postModel = require("../models/postModel");

const getAllPosts = async (req, res) => {
    try {
        const posts = await postModel.getAllPosts();
        res.json(posts);
    } catch (error) {
        res.status(500).json({ message: "Erro ao buscar usuários." });
    }
};

const getPost = async (req, res) => {
    try {
        const post = await postModel.getPostById(req.params.id);
        if (!post) {
            return res.status(404).json({ message: "Usuário não encontrado." });
        }
        res.json(post);
    } catch (error) {
        res.status(500).json({ message: "Erro ao buscar usuário." });
    }
};

const createPost = async (req, res) => {
    try {
        const { name, house_id } = req.body;
        const newPost = await postModel.createPost(name, house_id);
        res.status(201).json(newPost);
    } catch (error) {
        res.status(500).json({ message: "Erro ao criar usuário." });
    }
};

const updatePost = async (req, res) => {
    try {
        const { name, house_id } = req.body;
        const updatedPost = await postModel.updatePost(req.params.id, name, house_id);
        if (!updatedPost) {
            return res.status(404).json({ message: "usuário não encontrado." });
        }
        res.json(updatedPost);
    } catch (error) {
        res.status(500).json({ message: "Erro ao atualizar usuário." });
    }
};

const deletePost = async (req, res) => {
    try {
        const message = await postModel.deletePost(req.params.id);
        res.json(message);
    } catch (error) {
        res.status(500).json({ message: "Erro ao deletar usuário." });
    }
};

module.exports = { getAllPosts, getPost, createPost, updatePost, deletePost };