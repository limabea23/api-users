CREATE DATABASE apiusuarios;

\c apiusuarios;

CREATE TABLE users (
    id_user SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
);

INSERT INTO users (name, username, email) VALUES
('Harry Styles', 'hstyles', 'harry.styles@1d.com'),
('Liam Payne', 'liamp', 'liam.payne@1d.com'),
('Zayn Malik', 'zaynz', 'zayn.malik@1d.com'),
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

INSERT INTO users (name, username, email, photo) VALUES
('Corbyn Besson', 'corbynbesson', 'corbyn@whydontwe.com', NULL),
('Jonah Marais', 'jonahmarais', 'jonah@whydontwe.com', NULL),
('Daniel Seavey', 'danielseavey', 'daniel@whydontwe.com', NULL),
('Jack Avery', 'jackavery', 'jack@whydontwe.com', NULL),
('Zach Herron', 'zachherron', 'zach@whydontwe.com', NULL),
('Any Gabrielly', 'anygabrielly', 'any@nowunited.com', NULL),
('Noah Urrea', 'noahurrea', 'noah@nowunited.com', NULL),
('Sabina Hidalgo', 'sabinahidalgo', 'sabina@nowunited.com', NULL),
('Alex Mandon Rey', 'alexmandonrey', 'alex@nowunited.com', NULL),
('Josh Beauchamp', 'joshbeauchamp', 'josh@nowunited.com', NULL),
('Heyoon Jeong', 'heyoonjeong', 'heyoon@nowunited.com', NULL),
('Sina Deinert', 'sinadeinert', 'sina@nowunited.com', NULL),
('Shivani Paliwal', 'shivanipaliwal', 'shivani@nowunited.com', NULL),
('Joalin Loukamaa', 'joalinloukamaa', 'joalin@nowunited.com', NULL),
('Bailey May', 'baileymay', 'bailey@nowunited.com', NULL),
('Sofya Plotnikova', 'sofyaplotnikova', 'sofya@nowunited.com', NULL),
('Savannah Clarke', 'savannahclarke', 'savannah@nowunited.com', NULL),
('Diarra Sylla', 'diarrasyl', 'diarra@nowunited.com', NULL),
('Nour Ardakani', 'nourardakani', 'nour@nowunited.com', NULL),
('Hina Yoshihara', 'hinayoshihara', 'hina@nowunited.com', NULL),
('Krystian Wang', 'krystianwang', 'krystian@nowunited.com', NULL),
('Lamar Morris', 'lamarmorris', 'lamar@nowunited.com', NULL);
('Kim Namjoon (RM)', 'rm', 'rm@bts.com', NULL),
('Kim Seokjin (Jin)', 'jin', 'jin@bts.com', NULL),
('Min Yoongi (SUGA)', 'suga', 'suga@bts.com', NULL),
('Jung Hoseok (J-Hope)', 'jhope', 'jhope@bts.com', NULL),
('Park Jimin', 'jimin', 'jimin@bts.com', NULL),
('Kim Taehyung (V)', 'v', 'v@bts.com', NULL),
('Jeon Jungkook', 'jungkook', 'jungkook@bts.com', NULL),
('Post Malone', 'postmalone', 'post@music.com', NULL),
('Ariana Grande', 'arianagrande', 'ariana@music.com', NULL),
('Bruno Mars', 'brunomars', 'bruno@music.com', NULL),
('Shawn Mendes', 'shawnmendes', 'shawn@music.com', NULL),
('Justin Bieber', 'justinbieber', 'justin@music.com', NULL),
('Cole Sprouse', 'colesprouse', 'cole@actors.com', NULL),
('Haley Lu Richardson', 'haleylurichardson', 'haley@actors.com', NULL),
('Moises Arias', 'moisesarias', 'moises@actors.com', NULL),
('Chase Stokes', 'chasestokes', 'chase@actors.com', NULL),
('Madelyn Cline', 'madelyncline', 'madelyn@actors.com', NULL),
('Rudy Pankow', 'rudypankow', 'rudy@actors.com', NULL),
('Jonathan Daviss', 'jonathandaviss', 'jonathan@actors.com', NULL),
('Carlacia Grant', 'carlaciagrant', 'carla@actors.com', NULL),
('Madison Bailey', 'madisonbailey', 'madison@actors.com', NULL),
('Drew Starkey', 'drewnstarkey', 'drew@actors.com', NULL),
('Chris Martin', 'chrismartin', 'chris@coldplay.com', NULL),
('Jonny Buckland', 'jonnybuckland', 'jonny@coldplay.com', NULL),
('Guy Berryman', 'guyberryman', 'guy@coldplay.com', NULL),
('Will Champion', 'willchampion', 'will@coldplay.com', NULL),
('Phil Harvey', 'philharvey', 'phil@coldplay.com', NULL),
('Peso Pluma', 'pesopluma', 'peso@musica.com', NULL);