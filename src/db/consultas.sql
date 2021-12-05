-- QUERY 1

SELECT p.nome, COUNT(i.comprador) as festas, c.curso
FROM ingresso AS i JOIN cursando AS c ON c.aluno = i.comprador
JOIN festa AS f ON i.festa = f.id
JOIN pessoa AS p ON i.comprador = p.cpf
WHERE DATE_PART('day', NOW() - f.data_horario) <= 180
GROUP BY p.nome, c.curso
ORDER BY COUNT(i.comprador) DESC;


-- QUERY 2
SELECT o.professor, COUNT(DISTINCT o.aluno) as qte_alunos,
ROUND(AVG(DATE_PART('YEAR', NOW()) - (DATE_PART('YEAR', p.nascimento)))) as idade_media
FROM orienta AS o JOIN presenca_marcada AS pm
ON o.aluno = pm.aluno JOIN pessoa AS p
ON o.aluno = p.cpf
GROUP BY o.professor;


-- QUERY 3
SELECT COUNT(c.locatario) AS qte_moradores 
FROM festa AS f JOIN contrato_aluguel AS c
ON c.residencia = f.moradia
WHERE c.inicio < DATE(f.data_horario) AND c.fim > DATE(f.data_horario)
AND f.nome = 'Indy Festa';


-- QUERY 4
-- Quais são os campus com mair probabilidade de ter animais passeando neles
-- e quantos animais podem ser esses?
-- Checar a n_animais de cada moradia da mesma cidade do campus e
-- aceita_animais de cada imóvel que fica na mesma cidade (`true` será
-- considerado 1 animal e `false`, 0).
SELECT c.nome_universidade AS universidade, c.nome_campus AS campus,
       COALESCE(SUM(n_animais), 0) + COUNT(aceita_animais) AS numero_animais
FROM residencia AS r
INNER JOIN campus as c on c.cidade = r.cidade
LEFT JOIN moradia AS m ON m.id = r.id
LEFT JOIN imovel AS i ON i.id = r.id AND i.aceita_animais = true
WHERE n_animais > 0 OR aceita_animais
GROUP BY r.cidade, c.nome_campus, c.nome_universidade
ORDER BY coalesce(SUM(n_animais), 0) + COUNT(aceita_animais) DESC;


-- QUERY 5
SELECT ROUND(AVG(DATE_PART('YEAR', NOW()) - (DATE_PART('YEAR', p.nascimento)))) AS idade_media
FROM aluno AS a1 JOIN cursando AS c1 ON a1.cpf = c1.aluno
JOIN pessoa AS p ON a1.cpf = p.cpf
WHERE (a1.procurando_moradia OR a1.procurando_imovel)
AND c1.ano_ingresso IN
(SELECT MIN(ano_ingresso) AS mais_velho FROM aluno a2 JOIN cursando c2
ON a2.cpf = c2.aluno
WHERE a2.procurando_moradia OR a2.procurando_imovel);


-- QUERY 6
SELECT c.locatario as cpf FROM contrato_aluguel AS c JOIN moradia AS m
ON m.id = c.residencia
WHERE c.locatario NOT IN
((SELECT i.comprador FROM ingresso i)
UNION
(SELECT c.locatario FROM contrato_aluguel c JOIN festa AS f
ON c.residencia = f.moradia));


-- QUERY 7
SELECT a.CPF FROM aluno AS a LEFT JOIN orienta AS o
ON a.cpf = o.aluno WHERE o.aluno IS NULL AND
NOT EXISTS (
    (SELECT id FROM palestra WHERE ministrante = '74214010591')
    EXCEPT
    (SELECT palestra FROM presenca_marcada WHERE aluno = a.CPF)
);

