const postModel = require("../models/postModel");

const getAllPosts = async (req, res) => {
    try {
        const posts = await postModel.getAllPosts();
        res.json(posts);
    } catch (error) {
        res.status(500).json({ message: "Erro ao buscar posts." });
    }
};

const getPost = async (req, res) => {
    try {
        const post = await postModel.getPostById(req.params.id);
        if (!post) {
            return res.status(404).json({ message: "Post não encontrado." });
        }
        res.json(post);
    } catch (error) {
        res.status(500).json({ message: "Erro ao buscar post." });
    }
};

const createPost = async (req, res) => {
    try {
        const { id_user, conteudo_post, anexo, data_publicacao } = req.body;
        const newPost = await postModel.createPost(id_user, conteudo_post, anexo, data_publicacao);
        res.status(201).json(newPost);
    } catch (error) {
        res.status(500).json({ message: "Erro ao criar post." });
    }
};

const updatePost = async (req, res) => {
    try {
        const { id_user, conteudo_post, anexo, data_publicacao } = req.body;
        const updatedPost = await postModel.updatePost(req.params.id, id_user, conteudo_post, anexo, data_publicacao);
        if (!updatedPost) {
            return res.status(404).json({ message: "Post não encontrado." });
        }
        res.json(updatedPost);
    } catch (error) {
        res.status(500).json({ message: "Erro ao atualizar post." });
    }
};

const deletePost = async (req, res) => {
    try {
        const message = await postModel.deletePost(req.params.id);
        res.json(message);
    } catch (error) {
        res.status(500).json({ message: "Erro ao deletar post." });
    }
};

module.exports = { getAllPosts, getPost, createPost, updatePost, deletePost };