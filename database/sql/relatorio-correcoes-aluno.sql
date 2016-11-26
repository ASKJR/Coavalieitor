SELECT  tur.nome AS turma, us.nome AS aluno, dis.nome AS disciplina,cur.nome AS curso,inst.nome AS instituicao,
usProf.nome as professor, cor.aluno_usuario_id, cor.nota
FROM turma tur
JOIN avaliacao aval ON (aval.turma_id = tur.id)
JOIN solucao sol ON (sol.avaliacao_id = aval.id)
JOIN correcao cor ON (cor.solucao_id = sol.id)
JOIN disciplina dis ON (tur.disciplina_id = dis.id)
JOIN curso cur ON (dis.curso_id = cur.id)
JOIN instituicao inst ON (cur.instituicao_id = inst.id)
JOIN aluno usAluno ON (usAluno.usuario_id = cor.aluno_usuario_id)
JOIN usuario us ON (us.id = cor.aluno_usuario_id)
JOIN usuario usProf ON (usProf.id = tur.professor_usuario_id)
#WHERE  tur.professor_usuario_id = 3 AND dis.id = 3
#group by us.nome