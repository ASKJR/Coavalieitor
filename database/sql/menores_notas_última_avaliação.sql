SELECT usAluno.nome AS nome, cf.nota_final AS nota
FROM correcao_final cf 
JOIN usuario usAluno ON (cf.aluno_usuario_id = usAluno.id)
JOIN avaliacao aval ON (aval.id = cf.avaliacao_id)
WHERE ((SELECT id FROM coavalieitor_db.avaliacao ORDER BY id DESC LIMIT 1) = cf.avaliacao_id)
ORDER BY nota