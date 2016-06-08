CREATE TABLE challenge (id_challenge  SERIAL NOT NULL, player_one VARCHAR(255), player_two VARCHAR(255), score_player_one INTEGER, score_player_two INTEGER, PRIMARY KEY (id_challenge))
CREATE TABLE issue (id_issue  SERIAL NOT NULL, answer VARCHAR(1) NOT NULL, area VARCHAR(3) NOT NULL, asking VARCHAR(10000) NOT NULL, PRIMARY KEY (id_issue))
CREATE TABLE option (id_option  SERIAL NOT NULL, description VARCHAR(255), image VARCHAR(255), issue INTEGER, PRIMARY KEY (id_option))
CREATE TABLE player (email VARCHAR(255) NOT NULL, namePlayer VARCHAR(255), password VARCHAR(255), STATISTICSMULTIPLAYERLIST BYTEA, STATISTICSONEPLAYERLIST BYTEA, PRIMARY KEY (email))
CREATE TABLE statistics_one_player (id_oneplayer  SERIAL NOT NULL, correct BOOLEAN, id_issue INTEGER, id_player VARCHAR(255), PRIMARY KEY (id_oneplayer))
CREATE TABLE statistics_multiplayer (id_multiplayer  SERIAL NOT NULL, victory BOOLEAN, id_challenge INTEGER, id_player VARCHAR(255), PRIMARY KEY (id_multiplayer))
ALTER TABLE option ADD CONSTRAINT FK_option_issue FOREIGN KEY (issue) REFERENCES issue (id_issue)
ALTER TABLE statistics_one_player ADD CONSTRAINT FK_statistics_one_player_id_issue FOREIGN KEY (id_issue) REFERENCES issue (id_issue)
ALTER TABLE statistics_one_player ADD CONSTRAINT FK_statistics_one_player_id_player FOREIGN KEY (id_player) REFERENCES player (email)
ALTER TABLE statistics_multiplayer ADD CONSTRAINT FK_statistics_multiplayer_id_player FOREIGN KEY (id_player) REFERENCES player (email)
ALTER TABLE statistics_multiplayer ADD CONSTRAINT FK_statistics_multiplayer_id_challenge FOREIGN KEY (id_challenge) REFERENCES challenge (id_challenge)