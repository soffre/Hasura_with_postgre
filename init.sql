CREATE TABLE IF NOT EXISTS players(
    id      SERIAL,
    name    text,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS levels(
    id      SERIAL,
    name    text,
    level   JSON,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS scores(
    id          SERIAL,
    score       int,
    player_id   int,
    level_id    int,
    PRIMARY KEY (id),
    CONSTRAINT player_id
        FOREIGN KEY (player_id)
            REFERENCES players (id)
                ON DELETE CASCADE,
    CONSTRAINT level_id
        FOREIGN KEY (level_id)
            REFERENCES levels (id)
                ON DELETE CASCADE          
);
INSERT INTO players (name) VALUES
    ('aman'),
    ('yor'),
    ('hab');
INSERT INTO levels (name , level) VALUES
    ('man 1', '[[1,2,3],[4,5,6],[7,8,9]]');

INSERT INTO scores (score, player_id, level_id) VALUES
    (450, (SELECT id FROM players WHERE name = 'aman'), (SELECT id FROM levels WHERE name = 'man 1'));    