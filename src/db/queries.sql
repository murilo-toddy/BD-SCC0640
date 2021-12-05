-- QUERY 1
-- Obter quais são as pessoas de cada curso que vão mais em festas.

-- Obter qual curso cada pessoa está cursando.
SELECT c.curso, c.aluno FROM cursando c;

--Obter o número de festas que cada aluno foi.
SELECT p.cpf, COUNT(p.cpf)
FROM pessoa p JOIN ingresso i
ON p.cpf = i.comprador
GROUP BY p.cpf;

--Obter as festas que ocorreram nos últimos seis meses.
SELECT f.id, f.nome
FROM festa f
WHERE DATE_PART('day', NOW() - f.data_horario) <= 180

--Obter o número de festas que cada aluno foi nos últimos seis meses.
SELECT p.cpf, COUNT(p.cpf)
FROM pessoa p JOIN ingresso i
ON p.cpf = i.comprador
WHERE i.festa IN (SELECT f.id
                  FROM festa f
                  WHERE DATE_PART('day', NOW() - f.data_horario) <= 180)
GROUP BY p.cpf;


-- QUERY 2
-- Obter todos os alunos e, caso eles sejam orientados por algum professor, também mostrar os dados do professor.
SELECT a.cpf, a.procurando_moradia, o.professor
FROM aluno a LEFT JOIN orienta o
ON a.cpf = o.aluno;


-- ALTERNATIVA
-- Obter a quantidade de alunos orientados por cada professor, junto da idade média destes
SELECT o.professor, COUNT(DISTINCT o.aluno) as qte_alunos,
ROUND(AVG(DATE_PART('YEAR', NOW()) - (DATE_PART('YEAR', p.nascimento)))) as idade_media
FROM orienta o JOIN presenca_marcada pm
ON o.aluno = pm.aluno JOIN pessoa p
ON o.aluno = p.cpf
GROUP BY o.professor;
-- TODO adicionar mais tuplas em orienta


-- QUERY 3
-- Dada uma festa, verificar quantos moradores existem em uma moradia na data da festa.

-- Pegar a moradia em que ocorre uma festa
SELECT f.moradia FROM festa f
WHERE f.nome = 'Indy Festa';

-- Pegar todas as pessoas que moraram na moradia
SELECT c.locatario FROM festa f JOIN contrato_aluguel c
ON c.residencia = f.moradia
WHERE f.nome = 'Indy Festa';

-- Pegar todos os moradores que moravam la durante a festa
SELECT COUNT(c.locatario) as qte_moradores FROM festa f JOIN contrato_aluguel c
ON c.residencia = f.moradia
WHERE c.inicio < DATE(f.data_horario) AND c.fim > DATE(f.data_horario)
AND f.nome = 'Indy Festa';
-- TODO Adicionar mais dados para essa moradia


-- QUERY 4
-- Quais são os campus com mair probabilidade de ter animais passeando neles
-- e quantos animais podem ser esses?
-- Checar a n_animais de cada moradia da mesma cidade do campus e
-- aceita_animais de cada imóvel que fica na mesma cidade (`true` será
-- considerado 1 animal e `false`, 0).
SELECT C.nome_universidade AS UNIVERSIDADE, C.nome_campus AS CAMPUS,
       COALESCE(SUM(n_animais), 0) + COUNT(aceita_animais) AS NUMERO_ANIMAIS
FROM residencia AS R
INNER JOIN campus as C on C.cidade = R.cidade
LEFT JOIN moradia AS M ON M.id = R.id
LEFT JOIN imovel AS I ON I.id = R.id AND I.aceita_animais = true
WHERE n_animais > 0 OR aceita_animais
GROUP BY R.cidade, C.nome_campus, C.nome_universidade
ORDER BY coalesce(SUM(n_animais), 0) + COUNT(aceita_animais) DESC;




-- QUERY 5
-- Média da idade dos alunos que estão há mais tempo na faculdade e estão há procurar de moradia ou imóvel?
SELECT ROUND(AVG(DATE_PART('YEAR', NOW()) - (DATE_PART('YEAR', p.nascimento))))
FROM aluno a1 JOIN cursando c1 ON a1.cpf = c1.aluno
JOIN pessoa p ON a1.cpf = p.cpf
WHERE (a1.procurando_moradia OR a1.procurando_imovel)
AND c1.ano_ingresso IN
(SELECT MIN(ano_ingresso) AS mais_velho FROM aluno a2 JOIN cursando c2
ON a2.cpf = c2.aluno
WHERE a2.procurando_moradia OR a2.procurando_imovel);

-- Datas de nascimento individuais
SELECT p.nascimento FROM aluno a1 JOIN cursando c1
ON a1.cpf = c1.aluno JOIN pessoa p
ON a1.cpf = p.cpf
WHERE (a1.procurando_moradia OR a1.procurando_imovel)
AND c1.ano_ingresso IN
(SELECT MIN(ano_ingresso) AS mais_velho FROM aluno a2 JOIN cursando c2
ON a2.cpf = c2.aluno
WHERE a2.procurando_moradia OR a2.procurando_imovel);



-- QUERY 6
-- Quais são todas as pessoas que já moraram em uma moradia e nunca foram a uma festa?

-- Todas as pessoas que nunca foram em uma festa
SELECT * FROM pessoa p LEFT JOIN ingresso i
ON p.cpf = i.comprador WHERE i.festa IS NULL;

-- Pessoas que moram em moradia
SELECT c.locatario FROM contrato_aluguel c JOIN moradia m
ON m.id = c.residencia;

-- Pessoas que moram em moradia e nunca foram em festa
SELECT c.locatario as cpf FROM contrato_aluguel c JOIN moradia m
ON m.id = c.residencia
WHERE c.locatario NOT IN
((SELECT i.comprador FROM ingresso i)
UNION
(SELECT c.locatario FROM contrato_aluguel c JOIN festa f
ON c.residencia = f.moradia));
-- TODO adicionar mais dados para esta query



-- QUERY 7
-- Quais são os alunos que foram em todas as palestras de um determinado professor e não são orientados por nenhum ainda?

-- Para pegar o CPF de todos os alunos que não são orientados
SELECT a.CPF FROM aluno a LEFT JOIN orienta o
ON a.cpf = o.aluno WHERE o.aluno IS NULL;

-- Para pegar todas as palestras dadas por um professor
SELECT id FROM palestra WHERE ministrante = '74214010591'

-- Para pegar todos os alunos que participaram de todas as palestras de um professor
SELECT CPF FROM aluno a WHERE
NOT EXISTS (
    (SELECT id FROM palestra WHERE ministrante = '74214010591')
    EXCEPT
    (SELECT palestra FROM presenca_marcada WHERE aluno = a.CPF)
);

-- Pegar todos os alunos não orientados que participam da palestra
SELECT a.CPF FROM aluno a LEFT JOIN orienta o
ON a.cpf = o.aluno WHERE o.aluno IS NULL AND
NOT EXISTS (
    (SELECT id FROM palestra WHERE ministrante = '74214010591')
    EXCEPT
    (SELECT palestra FROM presenca_marcada WHERE aluno = a.CPF)
);
