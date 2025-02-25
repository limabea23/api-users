const Post = require("../models/Post");
const PostList = require("../models/PostList");

const lista = new PostList();

const post1 = new Post("7b253", "Love On Tour Brasil 22", "O cantor britânico, Harry Styles, fará uma turnê internacional intensa, que passará por diversas locais do globo", "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.instagram.com%2Flivenationbr%2Fp%2FCY6oOZmMGSu%2F&psig=AOvVaw0DBdF7bmeeVsk-pKsf98th&ust=1740573189058000&source=images&cd=vfe&opi=89978449&ved=0CBYQjRxqFwoTCICSrMfq3osDFQAAAAAdAAAAABAE");
lista.addPost(post1);

lista.addUser(new User("0009j33", "2025","Este foi o ano mais lindo da minha vida! Feliz ano novo, humanos lindos!", "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSKkSrQGiudlpG-qmweDZlRGth628NO6oQTgEjbVBoQX3PV9fFO"));

const router = {
    getAllPosts: (req, res) => {
        try {
            const posts = lista.getAllPosts();
            res.status(200).json(posts);
        } catch (error) {
            res.status(404).json({message: "erro ao buscar post :(", error});
        }
    },

    getPostById: (req, res) => {
        try {
            const post = lista.getPostById(req.params.id);
            res.status(200).json(user);
        } catch (error) {
            res.status(404).json({message: "post não encontrado :(", error});
        }
    },

    addPost: (req, res) => {
        try {
            const { id, title, description, url } = req.body;
            if (!id || !title || !description || !url) {
                throw new Error("preencha todos os campos!!!");
            }
            const newPost = new Post(id, title, description, url);
            lista.newPost(newPost);
            res.status(200).json({message: "post criado com sucesso :)"})
        } catch (error) {
            res.status(400).json({message: "erro ao adicionar post :(", error}); 
        }
    },

    updatePost: (req, res) => {
        try {
            const updatePost = lista.updatePost(req.params.id, req.body);
            res.status(200).json(updatePost);
        } catch (error) {
            res.status(404).json({message: "erro ao atualizar post :(", error});
        }
    },

    deletePost: (req, res) => {
        try {
            lista.deletePost(req.params.id);
            res.status(200).json({message: "post deletado com sucesso", IdDeletado: req.params.id});
        } catch (error) {
            res.status(404).json({message: "erro ao deletar post :(", error});
        }
    },
};

module.exports = router;