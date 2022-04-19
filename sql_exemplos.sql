# busca todas as informações (*) da tabela usuarios
SELECT * FROM usuarios;

# busca somente a coluna nome e email da tabela usuarios
SELECT nome, email FROM usuarios;

# realiza a inserção de 2 usuarios na tabela, informando os campos de nome, email e senha 
INSERT INTO usuarios (nome, email, password) VALUES ('Deivid', 'deivid@email.com', '123456');
INSERT INTO usuarios (nome, email, password) VALUES ('Joao', 'joao@email.com', '123456');

# busca todas as informações * na tabela usuarios onde a id corresponda a 2
select * from usuarios where id = 2;

# busca todas as informações * na tabela usuarios onde a id corresponda a 2 OU nome corresponda a XPTO
select * from usuarios where id = 2 or nome = 'XPTO';

# atualiza na tabela usuarios a coluna NOME e a coluna PASSWORD com novos valores ONDE a id sejá 1
UPDATE usuarios set nome = 'Deivid Willyan', password = 'ABC123' where id = 1;

# APAGA na tabela de usuarios onde o id seja igual a 2
DELETE from usuarios where id = 2;