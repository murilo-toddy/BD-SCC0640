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



