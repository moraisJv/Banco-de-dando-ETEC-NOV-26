DROP DATABASE IF EXISTS auth_db;
CREATE DATABASE auth_db;
USE auth_db;
CREATE TABLE perfil (
id_perfil SMALLINT AUTO_INCREMENT NOT NULL PRIMARY KEY,nome VARCHAR(100) NOT NULL,descricao VARCHAR(100) NULL,CONSTRAINT uq_perfis_nome UNIQUE (nome)
) ENGINE = InnoDB;

CREATE TABLE usuario (
id_usuario INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
id_perfil SMALLINT NOT NULL,
nome VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL,
hash_senha VARCHAR(250),
ativo BOOLEAN NOT NULL DEFAULT FALSE,
tentativas_falhas INT NOT NULL DEFAULT 0,
data_criacao DATETIME,
data_atualizacao DATETIME,
login_final DATETIME,
CONSTRAINT uq_usuarios_email UNIQUE (email),
CONSTRAINT fk_usuarios_perfis FOREIGN KEY (id_perfil)
REFERENCES perfil (id_perfil)
ON UPDATE CASCADE
ON DELETE RESTRICT,
CONSTRAINT ck_usuarios_tentativas CHECK (tentativas_falhas <= 10)
) ENGINE = InnoDB;
CREATE TABLE historico_login (
Id_historico INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, sucesso BOOLEAN NOT NULL, user_agent VARCHAR(255) NULL, data_hora DATETIME NOT NULL
) ENGINE = InnoDB;
CREATE TABLE Tokem (
id_token INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, id_usuário INT UNSIGNED NOT NULL, token_hash CHAR(64) NOT NULL, data_expiracao DATETIME NOT NULL, usado BOOLEAN NOT NULL DEFAULT FALSE, criado_em DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, CONSTRAINT uq_tokens_hash UNIQUE (token_hash)
) ENGINE = InnoDB;
ALTER TABLE usuario
ADD COLUMN telefone VARCHAR(20) NULL AFTER email;
SHOW TABLES;
DESCRIBE usuario;
SHOW CREATE TABLE usuario;
INSERT INTO perfiL (nome, descricao) VALUES
  
('admin', 'Acesso total'),
('usuario', 'Acesso comum');
INSERT INTO usuario (id_perfil, nome, email, hash_senha) VALUES
(1, 'Ana Souza', 'ana@escola.com',
'$2y$10$e0MYzXyjpJS7Pd0RVvHwHeFX4Fh3v0Ztk1v5mU5u3qYp1K1QkG6aC');
SELECT id_usuario, nome, hash_senha, ativo
FROM usuario
WHERE email = 'ana@escola.com';
