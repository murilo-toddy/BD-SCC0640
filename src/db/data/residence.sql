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
VALUES (1, '110000', '500', TRUE);

INSERT INTO imovel (id, valor_venda, condominio, aceita_animais)
VALUES (2, '37000', '340', FALSE);

INSERT INTO imovel (id, valor_venda, condominio, aceita_animais)
VALUES (3, '89000', '610', TRUE);

INSERT INTO imovel (id, valor_venda, condominio, aceita_animais)
VALUES (4, '37500', '400', FALSE);

INSERT INTO imovel (id, valor_venda, condominio, aceita_animais)
VALUES (7, '50000', '750', FALSE);

INSERT INTO imovel (id, valor_venda, condominio, aceita_animais)
VALUES (10, '50300', '1000', TRUE);


-- Inserção MORADIA
INSERT INTO moradia (id, n_moradores, n_colegas_quarto, n_animais, n_total_vagas)
VALUES (5, 5, 3, 2, 9);

INSERT INTO moradia (id, n_moradores, n_colegas_quarto, n_animais, n_total_vagas)
VALUES (6, 4, 1, 1, 6);

INSERT INTO moradia (id, n_moradores, n_colegas_quarto, n_animais, n_total_vagas)
VALUES (8, 7, 1, 0, 10);

INSERT INTO moradia (id, n_moradores, n_colegas_quarto, n_animais, n_total_vagas)
VALUES (9, 12, 2, 2, 13);


-- Inserção RESPONSABILIDADE
INSERT INTO responsabilidade (residencia, responsavel, permissao_venda)
VALUES ('2', '45446434064', TRUE);

INSERT INTO responsabilidade (residencia, responsavel, permissao_venda)
VALUES ('1', '74214010591', FALSE);

INSERT INTO responsabilidade (residencia, responsavel, permissao_venda)
VALUES ('5', '61520188030', FALSE);

INSERT INTO responsabilidade (residencia, responsavel, permissao_venda)
VALUES ('6', '61520188030', TRUE);

INSERT INTO responsabilidade (residencia, responsavel, permissao_venda)
VALUES ('7', '93078701018', TRUE);

INSERT INTO responsabilidade (residencia, responsavel, permissao_venda)
VALUES ('10', '35017890092', FALSE);

INSERT INTO responsabilidade (residencia, responsavel, permissao_venda)
VALUES ('8', '35017890092', FALSE);


-- Inserção CONTRATO_ALUGUEL
INSERT INTO contrato_aluguel (inicio, residencia, responsavel, locatario, fim, aluguel, multa, desconto)
VALUES (TO_DATE('12/03/2019', 'dd/mm/yyyy'), 6, '61520188030', '89738378001', TO_DATE('12/03/2020', 'dd/mm/yyyy'),
        '370', '0', '10');

INSERT INTO contrato_aluguel (inicio, residencia, responsavel, locatario, fim, aluguel, multa, desconto)
VALUES (TO_DATE('01/05/2020', 'dd/mm/yyyy'), 7, '93078701018', '61520188030', TO_DATE('01/11/2020', 'dd/mm/yyyy'),
        '500', '0', '0');

INSERT INTO contrato_aluguel (inicio, residencia, responsavel, locatario, fim, aluguel, multa, desconto)
VALUES (TO_DATE('05/04/2018', 'dd/mm/yyyy'), 5, '61520188030', '65671541522', TO_DATE('05/04/2020', 'dd/mm/yyyy'),
        '440', '40', '0');

INSERT INTO contrato_aluguel (inicio, residencia, responsavel, locatario, fim, aluguel, multa, desconto)
VALUES (TO_DATE('05/12/2020', 'dd/mm/yyyy'), 8, '35017890092', '98826700087', TO_DATE('05/12/2021', 'dd/mm/yyyy'),
        '1050', '0', '0');

INSERT INTO contrato_aluguel (inicio, residencia, responsavel, locatario, fim, aluguel, multa, desconto)
VALUES (TO_DATE('25/12/2012', 'dd/mm/yyyy'), 8, '35017890092', '83353310061', TO_DATE('25/12/2015', 'dd/mm/yyyy'),
        '1050', '0', '0');


-- Inserção VENDAS
INSERT INTO venda (residencia, responsavel, comprador, data, valor, desconto)
VALUES (2, '45446434064', '83353310061', TO_DATE('05/07/2021', 'dd/mm/yyyy'), '36850', '150');

INSERT INTO venda (residencia, responsavel, comprador, data, valor, desconto)
VALUES (7, '93078701018', '61520188030', TO_DATE('23/11/2021', 'dd/mm/yyyy'), '50000', '0');