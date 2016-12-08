SELECT
(SELECT COUNT(*) AS naoIniciadas FROM avaliacao WHERE submissao_inicial > NOW()) AS NaoIniciadas,
(SELECT COUNT(*) AS finalizadas FROM avaliacao WHERE submissao_final < NOW()) AS finalizadas,
(SELECT COUNT(*) AS emAndamento FROM avaliacao WHERE submissao_inicial < NOW() AND submissao_final > NOW()) AS emAndamento