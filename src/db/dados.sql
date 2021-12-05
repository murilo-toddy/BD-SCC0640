-- Inserção PESSOA
INSERT INTO pessoa(CPF, RG, nome, nascimento)
VALUES(
    '45446434064',
    '273986132',
    'Olivia Stefany Evelyn dos Santos',
    TO_DATE('15/01/1953', 'DD/MM/YYYY')
);

INSERT INTO pessoa(CPF, RG, nome, nascimento)
VALUES(
    '89738378001',
    '410999544',
    'Marli Antônia Silveira',
    TO_DATE('23/11/1990', 'DD/MM/YYYY')
);

INSERT INTO pessoa(CPF, RG, nome, nascimento)
VALUES(
    '61520188030',
    '494137083',
    'Raimunda Alana Gabrielly Moraes',
    TO_DATE('23/11/2003', 'DD/MM/YYYY')
);

INSERT INTO pessoa(CPF, RG, nome, nascimento)
VALUES(
    '18667659061',
    '463665557',
    'Francisca Carolina Mariah Novaes',
    TO_DATE('25/06/1984', 'DD/MM/YYYY')
);

INSERT INTO pessoa(CPF, RG, nome, nascimento)
VALUES(
    '98975082016',
    '221734673',
    'Mariane Laura Maitê da Mata',
    TO_DATE('25/03/1991', 'DD/MM/YYYY')
);

INSERT INTO pessoa(CPF, RG, nome, nascimento)
VALUES(
    '93622146010',
    '184081968',
    'Flávia Heloise Porto',
    TO_DATE('24/01/1996', 'DD/MM/YYYY')
);

INSERT INTO pessoa(CPF, RG, nome, nascimento)
VALUES(
    '98826700087',
    '503535643',
    'Elisa Gabrielly Cavalcanti',
    TO_DATE('17/11/1977', 'DD/MM/YYYY')
);

INSERT INTO pessoa(CPF, RG, nome, nascimento)
VALUES(
    '23830223064',
    '290128365',
    'Geraldo Severino Ramos',
    TO_DATE('14/12/2001', 'DD/MM/YYYY')
);

INSERT INTO pessoa(CPF, RG, nome, nascimento)
VALUES(
    '88732940302',
    '299690519',
    'Caio Theo Breno Castro',
    TO_DATE('21/01/1968', 'DD/MM/YYYY')
);

INSERT INTO pessoa(CPF, RG, nome, nascimento)
VALUES(
    '74214010591',
    '459538044',
    'Aurora Brenda Cláudia Santos',
    TO_DATE('19/09/1999', 'DD/MM/YYYY')
);

INSERT INTO pessoa(CPF, RG, nome, nascimento)
VALUES(
    '83353310061',
    '444008846',
    'Helena Luana Oliveira',
    TO_DATE('18/04/1994', 'DD/MM/YYYY')
);

INSERT INTO pessoa(CPF, RG, nome, nascimento)
VALUES(
    '90283056029',
    '400602829',
    'Raul Matheus Nunes',
    TO_DATE('07/07/1972', 'DD/MM/YYYY')
);

INSERT INTO pessoa(CPF, RG, nome, nascimento)
VALUES(
    '93078701018',
    '470365377',
    'Victor Lucca Julio Fernandes',
    TO_DATE('06/03/1962', 'DD/MM/YYYY')
);

INSERT INTO pessoa(CPF, RG, nome, nascimento)
VALUES(
    '35017890092',
    '150857639',
    'Jaqueline Benedita Laís Jesus',
    TO_DATE('14/12/1963', 'DD/MM/YYYY')
);

INSERT INTO pessoa(CPF, RG, nome, nascimento)
VALUES(
    '15101159514',
    '209072003',
    'Lorena Isabelly Mirella Dias',
    TO_DATE('01/04/1968', 'DD/MM/YYYY')
);

INSERT INTO pessoa(CPF, RG, nome, nascimento)
VALUES(
    '31000160840',
    '141390347',
    'Theo Bryan Levi Costa',
    TO_DATE('18/05/1973', 'DD/MM/YYYY')
);

INSERT INTO pessoa(CPF, RG, nome, nascimento)
VALUES(
    '99812465227',
    '246209938',
    'Sandra Patrícia Jennifer Ramos',
    TO_DATE('08/06/1988', 'DD/MM/YYYY')
);

INSERT INTO pessoa(CPF, RG, nome, nascimento)
VALUES(
    '54904342607',
    '383102005',
    'Betina Olivia Caldeira',
    TO_DATE('29/05/1962', 'DD/MM/YYYY')
);

INSERT INTO pessoa(CPF, RG, nome, nascimento)
VALUES(
    '72262491119',
    '325254114',
    'Sebastião Ricardo Danilo Sales',
    TO_DATE('06/08/1977', 'DD/MM/YYYY')
);

INSERT INTO pessoa(CPF, RG, nome, nascimento)
VALUES(
    '65671541522',
    '105164495',
    'Alexandre Fábio Giovanni Carvalho',
    TO_DATE('15/10/1986', 'DD/MM/YYYY')
);

