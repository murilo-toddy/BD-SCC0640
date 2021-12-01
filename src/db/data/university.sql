-- Inserção CAMPUS
INSERT INTO campus (CNPJ_universidade, nome_campus, cidade, nome_universidade,
                   categoria_universidade, estado, endereço, cep)
VALUES (
    '18080557000145',
    'EESC',
    'São Carlos',
    'USP', 
    'pública',
    'SP',
    'Rua Augusto Spaziani, 254',
    '13573280'
);

INSERT INTO campus (CNPJ_universidade, nome_campus, cidade, nome_universidade,
                   categoria_universidade, estado, endereço, cep)
VALUES (
    '64561482000131',
    'Politécnica',
    'São Carlos',
    'USP',
    'pública',
    'SP',
    'Avenida Onze de Junho, 53',
    '40410011'
);

INSERT INTO campus (CNPJ_universidade, nome_campus, cidade, nome_universidade,
                   categoria_universidade, estado, endereço, cep)
VALUES (
    '17673994000100',
    'Campinas',
    'Campinas',
    'UNICAMP',
    'pública',
    'SP',
    'Praça Ângelo Signori, 10',
    '13084475'
);

INSERT INTO campus (CNPJ_universidade, nome_campus, cidade, nome_universidade,
                   categoria_universidade, estado, endereço, cep)
VALUES (
    '16094830001991',
    'Franca',
    'Franca',
    'UNESP',
    'pública',
    'SP',
    'Rua Hedd Lamar Ribeiro, 1423',
    '14403195'
);

INSERT INTO campus (CNPJ_universidade, nome_campus, cidade, nome_universidade,
                   categoria_universidade, estado, endereço, cep)
VALUES (
    '36101041000111',
    'Curitiba',
    'Curitiba',
    'UFPR',
    'pública',
    'PR',
    'Rua Lange de Morretes, 3',
    '82520530'
);

INSERT INTO campus (CNPJ_universidade, nome_campus, cidade, nome_universidade,
                   categoria_universidade, estado, endereço, cep)
VALUES (
    '95576980000181',
    'Catuai',
    'Londrina',
    'Pitágoras',
    'privada',
    'PR',
    'Edwy Taques Araújo, 1100',
    '86047790'
);


-- Inserção OFERECIMENTO DE CURSO
INSERT INTO oferecimento_curso (campus, nome, area_conhecimento)
SELECT id, 'Ciência de Computação', 'exatas'
FROM campus WHERE nome_universidade = 'USP' AND nome_campus = 'EESC';

INSERT INTO oferecimento_curso (campus, nome, area_conhecimento)
SELECT id, 'Engenharia Mecatrônica', 'exatas'
FROM campus WHERE nome_universidade = 'USP' AND nome_campus = 'EESC';

INSERT INTO oferecimento_curso (campus, nome, area_conhecimento)
SELECT id, 'Relações Internacionais', 'humanas'
FROM campus WHERE nome_universidade = 'UNESP' AND nome_campus = 'Franca';

INSERT INTO oferecimento_curso (campus, nome, area_conhecimento)
SELECT id, 'Biomedicina', 'biológicas'
FROM campus WHERE nome_universidade = 'Pitágoras' AND nome_campus = 'Catuai';

INSERT INTO oferecimento_curso (campus, nome, area_conhecimento)
SELECT id, 'Matemática', 'exatas'
FROM campus WHERE nome_universidade = 'USP' AND nome_campus = 'Politécnica';

INSERT INTO oferecimento_curso (campus, nome, area_conhecimento)
SELECT id, 'Direito', 'humanas'
FROM campus WHERE nome_universidade = 'UFPR' AND nome_campus = 'Curitiba';

INSERT INTO oferecimento_curso (campus, nome, area_conhecimento)
SELECT id, 'Engenharia Elétrica', 'exatas'
FROM campus WHERE nome_universidade = 'UNICAMP' AND nome_campus = 'Campinas';


-- Inserção TRABALHO
INSERT INTO trabalho (professor, campus, curso)
SELECT '61520188030', id, 'Ciência de Computação'
FROM campus WHERE nome_universidade = 'USP' AND nome_campus = 'EESC';

INSERT INTO trabalho (professor, campus, curso)
SELECT '74214010591', id, 'Engenharia Mecatrônica'
FROM campus WHERE nome_universidade = 'USP' AND nome_campus = 'EESC';

INSERT INTO trabalho (professor, campus, curso)
SELECT '65671541522', id, 'Relações Internacionais'
FROM campus WHERE nome_universidade = 'UNESP' AND nome_campus = 'Franca';

