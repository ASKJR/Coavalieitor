#SELECT * FROM coavalieitor_db.avaliacao 
SELECT  MONTH(aval.submissao_final), COUNT(*) 
FROM      coavalieitor_db.avaliacao aval
#WHERE     YEAR(aval.submissao_final) = '2016'
GROUP BY  MONTH(aval.submissao_final)
 LIMIT 12