-- Inserção ATUAÇÃO
INSERT INTO atuacao(pessoa, atuacao)
VALUES('89738378001', 'aluno');

INSERT INTO atuacao(pessoa, atuacao)
VALUES('61520188030', 'professor');

INSERT INTO atuacao(pessoa, atuacao)
VALUES('98975082016', 'aluno');

INSERT INTO atuacao(pessoa, atuacao)
VALUES('98826700087', 'aluno');

INSERT INTO atuacao(pessoa, atuacao)
VALUES('23830223064', 'aluno');

INSERT INTO atuacao(pessoa, atuacao)
VALUES('74214010591', 'aluno');

INSERT INTO atuacao(pessoa, atuacao)
VALUES('74214010591', 'professor');

INSERT INTO atuacao(pessoa, atuacao)
VALUES('31000160840', 'aluno');

INSERT INTO atuacao(pessoa, atuacao)
VALUES('72262491119', 'aluno');

INSERT INTO atuacao(pessoa, atuacao)
VALUES('65671541522', 'professor');

INSERT INTO atuacao(pessoa, atuacao)
VALUES('65671541522', 'aluno');

INSERT INTO atuacao(pessoa, atuacao)
VALUES('45446434064', 'responsavel');

INSERT INTO atuacao(pessoa, atuacao)
VALUES('61520188030', 'responsavel');

INSERT INTO atuacao(pessoa, atuacao)
VALUES('74214010591', 'responsavel');

INSERT INTO atuacao(pessoa, atuacao)
VALUES('93078701018', 'responsavel');

INSERT INTO atuacao(pessoa, atuacao)
VALUES('35017890092', 'responsavel');

INSERT INTO atuacao(pessoa, atuacao)
VALUES('18667659061', 'aluno');

INSERT INTO atuacao(pessoa, atuacao)
VALUES('93622146010', 'aluno');

INSERT INTO atuacao(pessoa, atuacao)
VALUES('88732940302', 'aluno');

INSERT INTO atuacao(pessoa, atuacao)
VALUES('83353310061', 'aluno');

INSERT INTO atuacao(pessoa, atuacao)
VALUES('90283056029', 'professor');

INSERT INTO atuacao(pessoa, atuacao)
VALUES('15101159514', 'professor');

INSERT INTO atuacao(pessoa, atuacao)
VALUES('99812465227', 'professor');

INSERT INTO atuacao(pessoa, atuacao)
VALUES('54904342607', 'professor');


-- Inserção ALUNO
INSERT INTO aluno(CPF, n_indicacoes, procurando_moradia, procurando_imovel)
VALUES('89738378001', 2, FALSE, TRUE);

INSERT INTO aluno(CPF, n_indicacoes, procurando_moradia, procurando_imovel)
VALUES('98975082016', 5, FALSE, TRUE);

INSERT INTO aluno(CPF, n_indicacoes, procurando_moradia, procurando_imovel)
VALUES('98826700087', 3, FALSE, FALSE);

INSERT INTO aluno(CPF, n_indicacoes, procurando_moradia, procurando_imovel)
VALUES('23830223064', 0, TRUE,  FALSE);

INSERT INTO aluno(CPF, n_indicacoes, procurando_moradia, procurando_imovel)
VALUES('74214010591', 1, FALSE, FALSE);

INSERT INTO aluno(CPF, n_indicacoes, procurando_moradia, procurando_imovel)
VALUES('31000160840', 0, TRUE, FALSE);

INSERT INTO aluno(CPF, n_indicacoes, procurando_moradia, procurando_imovel)
VALUES('72262491119', 8, TRUE, FALSE);

INSERT INTO aluno(CPF, n_indicacoes, procurando_moradia, procurando_imovel)
VALUES('65671541522', 4, TRUE, TRUE);

INSERT INTO aluno(CPF, n_indicacoes, procurando_moradia, procurando_imovel)
VALUES('18667659061', 5, TRUE, FALSE);

INSERT INTO aluno(CPF, n_indicacoes, procurando_moradia, procurando_imovel)
VALUES('93622146010', 7, TRUE, TRUE);

INSERT INTO aluno(CPF, n_indicacoes, procurando_moradia, procurando_imovel)
VALUES('88732940302', 1, FALSE, FALSE);

INSERT INTO aluno(CPF, n_indicacoes, procurando_moradia, procurando_imovel)
VALUES('83353310061', 10, TRUE, TRUE);


-- Inserção PROFESSOR
INSERT INTO professor(CPF, area_atuacao)
VALUES('61520188030', 'Exatas');

INSERT INTO professor(CPF, area_atuacao)
VALUES('74214010591', 'Exatas');

INSERT INTO professor(CPF, area_atuacao)
VALUES('65671541522', 'Humanas');

INSERT INTO professor(CPF, area_atuacao)
VALUES('15101159514', 'Biológicas');

INSERT INTO professor(CPF, area_atuacao)
VALUES('99812465227', 'Humanas');

INSERT INTO professor(CPF, area_atuacao)
VALUES('54904342607', 'Exatas');

INSERT INTO professor(CPF, area_atuacao)
VALUES('90283056029', 'Exatas');


