CREATE DATABASE apiusers;

\c apiusers;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    age INTEGER NOT NULL
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    photo TEXT,
    comments TEXT,
    likes INTEGER 
);

INSERT INTO users (name, email, age) VALUES 
('Kally Ponce', 'kally.ponce@gmail.', 14),
('Dante Barkin', 'dante.barkin@gmail.com', 17),
('Tina Barkin', 'tina.barkin@gmail.com', 13),
('Kevin Alvarez', 'kevin.barkin@gmail.com', 17),
('Alex Alvarez', 'alex.alvarez@gmail.com', 17),
('Gloria Skyler', 'gloria.skyler@gmail.com', 18),
('Stefi Loreto', 'stefi.loreto@gmail.com', 18);

INSERT INTO posts (title, description, photo, comments, likes) VALUES
('primeiro dia no Allegro', 'eu estou tao feliz de ter entrado aqui... meu sonho foi realizado', 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fpt.quizur.com%2Fquiz%2Fvoce-conseguiria-entrar-no-conservatorio-de-musica-allegro-BD4s&psig=AOvVaw0d14giSElf3KsLKSQx1c_1&ust=1744994427737000&source=images&cd=vfe&opi=89978449&ved=0CBUQjRxqFwoTCJCJ3prB34wDFQAAAAAdAAAAABAJ', '@carmen.ponce19: parabéns minha filha!!!', 15)