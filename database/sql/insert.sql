/*Perfis*/
INSERT INTO `coavalieitor_db`.`perfil` (`nome`) VALUES ('Administrador');
INSERT INTO `coavalieitor_db`.`perfil` (`nome`) VALUES ('Aluno');
INSERT INTO `coavalieitor_db`.`perfil` (`nome`) VALUES ('Professor');


/*Professores*/
INSERT INTO `coavalieitor_db`.`usuario` (`email`, `senha`,`nome`,`perfil_id`) VALUES ('albertokatojr@gmail.com', MD5('1234'),'Alberto',1);
INSERT INTO `coavalieitor_db`.`usuario` (`email`, `senha`,`nome`,`perfil_id`) VALUES ('ivoneterq@gmail.com', MD5('1234'),'Ivonete',1);
INSERT INTO `coavalieitor_db`.`usuario` (`email`, `senha`,`nome`,`perfil_id`) VALUES ('welyngton.dp@gmail.com', MD5('1234'),'Welyngton',1);
INSERT INTO `coavalieitor_db`.`usuario` (`email`, `senha`,`nome`,`perfil_id`) VALUES ('professor1@gmail.com', MD5('1234'),'Carmem Baggio',3);
INSERT INTO `coavalieitor_db`.`usuario` (`email`, `senha`,`nome`,`perfil_id`) VALUES ('professor2@gmail.com', MD5('1234'),'Amélia da Silva',3);
INSERT INTO `coavalieitor_db`.`usuario` (`email`, `senha`,`nome`,`perfil_id`) VALUES ('professor3@gmail.com', MD5('1234'),'Roberto Ivanoviski',3);

INSERT INTO `coavalieitor_db`.`professor` (`usuario_id`) VALUES (1);
INSERT INTO `coavalieitor_db`.`professor` (`usuario_id`) VALUES (2);
INSERT INTO `coavalieitor_db`.`professor` (`usuario_id`) VALUES (3);
INSERT INTO `coavalieitor_db`.`professor` (`usuario_id`) VALUES (4);
INSERT INTO `coavalieitor_db`.`professor` (`usuario_id`) VALUES (5);
INSERT INTO `coavalieitor_db`.`professor` (`usuario_id`) VALUES (6);

/*Alunos*/
INSERT INTO `coavalieitor_db`.`usuario` (`email`, `senha`,`nome`,`perfil_id`) VALUES ('aluno1@gmail.com', MD5('1234'),'Alfredo Caballero',2);
INSERT INTO `coavalieitor_db`.`usuario` (`email`, `senha`,`nome`,`perfil_id`) VALUES ('aluno2@gmail.com', MD5('1234'),'Allan',2);
INSERT INTO `coavalieitor_db`.`usuario` (`email`, `senha`,`nome`,`perfil_id`) VALUES ('aluno3@gmail.com', MD5('1234'),'Antonia',2);
INSERT INTO `coavalieitor_db`.`usuario` (`email`, `senha`,`nome`,`perfil_id`) VALUES ('aluno4@gmail.com', MD5('1234'),'Brock',2);
INSERT INTO `coavalieitor_db`.`usuario` (`email`, `senha`,`nome`,`perfil_id`) VALUES ('aluno5@gmail.com', MD5('1234'),'Bruno',2);
INSERT INTO `coavalieitor_db`.`usuario` (`email`, `senha`,`nome`,`perfil_id`) VALUES ('aluno6@gmail.com', MD5('1234'),'Calvin',2);
INSERT INTO `coavalieitor_db`.`usuario` (`email`, `senha`,`nome`,`perfil_id`) VALUES ('aluno7@gmail.com', MD5('1234'),'Cameron',2);
INSERT INTO `coavalieitor_db`.`usuario` (`email`, `senha`,`nome`,`perfil_id`) VALUES ('aluno8@gmail.com', MD5('1234'),'Cortez Poland',2);
INSERT INTO `coavalieitor_db`.`usuario` (`email`, `senha`,`nome`,`perfil_id`) VALUES ('aluno9@gmail.com', MD5('1234'),'Donny',2);
INSERT INTO `coavalieitor_db`.`usuario` (`email`, `senha`,`nome`,`perfil_id`) VALUES ('aluno10@gmail.com', MD5('1234'),'Elissa',2);


