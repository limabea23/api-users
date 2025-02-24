const User = require("../models/User");
const UserList = require("../models/UserList");

const lista = new UserList();

const user1 = new User("Harry Styles", "harry.styles@gmail.com", 31)
lista.addUser(new user1);

lista.addUser(new User("Shawn Mendes", "shawn.mendes@gmail.com", 26));

const router = {
    getAllUsers: (req, res) => {
        try {
            const users = lista.getAllUsers();
            res.status(200).json(users);
        } catch (error) {
            res.status(404).json({message: "Erro ao buscar usuário :(", error});
        }
    },

    getUserById: (req, res) => {
        try {
            const user = lista.getUserById(req.params.id);
            res.status(200).json(user);
        } catch (error) {
            res.status(404).json({message: "usuários não encontrado :(", error});
        }
    },

    addUser: (req, res) => {
        try {
            const { name, email, age} = req.body;
            if (!name || !email || age === undefined) {
                throw new Error("preencha todos os campos!!!");
            }
            const newUser = new User(name, email, age);
            lista.addUser(newUser);
            res.status(200).json({message: "usuário criado com sucesso :)"})
        } catch (error) {
            res.status(400).json({message: "erro ao adicionar usuário :(", error});
        }
    },

    updateUser: (req, res) => {
        try {
            const updatedUser = lista.updateUser(req.params.id, req.body);
            res.status(200).json(updatedUser);
        } catch (error) {
            res.status(404).json({message: "erro ao atualizar usuário :(", error});
        }
    },

    deleteUser: (req, res) => {
        try {
            lista.deleteUser(req.params.id);
            lista.deleteUser(200).json({message: "usuário deletado com sucesso", IdDeletado: req.params.id});
        } catch (error) {
            res.status(404).json({message: "Erro ao deletar usuário :(", error});
        }
    },
};

module.exports = router;