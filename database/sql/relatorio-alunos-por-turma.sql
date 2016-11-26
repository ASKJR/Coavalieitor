SELECT tur.nome AS turma, us.nome AS aluno, dis.nome AS disciplina,cur.nome AS curso,inst.nome AS instituicao,
usProf.nome as professor
FROM turma tur 
JOIN disciplina dis ON (tur.disciplina_id = dis.id)
JOIN curso cur ON (dis.curso_id = cur.id)
JOIN instituicao inst ON (cur.instituicao_id = inst.id)
JOIN matricula mat ON (mat.turma_id = tur.id)
JOIN usuario us ON (us.id = mat.aluno_usuario_id)
JOIN aluno usAluno ON (usAluno.usuario_id = mat.aluno_usuario_id)
JOIN usuario usProf ON (usProf.id = tur.professor_usuario_id)
WHERE
 tur.professor_usuario_id = 3
AND 
dis.id = 3