INSERT INTO trabalho (professor, campus, curso)
SELECT '65671541522', id, 'Biomedicina'
FROM campus WHERE nome_universidade = 'Pitágoras' AND nome_campus = 'Catuai';

INSERT INTO trabalho (professor, campus, curso)
SELECT '65671541522', id, 'Direito'
FROM campus WHERE nome_universidade = 'UFPR' AND nome_campus = 'Curitiba';

INSERT INTO trabalho (professor, campus, curso)
SELECT '65671541522', id, 'Matemática'
FROM campus WHERE nome_universidade = 'USP' AND nome_campus = 'Politécnica';

INSERT INTO trabalho (professor, campus, curso)
SELECT '65671541522', id, 'Engenharia Elétrica'
FROM campus WHERE nome_universidade = 'UNICAMP' AND nome_campus = 'Campinas';


-- Inserção CURSANDO
INSERT INTO cursando (aluno, campus, curso, ano_ingresso)
SELECT '89738378001', id, 'Ciência de Computação', TO_DATE('2019', 'YYYY')
FROM campus WHERE nome_universidade = 'USP' AND nome_campus = 'EESC';

INSERT INTO cursando (aluno, campus, curso, ano_ingresso)
SELECT '98975082016', id, 'Ciência de Computação', TO_DATE('2018', 'YYYY')
FROM campus WHERE nome_universidade = 'USP' AND nome_campus = 'EESC';

INSERT INTO cursando (aluno, campus, curso, ano_ingresso)
SELECT '98826700087', id, 'Ciência de Computação', TO_DATE('2018', 'YYYY')
FROM campus WHERE nome_universidade = 'USP' AND nome_campus = 'EESC';

INSERT INTO cursando (aluno, campus, curso, ano_ingresso)
SELECT '23830223064', id, 'Engenharia Mecatrônica', TO_DATE('2020', 'YYYY')
FROM campus WHERE nome_universidade = 'USP' AND nome_campus = 'EESC';

INSERT INTO cursando (aluno, campus, curso, ano_ingresso)
SELECT '74214010591', id, 'Engenharia Mecatrônica', TO_DATE('2021', 'YYYY')
FROM campus WHERE nome_universidade = 'USP' AND nome_campus = 'EESC';

INSERT INTO cursando (aluno, campus, curso, ano_ingresso)
SELECT '31000160840', id, 'Relações Internacionais', TO_DATE('2019', 'YYYY')
FROM campus WHERE nome_universidade = 'UNESP' AND nome_campus = 'Franca';

INSERT INTO cursando (aluno, campus, curso, ano_ingresso)
SELECT '72262491119', id, 'Biomedicina', TO_DATE('2020', 'YYYY')
FROM campus WHERE nome_universidade = 'Pitágoras' AND nome_campus = 'Catuai';

INSERT INTO cursando (aluno, campus, curso, ano_ingresso)
SELECT '65671541522', id, 'Biomedicina', TO_DATE('2018', 'YYYY')
FROM campus WHERE nome_universidade = 'Pitágoras' AND nome_campus = 'Catuai';

INSERT INTO cursando (aluno, campus, curso, ano_ingresso)
SELECT '18667659061', id, 'Engenharia Mecatrônica', TO_DATE('2018', 'YYYY')
FROM campus WHERE nome_universidade = 'USP' AND nome_campus = 'EESC';

INSERT INTO cursando (aluno, campus, curso, ano_ingresso)
SELECT '93622146010', id, 'Engenharia Mecatrônica', TO_DATE('2018', 'YYYY')
FROM campus WHERE nome_universidade = 'USP' AND nome_campus = 'EESC';

INSERT INTO cursando (aluno, campus, curso, ano_ingresso)
SELECT '88732940302', id, 'Relações Internacionais', TO_DATE('2018', 'YYYY')
FROM campus WHERE nome_universidade = 'UNESP' AND nome_campus = 'Franca';

INSERT INTO cursando (aluno, campus, curso, ano_ingresso)
SELECT '83353310061', id, 'Matemática', TO_DATE('2018', 'YYYY')
FROM campus WHERE nome_universidade = 'USP' AND nome_campus = 'Politécnica';


-- Inserção ORIENTA
INSERT INTO orienta (aluno, professor)
VALUES ('98826700087', '61520188030');

INSERT INTO orienta (aluno, professor)
VALUES ('23830223064', '61520188030');

INSERT INTO orienta (aluno, professor)
VALUES ('31000160840', '65671541522');

