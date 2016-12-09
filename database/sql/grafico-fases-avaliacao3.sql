SELECT
(SELECT COUNT(*) AS naoIniciadas FROM avaliacao WHERE submissao_inicial > NOW()) AS NaoIniciadas,
(SELECT COUNT(*) AS emSubmissao FROM avaliacao WHERE NOW() >= submissao_inicial AND NOW() <= submissao_final) AS emSubmissao,
(SELECT COUNT(*) AS emCorrecao FROM avaliacao WHERE NOW() >= correcao_inicial AND NOW() <= correcao_final ) AS emCorrecao,
(SELECT COUNT(*) AS finalizadas FROM avaliacao WHERE NOW() > correcao_final) AS finalizadas