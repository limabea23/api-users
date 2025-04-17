CREATE DATABASE apiusuarios;

\c apiusuarios;

CREATE TABLE users (
    id_user SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL
);

INSERT INTO users (name, username, email) VALUES
('Harry Styles', 'hstyles', 'harry.styles@1d.com'),
('Liam Payne', 'liamp', 'liam.payne@1d.com'),
('Zayn Malik', 'zaynz', 'zayn.malik@1d.com');
('Niall Horan', 'niallh', 'niall.horan@1d.com'),
('Louis Tomlinson', 'louist', 'louis.tomlinson@1d.com');

CREATE TABLE posts (
    id_post SERIAL PRIMARY KEY,
    id_user INT NOT NULL,
    conteudo_post TEXT NOT NULL,
    anexo TEXT, 
    data_publicacao DATE,
    CONSTRAINT fk_user FOREIGN KEY (id_user) REFERENCES users(id_user)
);

INSERT INTO posts (id_user, conteudo_post, anexo, data_publicacao) VALUES
(1, 'Love you all so much. Treat People With Kindness.', 'tpwk-tour.jpg', '2025-04-01'),
(2, 'Working hard in the studio these days. Cant wait to share this with you all.', NULL, '2025-04-02'),
(3, 'Creating freely and honestly. Music has never felt this good.', 'zayn_studio.jpg', '2025-04-03'),
(4, 'Had the best time playing live again. Youre the best fans in the world.', NULL, '2025-04-04'),
(5, 'Big love to everyone whos been supporting the new music. Means the world.', 'louis_live.jpg', '2025-04-05');