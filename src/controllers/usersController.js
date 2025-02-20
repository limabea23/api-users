const User = require("../models/User");
const UserList = require("../models/UserList");
const lista = new UserList();

lista.addUser(new User("Harry Styles", "harry.styles@gmail.com", 31));
lista.addUser(new User("Shawn Mendes", "shawn.mendes@gmail.com", 26));

const router = {
    getAllUsers: (req, res) => {
        res.json(lista.getAllUsers());
    },

    getUserById: (req, res) => {
        try {
            res.json(lista.getUserById(req.params.id));
        } catch (error) {
            res.status(404).json({message: "usuário não encontrado :(", error});
        }
    },

    addUser: (req, res) => {
        try {
            const { name, email, age} = req.body;
            if (!name || !email || age === undefined) {
                throw new Error("All required fields!!!");
            }
            const newUser = new User(name, email, age);
            lista.addUser(newUser);
            res.status(201).json(newUser);
        } catch (error) {
            res.status(400).json({message: "erro ao adicionar usuário :(", error});
        }
    },

    updateUser: (req, res) => {
        try {
            res.json(lista.updateUser(req.params.id, req.body));
        } catch (error) {
            res.status(404).json({message: "erro ao atualizar usuário :(", error});
        }
    },

    deleteUser: (req, res) => {
        lista.deleteUser(req.params.id);
        lista.deleteUser(200).json({message: "usuário deletado com sucesso", IdDeletado: req.params.id});
    },
};

module.exports = router;