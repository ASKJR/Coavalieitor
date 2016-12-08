SELECT
(SELECT COUNT(*) AS naoIniciadas FROM avaliacao WHERE submissao_inicial > NOW()) AS NaoIniciadas,
(SELECT COUNT(*) AS emSubmissao FROM avaliacao WHERE submissao_inicial >= NOW() AND submissao_final <= NOW()) AS emSubmissao,
(SELECT COUNT(*) AS emCorrecao FROM avaliacao WHERE correcao_inicial >= NOW() AND correcao_final <= NOW()) AS emCorrecao,
(SELECT COUNT(*) AS finalizadas FROM avaliacao WHERE NOW() > correcao_final) AS finalizadas

