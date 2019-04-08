PRAGMA foreign_keys = ON;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  lname VARCHAR NOT NULL,
  fname VARCHAR NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  body TEXT NOT NULL,
  reply_id INTEGER,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  
  FOREIGN KEY (reply_id) REFERENCES replies(id),
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO
  users (lname, fname)
VALUES
  ('Mooney', 'Kyle'),
  ('Poehler', 'Amy'),
  ('Jobs', 'Steve'),
  ('Wann', 'Dax');

INSERT INTO
  questions (title, body, user_id)  
VALUES
  (
    'What''s heredoc?', 
    'Lorem ipsum dolor amet crucifix pinterest chartreuse pork belly brunch, photo booth slow-carb keffiyeh pop-up cardigan pickled affogato hella. XOXO salvia ennui, literally messenger bag bushwick prism crucifix ramps. Etsy enamel pin gentrify shabby chic tofu flannel pinterest poke celiac pok pok. Tumeric craft beer church-key occupy umami kale chips synth pabst iceland crucifix butcher pitchfork.', 
    (
      SELECT
        id
      FROM
        users
      WHERE
        lname = 'Mooney'
    )
  ),

