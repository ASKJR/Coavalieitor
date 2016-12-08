use coavalieitor_db;
SELECT AVG(cf.nota_final), aval.nota_maxima AS nota, (AVG(cf.nota_final) / aval.nota_maxima) AS media,
MONTH(sol.solucao_data) AS mes, YEAR(sol.solucao_data) as ano, COUNT(*) as qtdCorrecoes, tur.nome AS turma
FROM coavalieitor_db.avaliacao aval
JOIN solucao sol ON (sol.avaliacao_id = aval.id)
JOIN correcao cor ON (cor.solucao_id = sol.id)
JOIN correcao_final cf ON (cf.avaliacao_id = aval.id)
JOIN turma tur ON (tur.id = aval.turma_id)
JOIN usuario us ON (us.id = tur.professor_usuario_id)
GROUP BY  MONTH(sol.solucao_data), tur.nome
ORDER BY tur.nome
LIMIT 12