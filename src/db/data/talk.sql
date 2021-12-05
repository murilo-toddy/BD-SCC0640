-- Inserção PALESTRA
INSERT INTO palestra (ministrante, nome, campus, data_horario, tema)
SELECT '61520188030', 'Inteligência Financeira', id,
       TO_TIMESTAMP('30/08/2020 18:00', 'DD/MM/YYYY HH24:MI'),
       'Educação financeira'
FROM campus WHERE nome_universidade = 'USP' AND nome_campus = 'CAASO';

INSERT INTO palestra (ministrante, nome, campus, data_horario, tema)
SELECT '74214010591', 'Saúde e Vida', id,
       TO_TIMESTAMP('04/09/2020 19:00', 'DD/MM/YYYY HH24:MI'),
       'Hábitos positivos de saúde'
FROM campus WHERE nome_universidade = 'USP' AND nome_campus = 'Politécnica';

INSERT INTO palestra (ministrante, nome, campus, data_horario, tema)
SELECT '74214010591', 'Depressão não é frescura', id,
       TO_TIMESTAMP('19/02/2021 20:00', 'DD/MM/YYYY HH24:MI'),
       'Depressão e saúde mental'
FROM campus WHERE nome_universidade = 'UNICAMP' AND nome_campus = 'Campinas';

INSERT INTO palestra (ministrante, nome, campus, data_horario, tema)
SELECT '74214010591', 'Ferramentas de Gestão Emocional', id,
       TO_TIMESTAMP('19/06/2021 14:00', 'DD/MM/YYYY HH24:MI'),
       'Gestão emocional'
FROM campus WHERE nome_universidade = 'UFPR' AND nome_campus = 'Curitiba';


-- Inserção PRESENÇAS MARCADAS
INSERT INTO presenca_marcada (aluno, palestra)
VALUES ('98975082016', 1);

INSERT INTO presenca_marcada (aluno, palestra)
VALUES ('98826700087', 1);

INSERT INTO presenca_marcada (aluno, palestra)
VALUES ('74214010591', 2);

INSERT INTO presenca_marcada (aluno, palestra)
VALUES ('72262491119', 2);

INSERT INTO presenca_marcada (aluno, palestra)
VALUES ('74214010591', 3);

INSERT INTO presenca_marcada (aluno, palestra)
VALUES ('98975082016', 4);

INSERT INTO presenca_marcada (aluno, palestra)
VALUES ('98826700087', 4);

INSERT INTO presenca_marcada (aluno, palestra)
VALUES ('31000160840', 4);

INSERT INTO presenca_marcada (aluno, palestra)
VALUES ('65671541522', 4);

INSERT INTO presenca_marcada (aluno, palestra)
VALUES ('98975082016', 2);

INSERT INTO presenca_marcada (aluno, palestra)
VALUES ('65671541522', 3);

INSERT INTO presenca_marcada (aluno, palestra)
VALUES ('89738378001', 2);

INSERT INTO presenca_marcada (aluno, palestra)
VALUES ('89738378001', 3);

INSERT INTO presenca_marcada (aluno, palestra)
VALUES ('89738378001', 4);
