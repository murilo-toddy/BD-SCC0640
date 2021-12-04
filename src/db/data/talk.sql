-- Inserção PALESTRA
INSERT INTO palestra (ministrante, nome, campus, data_horario, tema)
SELECT '61520188030', 'Inteligência Financeira', id,
       TO_TIMESTAMP('30/08/2020 18:00', 'DD/MM/YYYY HH24:MI'),
       'Educação financeira'
FROM campus WHERE nome_universidade = 'USP' AND nome_campus = 'EESC';

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
SELECT '89738378001', id
FROM palestra WHERE nome = 'Inteligência Financeira';

INSERT INTO presenca_marcada (aluno, palestra)
SELECT '98975082016', id
FROM palestra WHERE nome = 'Inteligência Financeira';

INSERT INTO presenca_marcada (aluno, palestra)
SELECT '98826700087', id
FROM palestra WHERE nome = 'Inteligência Financeira';

INSERT INTO presenca_marcada (aluno, palestra)
SELECT '89738378001', id
FROM palestra WHERE nome = 'Saúde e Vida';

INSERT INTO presenca_marcada (aluno, palestra)
SELECT '72262491119', id
FROM palestra WHERE nome = 'Saúde e Vida';

INSERT INTO presenca_marcada (aluno, palestra)
SELECT '89738378001', id
FROM palestra WHERE nome = 'Depressão não é frescura';

INSERT INTO presenca_marcada (aluno, palestra)
SELECT '98826700087', id
FROM palestra WHERE nome = 'Ferramentas de Gestão Emocional';

INSERT INTO presenca_marcada (aluno, palestra)
SELECT '31000160840', id
FROM palestra WHERE nome = 'Ferramentas de Gestão Emocional';

INSERT INTO presenca_marcada (aluno, palestra)
SELECT '65671541522', id
FROM palestra WHERE nome = 'Ferramentas de Gestão Emocional';

INSERT INTO presenca_marcada (aluno, palestra)
SELECT '23830223064', id
FROM palestra WHERE nome = 'Saúde e Vida';

INSERT INTO presenca_marcada (aluno, palestra)
SELECT '23830223064', id
FROM palestra WHERE nome = 'Depressão não é frescura';

INSERT INTO presenca_marcada (aluno, palestra)
SELECT '23830223064', id
FROM palestra WHERE nome = 'Ferramentas de Gestão Emocional';

INSERT INTO presenca_marcada (aluno, palestra)
SELECT '98975082016', id
FROM palestra WHERE nome = 'Saúde e Vida';

INSERT INTO presenca_marcada (aluno, palestra)
SELECT '98975082016', id
FROM palestra WHERE nome = 'Depressão não é frescura';

INSERT INTO presenca_marcada (aluno, palestra)
SELECT '98975082016', id
FROM palestra WHERE nome = 'Ferramentas de Gestão Emocional';
