


-- QUERY 7
--  Quais são os alunos que foram em todas as palestras de um determinado professor e não são orientados por nenhum ainda?


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

-- Otimizar?