-- Inserção RESPONSÁVEL
INSERT INTO responsavel(CPF)
VALUES('45446434064');

INSERT INTO responsavel(CPF)
VALUES('61520188030');

INSERT INTO responsavel(CPF)
VALUES('74214010591');

INSERT INTO responsavel(CPF)
VALUES('93078701018');

INSERT INTO responsavel(CPF)
VALUES('35017890092');


-- Inserção CAMPUS
INSERT INTO campus (CNPJ_universidade, nome_campus, cidade, nome_universidade,
                   categoria_universidade, estado, endereço, cep)
VALUES (
    '18080557000145',
    'CAASO',
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
    'São Paulo',
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
FROM campus WHERE nome_universidade = 'USP' AND nome_campus = 'CAASO';

INSERT INTO oferecimento_curso (campus, nome, area_conhecimento)
SELECT id, 'Engenharia Mecatrônica', 'exatas'
FROM campus WHERE nome_universidade = 'USP' AND nome_campus = 'CAASO';

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
FROM campus WHERE nome_universidade = 'USP' AND nome_campus = 'CAASO';

INSERT INTO trabalho (professor, campus, curso)
SELECT '74214010591', id, 'Engenharia Mecatrônica'
FROM campus WHERE nome_universidade = 'USP' AND nome_campus = 'CAASO';

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
FROM campus WHERE nome_universidade = 'USP' AND nome_campus = 'CAASO';

INSERT INTO cursando (aluno, campus, curso, ano_ingresso)
SELECT '98975082016', id, 'Ciência de Computação', TO_DATE('2018', 'YYYY')
FROM campus WHERE nome_universidade = 'USP' AND nome_campus = 'CAASO';

INSERT INTO cursando (aluno, campus, curso, ano_ingresso)
SELECT '98826700087', id, 'Ciência de Computação', TO_DATE('2018', 'YYYY')
FROM campus WHERE nome_universidade = 'USP' AND nome_campus = 'CAASO';

INSERT INTO cursando (aluno, campus, curso, ano_ingresso)
SELECT '23830223064', id, 'Engenharia Mecatrônica', TO_DATE('2020', 'YYYY')
FROM campus WHERE nome_universidade = 'USP' AND nome_campus = 'CAASO';

INSERT INTO cursando (aluno, campus, curso, ano_ingresso)
SELECT '74214010591', id, 'Ciência de Computação', TO_DATE('2021', 'YYYY')
FROM campus WHERE nome_universidade = 'USP' AND nome_campus = 'CAASO';

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
FROM campus WHERE nome_universidade = 'USP' AND nome_campus = 'CAASO';

INSERT INTO cursando (aluno, campus, curso, ano_ingresso)
SELECT '93622146010', id, 'Engenharia Mecatrônica', TO_DATE('2018', 'YYYY')
FROM campus WHERE nome_universidade = 'USP' AND nome_campus = 'CAASO';

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

INSERT INTO orienta (aluno, professor)
VALUES ('98975082016', '74214010591');


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



-- Inserção FESTA
INSERT INTO festa (data_horario, nome, moradia, preço, n_ingressos_total, open_bar)
VALUES (TO_TIMESTAMP('30/04/2019 20:00', 'DD/MM/YYYY HH24:MI'), 'Indy Festa',
       5, 50, 40, 'Vodka, Skol Beats');

INSERT INTO festa (data_horario, nome, moradia, preço, n_ingressos_total, open_bar)
VALUES (TO_TIMESTAMP('04/09/2020 17:00', 'DD/MM/YYYY HH24:MI'), 'Wired',
       6, 30, 25, 'Corote');

INSERT INTO festa (data_horario, nome, moradia, preço, n_ingressos_total, open_bar)
VALUES (TO_TIMESTAMP('17/06/2021 18:00', 'DD/MM/YYYY HH24:MI'), 'Festa Sync',
       6, 25, 35, NULL);

INSERT INTO festa (data_horario, nome, moradia, preço, n_ingressos_total, open_bar)
VALUES (TO_TIMESTAMP('27/09/2021 18:00', 'DD/MM/YYYY HH24:MI'), 'Westside',
       9, 30, 10, NULL);

-- Inserção INGRESSO
INSERT INTO ingresso (festa, comprador)
VALUES (1, '45446434064');

INSERT INTO ingresso (festa, comprador)
VALUES (2, '61520188030');

INSERT INTO ingresso (festa, comprador)
VALUES (2, '18667659061');

INSERT INTO ingresso (festa, comprador)
VALUES (2, '98826700087');

INSERT INTO ingresso (festa, comprador)
VALUES (3, '98826700087');

INSERT INTO ingresso (festa, comprador)
VALUES (4, '98826700087');

INSERT INTO ingresso (festa, comprador)
VALUES (4, '90283056029');

INSERT INTO ingresso (festa, comprador)
VALUES (4, '99812465227');

INSERT INTO ingresso (festa, comprador)
VALUES (4, '23830223064');

INSERT INTO ingresso (festa, comprador)
VALUES (4, '61520188030');

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