INSERT INTO `coavalieitor_db`.`usuario` (`email`, `senha`,`nome`,`perfil_id`) VALUES ('aluno11@gmail.com', MD5('1234'),'Esmeralda',2);
INSERT INTO `coavalieitor_db`.`usuario` (`email`, `senha`,`nome`,`perfil_id`) VALUES ('aluno12@gmail.com', MD5('1234'),'Fernanda',2);
INSERT INTO `coavalieitor_db`.`usuario` (`email`, `senha`,`nome`,`perfil_id`) VALUES ('aluno13@gmail.com', MD5('1234'),'Flora Leblanc',2);
INSERT INTO `coavalieitor_db`.`usuario` (`email`, `senha`,`nome`,`perfil_id`) VALUES ('aluno14@gmail.com', MD5('1234'),'Gladys',2);
INSERT INTO `coavalieitor_db`.`usuario` (`email`, `senha`,`nome`,`perfil_id`) VALUES ('aluno15@gmail.com', MD5('1234'),'Ivana',2);
INSERT INTO `coavalieitor_db`.`usuario` (`email`, `senha`,`nome`,`perfil_id`) VALUES ('aluno16@gmail.com', MD5('1234'),'Jeannie',2);
INSERT INTO `coavalieitor_db`.`usuario` (`email`, `senha`,`nome`,`perfil_id`) VALUES ('aluno17@gmail.com', MD5('1234'),'Kimberlee Underwood',2);
INSERT INTO `coavalieitor_db`.`usuario` (`email`, `senha`,`nome`,`perfil_id`) VALUES ('aluno18@gmail.com', MD5('1234'),'Melody',2);
INSERT INTO `coavalieitor_db`.`usuario` (`email`, `senha`,`nome`,`perfil_id`) VALUES ('aluno19@gmail.com', MD5('1234'),'Nancee Trammell',2);
INSERT INTO `coavalieitor_db`.`usuario` (`email`, `senha`,`nome`,`perfil_id`) VALUES ('aluno20@gmail.com', MD5('1234'),'Zelda Link',2);

INSERT INTO `coavalieitor_db`.`usuario` (`email`, `senha`,`nome`,`perfil_id`) VALUES ('aluno21@gmail.com', MD5('1234'),'Maria da Silva',2);
INSERT INTO `coavalieitor_db`.`usuario` (`email`, `senha`,`nome`,`perfil_id`) VALUES ('aluno22@gmail.com', MD5('1234'),'Jose da Silva',2);
INSERT INTO `coavalieitor_db`.`usuario` (`email`, `senha`,`nome`,`perfil_id`) VALUES ('aluno23@gmail.com', MD5('1234'),'Harumi Kato',2);
INSERT INTO `coavalieitor_db`.`usuario` (`email`, `senha`,`nome`,`perfil_id`) VALUES ('aluno24@gmail.com', MD5('1234'),'Tieko Kato',2);
INSERT INTO `coavalieitor_db`.`usuario` (`email`, `senha`,`nome`,`perfil_id`) VALUES ('aluno25@gmail.com', MD5('1234'),'Joshua Wright',2);
INSERT INTO `coavalieitor_db`.`usuario` (`email`, `senha`,`nome`,`perfil_id`) VALUES ('aluno26@gmail.com', MD5('1234'),'Roger Wright',2);
INSERT INTO `coavalieitor_db`.`usuario` (`email`, `senha`,`nome`,`perfil_id`) VALUES ('aluno27@gmail.com', MD5('1234'),'Luiz Gonçalvez da Silva',2);
INSERT INTO `coavalieitor_db`.`usuario` (`email`, `senha`,`nome`,`perfil_id`) VALUES ('aluno28@gmail.com', MD5('1234'),'Luiz Eduardo Bueno',2);
INSERT INTO `coavalieitor_db`.`usuario` (`email`, `senha`,`nome`,`perfil_id`) VALUES ('aluno29@gmail.com', MD5('1234'),'Yasuyuki Kato',2);
INSERT INTO `coavalieitor_db`.`usuario` (`email`, `senha`,`nome`,`perfil_id`) VALUES ('aluno30@gmail.com', MD5('1234'),'Maria Helena Menezes',2);


INSERT INTO `coavalieitor_db`.`aluno` (`usuario_id`) VALUES (7);
INSERT INTO `coavalieitor_db`.`aluno` (`usuario_id`) VALUES (8);
INSERT INTO `coavalieitor_db`.`aluno` (`usuario_id`) VALUES (9);
INSERT INTO `coavalieitor_db`.`aluno` (`usuario_id`) VALUES (10);
INSERT INTO `coavalieitor_db`.`aluno` (`usuario_id`) VALUES (11);
INSERT INTO `coavalieitor_db`.`aluno` (`usuario_id`) VALUES (12);
INSERT INTO `coavalieitor_db`.`aluno` (`usuario_id`) VALUES (13);
INSERT INTO `coavalieitor_db`.`aluno` (`usuario_id`) VALUES (14);
INSERT INTO `coavalieitor_db`.`aluno` (`usuario_id`) VALUES (15);
INSERT INTO `coavalieitor_db`.`aluno` (`usuario_id`) VALUES (16);


