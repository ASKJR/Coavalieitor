/*Professores*/
INSERT INTO `coavalieitor_db`.`usuario` (`email`, `senha`,`nome`) VALUES ('albertokatojr@gmail.com', MD5('1234'),'Alberto');
INSERT INTO `coavalieitor_db`.`usuario` (`email`, `senha`,`nome`) VALUES ('ivoneterq@gmail.com', MD5('1234'),'Ivonete');
INSERT INTO `coavalieitor_db`.`usuario` (`email`, `senha`,`nome`) VALUES ('welyngton.dp@gmail.com', MD5('1234'),'Welyngton');
INSERT INTO `coavalieitor_db`.`professor` (`usuario_id`) VALUES (1);
INSERT INTO `coavalieitor_db`.`professor` (`usuario_id`) VALUES (2);
INSERT INTO `coavalieitor_db`.`professor` (`usuario_id`) VALUES (3);

/*alunos*/
INSERT INTO `coavalieitor_db`.`usuario` (`email`, `senha`,`nome`) VALUES ('aluno1@gmail.com', MD5('1234'),'Aluno1');
INSERT INTO `coavalieitor_db`.`usuario` (`email`, `senha`,`nome`) VALUES ('aluno2@gmail.com', MD5('1234'),'Aluno2');
INSERT INTO `coavalieitor_db`.`usuario` (`email`, `senha`,`nome`) VALUES ('aluno3@gmail.com', MD5('1234'),'Aluno3');
INSERT INTO `coavalieitor_db`.`usuario` (`email`, `senha`,`nome`) VALUES ('aluno4@gmail.com', MD5('1234'),'Aluno4');
INSERT INTO `coavalieitor_db`.`usuario` (`email`, `senha`,`nome`) VALUES ('aluno5@gmail.com', MD5('1234'),'Aluno5');
INSERT INTO `coavalieitor_db`.`usuario` (`email`, `senha`,`nome`) VALUES ('aluno6@gmail.com', MD5('1234'),'Aluno6');
INSERT INTO `coavalieitor_db`.`usuario` (`email`, `senha`,`nome`) VALUES ('aluno7@gmail.com', MD5('1234'),'Aluno7');
INSERT INTO `coavalieitor_db`.`usuario` (`email`, `senha`,`nome`) VALUES ('aluno8@gmail.com', MD5('1234'),'Aluno8');
INSERT INTO `coavalieitor_db`.`usuario` (`email`, `senha`,`nome`) VALUES ('aluno9@gmail.com', MD5('1234'),'Aluno9');
INSERT INTO `coavalieitor_db`.`usuario` (`email`, `senha`,`nome`) VALUES ('aluno10@gmail.com', MD5('1234'),'Aluno10');

INSERT INTO `coavalieitor_db`.`aluno` (`usuario_id`) VALUES (4);
INSERT INTO `coavalieitor_db`.`aluno` (`usuario_id`) VALUES (5);
INSERT INTO `coavalieitor_db`.`aluno` (`usuario_id`) VALUES (6);
INSERT INTO `coavalieitor_db`.`aluno` (`usuario_id`) VALUES (7);
INSERT INTO `coavalieitor_db`.`aluno` (`usuario_id`) VALUES (8);
INSERT INTO `coavalieitor_db`.`aluno` (`usuario_id`) VALUES (9);
INSERT INTO `coavalieitor_db`.`aluno` (`usuario_id`) VALUES (10);
INSERT INTO `coavalieitor_db`.`aluno` (`usuario_id`) VALUES (11);
INSERT INTO `coavalieitor_db`.`aluno` (`usuario_id`) VALUES (12);
INSERT INTO `coavalieitor_db`.`aluno` (`usuario_id`) VALUES (13);

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







