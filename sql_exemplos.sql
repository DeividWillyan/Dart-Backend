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

# busca todas as informações da tabela noticias
SELECT * FROM noticias;

# insete na tabela noticas informando os campos titulo, descricao e id_usuarios os valores
insert into noticias (titulo, descricao, id_usuario) values ('Noticia XPTO', 'Se Chove a Terra Molha!!!!', 1);
insert into noticias (titulo, descricao, id_usuario) values ('Noticia Quente', 'Hoje fez 30 graus', 2);

# atualiza na tabela noticia o titlu onde a id da noticia for 1 e o id do usuario foi 1.
update noticias set titulo = 'Noticia da Chuva', descricao = '' where id = 1 and id_usuario = 1;

# busca todas as noticias para o usuario com id 1
select * from noticias where id_usuario = 1;

# titulo noticias, descricao noticia, dt atualizacao noticia, nome do usuario que incluiu a noticia
SELECT
	n.titulo as 'Titulo',
    n.descricao as 'Descricão',
    n.dt_autalizacao as 'Ultima Atualizacão',
    u.nome as 'Autor'
FROM noticias n
INNER JOIN usuarios u on u.id = n.id_usuario
WHERE u.nome like 'D%';

# realiza a busca juntando as tabelas de noticias e usuario pelo id e ordenando pela dt atualizacao decrescente.
SELECT
	n.titulo as 'Titulo',
    n.descricao as 'Descricão',
    n.dt_autalizacao as 'Ultima Atualizacão',
    u.nome as 'Autor'
FROM noticias n
INNER JOIN usuarios u on u.id = n.id_usuario
ORDER BY n.dt_autalizacao DESC;

# busca todas as noticias limitando o resultado para 2 items.
SELECT * FROM noticias limit 2;








