-- Inserção RESIDÊNCIA
INSERT INTO residencia (aluguel, coletividade, estado, cidade, cep, endereço,
                       n_quartos, n_banheiros, area_interna, area_externa, infos_adicionais)
VALUES (
    '600', FALSE, 'SP', 'São Carlos', '13566874',
    'Rua Raimundo Coutinho, 14', 2, 1, 40, NULL,
    'Mobiliado'
);

INSERT INTO residencia (aluguel, coletividade, estado, cidade, cep, endereço,
                       n_quartos, n_banheiros, area_interna, area_externa, infos_adicionais)
VALUES (
    '650', FALSE, 'SP', 'São Carlos', '13573071',
    'Rua Lauro Alexandre da Silva, 77, 1214', 2, 1, 35, NULL,
    ''
);

INSERT INTO residencia (aluguel, coletividade, estado, cidade, cep, endereço,
                       n_quartos, n_banheiros, area_interna, area_externa, infos_adicionais)
VALUES (
    '750', FALSE, 'SP', 'São Carlos', '13566700',
    'Rua Anselmo Filgueira de Melo, 5435', 2, 2, 40, NULL,
    ''
);

INSERT INTO residencia (aluguel, coletividade, estado, cidade, cep, endereço,
                       n_quartos, n_banheiros, area_interna, area_externa, infos_adicionais)
VALUES (
    '500', FALSE, 'SP', 'São Carlos', '13575007',
    'Quadra J, 5', 1, 1, 30, NULL,
    'Contêm armarios'
);

INSERT INTO residencia (aluguel, coletividade, estado, cidade, cep, endereço,
                       n_quartos, n_banheiros, area_interna, area_externa, infos_adicionais)
VALUES (
    '1250', TRUE, 'SP', 'São Carlos', '13571370',
    'Vila Almeida II, 76, 3', 4, 4, 150, 50,
    NULL
);

INSERT INTO residencia (aluguel, coletividade, estado, cidade, cep, endereço,
                       n_quartos, n_banheiros, area_interna, area_externa, infos_adicionais)
VALUES (
    '1500', TRUE, 'SP', 'São Carlos', '13565403',
    'Rua Luíza Maria Bortolazzo Berto, 8, 2', 5, 3, 100, 25,
    NULL
);

INSERT INTO residencia (aluguel, coletividade, estado, cidade, cep, endereço,
                       n_quartos, n_banheiros, area_interna, area_externa, infos_adicionais)
VALUES (
    '700', FALSE, 'SP', 'Campinas', '13565320',
    'Avenida Piloto Pereira Tim, 74, 41', 1, 1, 70, 20,
    NULL
);

INSERT INTO residencia (aluguel, coletividade, estado, cidade, cep, endereço,
                       n_quartos, n_banheiros, area_interna, area_externa, infos_adicionais)
VALUES (
    '1050', TRUE, 'SP', 'Campinas', '13568776',
    'Praça João Beiçola da Silva, 342, 5', 4, 2, 110, 25,
    NULL
);

INSERT INTO residencia (aluguel, coletividade, estado, cidade, cep, endereço,
                       n_quartos, n_banheiros, area_interna, area_externa, infos_adicionais)
VALUES (
    '1100', TRUE, 'SP', 'São Carlos', '13574701',
    'Rua da Agulha, 234', 3, 2, 150, 40,
    NULL
);

INSERT INTO residencia (aluguel, coletividade, estado, cidade, cep, endereço,
                       n_quartos, n_banheiros, area_interna, area_externa, infos_adicionais)
VALUES (
    '650', FALSE, 'SP', 'Curitiba', '13573334',
    'Avenida Carlos Gomes, 132, 13', 3, 2, 30, NULL,
    NULL
);


-- Inserção IMÓVEL
INSERT INTO imovel (id, valor_venda, condominio, aceita_animais)
SELECT id, '110000', '500', TRUE 
FROM residencia WHERE cep = '13566874';

INSERT INTO imovel (id, valor_venda, condominio, aceita_animais)
SELECT id, '37000', '340', FALSE 
FROM residencia WHERE cep = '13573071';

INSERT INTO imovel (id, valor_venda, condominio, aceita_animais)
SELECT id, '89000', '610', TRUE 
FROM residencia WHERE cep = '13566700';

INSERT INTO imovel (id, valor_venda, condominio, aceita_animais)
SELECT id, '37500', '400', FALSE 
FROM residencia WHERE cep = '13575007';

INSERT INTO imovel (id, valor_venda, condominio, aceita_animais)
SELECT id, '50000', '750', FALSE 
FROM residencia WHERE cep = '13565320';

INSERT INTO imovel (id, valor_venda, condominio, aceita_animais)
SELECT id, '50300', '1000', TRUE 
FROM residencia WHERE cep = '13573334';


-- Inserção MORADIA
INSERT INTO moradia (id, n_moradores, n_colegas_quarto, n_animais, n_total_vagas)
SELECT id, 5, 3, 2, 9
FROM residencia WHERE cep = '13571370';

INSERT INTO moradia (id, n_moradores, n_colegas_quarto, n_animais, n_total_vagas)
SELECT id, 4, 1, 1, 6
FROM residencia WHERE cep = '13565403';

INSERT INTO moradia (id, n_moradores, n_colegas_quarto, n_animais, n_total_vagas)
SELECT id, 7, 1, 0, 10
FROM residencia WHERE cep = '13568776';

INSERT INTO moradia (id, n_moradores, n_colegas_quarto, n_animais, n_total_vagas)
SELECT id, 12, 2, 2, 13
FROM residencia WHERE cep = '13574701';