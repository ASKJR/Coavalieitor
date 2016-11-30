SELECT  MONTH(sol.solucao_data) AS mes, YEAR(sol.solucao_data) as ano,  COUNT(*) as qtdCorrecoes
FROM      coavalieitor_db.avaliacao aval
JOIN solucao sol ON (sol.avaliacao_id = aval.id)
JOIN correcao cor ON (cor.solucao_id = sol.id)
GROUP BY  MONTH(sol.solucao_data)
 LIMIT 12