INSERT INTO `coavalieitor_db`.`aluno` (`usuario_id`) VALUES (17);
INSERT INTO `coavalieitor_db`.`aluno` (`usuario_id`) VALUES (18);
INSERT INTO `coavalieitor_db`.`aluno` (`usuario_id`) VALUES (19);
INSERT INTO `coavalieitor_db`.`aluno` (`usuario_id`) VALUES (20);
INSERT INTO `coavalieitor_db`.`aluno` (`usuario_id`) VALUES (21);
INSERT INTO `coavalieitor_db`.`aluno` (`usuario_id`) VALUES (22);
INSERT INTO `coavalieitor_db`.`aluno` (`usuario_id`) VALUES (23);
INSERT INTO `coavalieitor_db`.`aluno` (`usuario_id`) VALUES (24);
INSERT INTO `coavalieitor_db`.`aluno` (`usuario_id`) VALUES (25);
INSERT INTO `coavalieitor_db`.`aluno` (`usuario_id`) VALUES (26);


INSERT INTO `coavalieitor_db`.`aluno` (`usuario_id`) VALUES (27);
INSERT INTO `coavalieitor_db`.`aluno` (`usuario_id`) VALUES (28);
INSERT INTO `coavalieitor_db`.`aluno` (`usuario_id`) VALUES (29);
INSERT INTO `coavalieitor_db`.`aluno` (`usuario_id`) VALUES (30);
INSERT INTO `coavalieitor_db`.`aluno` (`usuario_id`) VALUES (31);
INSERT INTO `coavalieitor_db`.`aluno` (`usuario_id`) VALUES (32);
INSERT INTO `coavalieitor_db`.`aluno` (`usuario_id`) VALUES (33);
INSERT INTO `coavalieitor_db`.`aluno` (`usuario_id`) VALUES (34);
INSERT INTO `coavalieitor_db`.`aluno` (`usuario_id`) VALUES (35);
INSERT INTO `coavalieitor_db`.`aluno` (`usuario_id`) VALUES (36);

/*Instituições*/
INSERT INTO `coavalieitor_db`.`instituicao` (`nome`) VALUES ('Universidade Federal do Paraná');
INSERT INTO `coavalieitor_db`.`instituicao` (`nome`) VALUES ('Universidade Positivo');
INSERT INTO `coavalieitor_db`.`instituicao` (`nome`) VALUES ('Pontifícia Universidade Católica do Paraná');

/*Cursos*/
INSERT INTO `coavalieitor_db`.`curso` (`nome`, `instituicao_id`) VALUES ('Tecnologia em Análise e Desenvolvimento de Sistemas', 1);
INSERT INTO `coavalieitor_db`.`curso` (`nome`, `instituicao_id`) VALUES ('Tecnologia em Gestão de Qualidade',1);
INSERT INTO `coavalieitor_db`.`curso` (`nome`, `instituicao_id`) VALUES ('Química', 2);
INSERT INTO `coavalieitor_db`.`curso` (`nome`, `instituicao_id`) VALUES ('Engenharia Civil',2);

/*Disciplinas*/
INSERT INTO `coavalieitor_db`.`disciplina` (`nome`, `curso_id`) VALUES ('Estrutura de dados', 1);
INSERT INTO `coavalieitor_db`.`disciplina` (`nome`, `curso_id`) VALUES ('Algoritmo I', 1);
INSERT INTO `coavalieitor_db`.`disciplina` (`nome`, `curso_id`) VALUES ('Banco de dados', 1);

/*Turmas*/
INSERT INTO `coavalieitor_db`.`turma` (`nome`, `palavra_chave`, `disciplina_id`, `professor_usuario_id`) VALUES ('Turma Matutina', 'BATATA1', 2, 1);
INSERT INTO `coavalieitor_db`.`turma` (`nome`, `palavra_chave`, `disciplina_id`, `professor_usuario_id`) VALUES ('Turma Vespertina', 'BATATA2', 2, 1);
INSERT INTO `coavalieitor_db`.`turma` (`nome`, `palavra_chave`, `disciplina_id`, `professor_usuario_id`) VALUES ('Turma Noturna', 'BATATA3', 2, 1);