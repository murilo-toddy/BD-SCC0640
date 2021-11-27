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
    '8873294030',
    '299690519',
    'Caio Theo Breno Castro',
    TO_DATE('21/01/1968', 'DD/MM/YYYY')
);

INSERT INTO pessoa(CPF, RG, nome, nascimento)
VALUES(
    '7421401059',
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
INSERT INTO atuacao(CPF, atuacao)
VALUES('89738378001', 'Aluno');

INSERT INTO atuacao(CPF, atuacao)
VALUES('61520188030', 'Professor');

INSERT INTO atuacao(CPF, atuacao)
VALUES('98975082016', 'Aluno');

INSERT INTO atuacao(CPF, atuacao)
VALUES('98826700087', 'Aluno');

INSERT INTO atuacao(CPF, atuacao)
VALUES('23830223064', 'Aluno');

INSERT INTO atuacao(CPF, atuacao)
VALUES('7421401059', 'Aluno');

INSERT INTO atuacao(CPF, atuacao)
VALUES('7421401059', 'Professor');

INSERT INTO atuacao(CPF, atuacao)
VALUES('31000160840', 'Aluno');

INSERT INTO atuacao(CPF, atuacao)
VALUES('72262491119', 'Aluno');

INSERT INTO atuacao(CPF, atuacao)
VALUES('65671541522', 'Professor');

INSERT INTO atuacao(CPF, atuacao)
VALUES('65671541522', 'Aluno');

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
VALUES('7421401059', 1, FALSE, FALSE);

INSERT INTO aluno(CPF, n_indicacoes, procurando_moradia, procurando_imovel)
VALUES('31000160840', 0, TRUE, FALSE);

INSERT INTO aluno(CPF, n_indicacoes, procurando_moradia, procurando_imovel)
VALUES('72262491119', 8, TRUE, FALSE);

INSERT INTO aluno(CPF, n_indicacoes, procurando_moradia, procurando_imovel)
VALUES('65671541522', 4, TRUE, TRUE);

-- Inserção PROFESSOR
INSERT INTO professor(CPF, area_atuacao)
VALUES('61520188030', 'Exatas');

INSERT INTO professor(CPF, area_atuacao)
VALUES('7421401059', 'Exatas');

INSERT INTO professor(CPF, area_atuacao)
VALUES('65671541522', 'Humanas');