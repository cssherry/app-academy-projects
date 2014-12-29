DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id INTEGER PRIMARY KEY,

  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255) NOT NULL
);


-- DO NOT PUT COMMAS AFTER LAST ELEMENT, IT BREAKS ALL THE THINGS

DROP TABLE IF EXISTS questions;
CREATE TABLE questions (

  id INTEGER PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  body TEXT,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS question_followers;
CREATE TABLE  question_followers (
  id INTEGER PRIMARY KEY,

  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

DROP TABLE IF EXISTS replies;
CREATE TABLE replies (
  id INTEGER PRIMARY KEY,

  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  parent_id INTEGER,
  body TEXT,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

DROP TABLE IF EXISTS question_likes;
CREATE TABLE  question_likes (
  id INTEGER PRIMARY KEY,

  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);


INSERT INTO
users (fname, lname)
VALUES
('Joe', 'Ass'), ('Sue', 'Ass');

INSERT INTO
questions (title, body, user_id)
VALUES
('Courses?', 'What courses do you teach?', (SELECT id FROM users WHERE fname = 'Joe')),
('Canceled?', 'Why are courses not canceled today?', (SELECT id FROM users WHERE fname = 'Sue'));


INSERT INTO
question_followers(question_id, user_id)
VALUES
((SELECT id FROM questions WHERE title = 'Canceled?'),(SELECT id FROM users WHERE fname = 'Sue')),
((SELECT id FROM questions WHERE title = 'Canceled?'),(SELECT id FROM users WHERE fname = 'Joe')),
((SELECT id FROM questions WHERE title = 'Courses?'),(SELECT id FROM users WHERE fname = 'Joe'));

INSERT INTO
replies (question_id, user_id, parent_id, body)
VALUES
((SELECT id FROM questions WHERE title = 'Canceled?'), (SELECT id FROM users WHERE fname = 'Joe'), NULL, 'We suck... we cannot help it. Ass in class.' ),
((SELECT id FROM questions WHERE title = 'Canceled?'), (SELECT id FROM users WHERE fname = 'Sue'), (SELECT id FROM replies WHERE body like '%suck%'), 'Yeah...that makes sense. :(' );

INSERT INTO
question_likes(question_id, user_id)
VALUES
((SELECT id FROM questions WHERE title = 'Canceled?'),(SELECT id FROM users WHERE fname = 'Joe')),
((SELECT id FROM questions WHERE title = 'Courses?'),(SELECT id FROM users WHERE fname = 'Joe')),
((SELECT id FROM questions WHERE title = 'Canceled?'),(SELECT id FROM users WHERE fname = 'Sue'));
