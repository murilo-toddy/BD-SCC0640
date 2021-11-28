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
FROM campus WHERE nome_campus = 'EESC';

INSERT INTO oferecimento_curso (campus, nome, area_conhecimento)
SELECT id, 'Engenharia Mecatrônica', 'exatas'
FROM campus WHERE nome_campus = 'EESC';

INSERT INTO oferecimento_curso (campus, nome, area_conhecimento)
SELECT id, 'Relações Internacionais', 'humanas'
FROM campus WHERE nome_campus = 'Franca';

INSERT INTO oferecimento_curso (campus, nome, area_conhecimento)
SELECT id, 'Biomedicina', 'biológicas'
FROM campus WHERE nome_campus = 'Catuai';


-- Inserção TRABALHO
INSERT INTO trabalho (professor, campus, curso)
SELECT '61520188030', id, 'Ciência de Computação'
FROM campus WHERE nome_campus = 'EESC';

INSERT INTO trabalho (professor, campus, curso)
SELECT '74214010591', id, 'Engenharia Mecatrônica'
FROM campus WHERE nome_campus = 'EESC';

INSERT INTO trabalho (professor, campus, curso)
SELECT '65671541522', id, 'Relações Internacionais'
FROM campus WHERE nome_campus = 'Franca';


-- Inserção CURSANDO



-- Inserção ORIENTA
INSERT INTO orienta (aluno, professor)
VALUES ('98826700087', '61520188030');

INSERT INTO orienta (aluno, professor)
VALUES ('23830223064', '61520188030');

INSERT INTO orienta (aluno, professor)
VALUES ('31000160840', '65671541522');

