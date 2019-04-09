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

/* seed users */

INSERT INTO
  users (lname, fname)
VALUES
  ('Mooney', 'Kyle'),
  ('Poehler', 'Amy'),
  ('Jobs', 'Steve'),
  ('Wann', 'Dax');

/* seed questions */

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
  ), (
    'Python or Ruby?',
    'Ennui marfa health goth, green juice crucifix tumeric fixie sriracha twee craft beer messenger bag. VHS leggings selfies, tofu quinoa deep v brooklyn helvetica try-hard paleo fanny pack austin flexitarian. Af biodiesel pickled asymmetrical affogato hexagon craft beer, lumbersexual franzen food truck. Fashion axe bitters hell of, ennui yuccie polaroid williamsburg aesthetic meditation authentic photo booth gentrify etsy franzen.',
    (
      SELECT
        id
      FROM
        users
      WHERE
        lname = 'Wann'
    )
  );

/* seed question follows */

INSERT INTO
  question_follows (question_id, user_id)
VALUES
  (1, 2),
  (2, 3),
  (1, 3);

/* seed replies */

INSERT INTO
  replies (body, reply_id, user_id, question_id)
VALUES
  (
    'Banh mi bushwick YOLO migas, brunch activated charcoal deep v messenger bag art party pug banjo dreamcatcher. Pabst gentrify locavore, roof party wayfarers small batch snackwave chia raclette asymmetrical vexillologist. Cliche irony paleo bitters humblebrag tilde four dollar toast cold-pressed farm-to-table salvia narwhal lumbersexual retro. Kickstarter glossier cronut viral. Flexitarian waistcoat lyft freegan chartreuse.',
    NULL,
    3,
    1
  ),
  (
    'Put a bird on it mustache farm-to-table, gentrify health goth butcher 3 wolf moon jean shorts green juice. Tumblr tousled pop-up pour-over, food truck truffaut vape next level. Williamsburg synth hexagon mixtape salvia. Chicharrones tousled artisan taxidermy, gentrify butcher shaman. Jean shorts craft beer meh, artisan YOLO beard poke af swag tattooed tofu yr.',
    1,
    4,
    1
  ),
  (
    'Distillery vice blog fingerstache photo booth PBR&B semiotics tilde la croix 3 wolf moon franzen direct trade. Gochujang intelligentsia hell of, organic 3 wolf moon selvage keffiyeh brooklyn narwhal coloring book typewriter truffaut iceland. Irony unicorn tote bag godard blue bottle truffaut food truck pitchfork organic leggings tumblr man braid etsy everyday carry. Skateboard actually poke selfies health goth. Trust fund mixtape mlkshk meggings, twee truffaut green juice. Gochujang vice pickled, crucifix street art banjo blue bottle. Schlitz cornhole af banh mi green juice health goth.',
    NULL,
    2,
    2
  ),
  (
    'Lorem ipsum dolor amet dIY beard yuccie kale chips plaid literally raclette hashtag church-key XOXO vegan typewriter. Af la croix taxidermy green juice slow-carb pork belly fashion axe bicycle rights ugh. Man bun wayfarers actually, mixtape leggings vegan raw denim ugh authentic you probably haven''t heard of them seitan distillery. Cred trust fund poutine, scenester snackwave pickled leggings tofu vaporware direct trade mlkshk franzen cardigan shabby chic. Master cleanse hammock pop-up single-origin coffee.',
    3,
    1,
    2
  );

/* seed likes */

INSERT INTO
  question_likes (question_id, user_id)
VALUES
  (1, 4),
  (1, 2),
  (1, 3),
  (2, 1),
  (2, 4);
