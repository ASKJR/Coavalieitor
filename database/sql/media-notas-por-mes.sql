SELECT AVG(cf.nota_final) AS media, aval.nota_maxima AS nota, MONTH(sol.solucao_data) AS mes, YEAR(sol.solucao_data) as ano,  COUNT(*) as qtdCorrecoes
FROM coavalieitor_db.avaliacao aval
JOIN solucao sol ON (sol.avaliacao_id = aval.id)
JOIN correcao cor ON (cor.solucao_id = sol.id)
JOIN correcao_final cf ON (cf.avaliacao_id = aval.id)
GROUP BY  MONTH(sol.solucao_data)
 LIMIT 12