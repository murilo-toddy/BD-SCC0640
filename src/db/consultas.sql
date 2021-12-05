-- QUERY 1

SELECT p.nome, COUNT(i.comprador) as festas, c.curso
FROM ingresso i JOIN cursando c ON c.aluno = i.comprador
JOIN festa f ON i.festa = f.id
JOIN pessoa p ON i.comprador = p.cpf
WHERE DATE_PART('day', NOW() - f.data_horario) <= 180
GROUP BY p.nome, c.curso
ORDER BY COUNT(i.comprador) DESC;


-- QUERY 2
SELECT o.professor, COUNT(DISTINCT o.aluno) as qte_alunos,
ROUND(AVG(DATE_PART('YEAR', NOW()) - (DATE_PART('YEAR', p.nascimento)))) as idade_media
FROM orienta o JOIN presenca_marcada pm
ON o.aluno = pm.aluno JOIN pessoa p
ON o.aluno = p.cpf
GROUP BY o.professor;


-- QUERY 3
SELECT COUNT(c.locatario) as qte_moradores FROM festa f JOIN contrato_aluguel c
ON c.residencia = f.moradia
WHERE c.inicio < DATE(f.data_horario) AND c.fim > DATE(f.data_horario)
AND f.nome = 'Indy Festa';


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
SELECT ROUND(AVG(DATE_PART('YEAR', NOW()) - (DATE_PART('YEAR', p.nascimento))))
FROM aluno a1 JOIN cursando c1 ON a1.cpf = c1.aluno
JOIN pessoa p ON a1.cpf = p.cpf
WHERE (a1.procurando_moradia OR a1.procurando_imovel)
AND c1.ano_ingresso IN
(SELECT MIN(ano_ingresso) AS mais_velho FROM aluno a2 JOIN cursando c2
ON a2.cpf = c2.aluno
WHERE a2.procurando_moradia OR a2.procurando_imovel);



-- QUERY 6
SELECT c.locatario as cpf FROM contrato_aluguel c JOIN moradia m
ON m.id = c.residencia
WHERE c.locatario NOT IN
((SELECT i.comprador FROM ingresso i)
UNION
(SELECT c.locatario FROM contrato_aluguel c JOIN festa f
ON c.residencia = f.moradia));



-- QUERY 7
SELECT a.CPF FROM aluno a LEFT JOIN orienta o
ON a.cpf = o.aluno WHERE o.aluno IS NULL AND
NOT EXISTS (
    (SELECT id FROM palestra WHERE ministrante = '74214010591')
    EXCEPT
    (SELECT palestra FROM presenca_marcada WHERE aluno = a.CPF)
);

