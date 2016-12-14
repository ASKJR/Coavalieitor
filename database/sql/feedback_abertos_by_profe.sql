
select * from usuario p inner join turma t on t.professor_usuario_id = p.id 
    inner join avaliacao a on a.turma_id = t.id 
    inner join solucao s on s.avaliacao_id = a.id
    inner join correcao c on c.solucao_id = s.id 
    left join correcao_final cf on cf.avaliacao_id = a.id
	where p.id = 3 and cf.feedback is null