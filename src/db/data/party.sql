-- Inserção FESTA
-- TODO Verificar se n_disponivel vai continuar no banco, talvez de pra remover!!
INSERT INTO festa (data_horario, nome, moradia, preço, n_ingressos_total, open_bar)
SELECT TO_TIMESTAMP('30/04/2020 20:00', 'DD/MM/YYYY HH24:MI'), 'Indy Festa',
       id, 50, 40, 'Vodka, Skol Beats'
FROM residencia WHERE cep = '13571370';

INSERT INTO festa (data_horario, nome, moradia, preço, n_ingressos_total, open_bar)
SELECT TO_TIMESTAMP('04/09/2020 17:00', 'DD/MM/YYYY HH24:MI'), 'Wired',
       id, 30, 25, 'Corote'
FROM residencia WHERE cep = '13565403';

INSERT INTO festa (data_horario, nome, moradia, preço, n_ingressos_total, open_bar)
SELECT TO_TIMESTAMP('17/06/2021 18:00', 'DD/MM/YYYY HH24:MI'), 'Festa Sync',
       id, 25, 35, NULL
FROM residencia WHERE cep = '13565403';

INSERT INTO festa (data_horario, nome, moradia, preço, n_ingressos_total, open_bar)
SELECT TO_TIMESTAMP('27/09/2021 18:00', 'DD/MM/YYYY HH24:MI'), 'Westside',
       id, 30, 10, NULL
FROM residencia WHERE cep = '13574701';

-- Inserção INGRESSO
INSERT INTO ingresso (festa, comprador)
SELECT id, '45446434064'
FROM festa WHERE nome = 'Indy Festa';

INSERT INTO ingresso (festa, comprador)
SELECT id, '61520188030'
FROM festa WHERE nome = 'Wired';

INSERT INTO ingresso (festa, comprador)
SELECT id, '18667659061'
FROM festa WHERE nome = 'Wired';

INSERT INTO ingresso (festa, comprador)
SELECT id, '98826700087'
FROM festa WHERE nome = 'Wired';

INSERT INTO ingresso (festa, comprador)
SELECT id, '98826700087'
FROM festa WHERE nome = 'Festa Sync';

INSERT INTO ingresso (festa, comprador)
SELECT id, '98826700087'
FROM festa WHERE nome = 'Westside';

INSERT INTO ingresso (festa, comprador)
SELECT id, '90283056029'
FROM festa WHERE nome = 'Westside';

INSERT INTO ingresso (festa, comprador)
SELECT id, '99812465227'
FROM festa WHERE nome = 'Westside';

INSERT INTO ingresso (festa, comprador)
SELECT id, '23830223064'
FROM festa WHERE nome = 'Westside';

INSERT INTO ingresso (festa, comprador)
SELECT id, '61520188030'
FROM festa WHERE nome = 'Westside';


