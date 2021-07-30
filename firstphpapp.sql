-- firstphpapp.sql
-- Modelo de bando de dados MySQL para o aplicativo Web

-- ATENÇÃO!
-- Este arquivo destroi o banco de dados e só deve ser usado em tempo de desenvolvimento e somente com o XAMPP.
-- Quando publicar o aplicativo Web no provedor de hospedagem apague este arquivo por questões de segurança.

-- PERIGO!
-- Apaga e recria banco de dados sempre que este arquivo for "executado".
DROP DATABASE IF EXISTS firstphpapp;
CREATE DATABASE firstphpapp CHARACTER SET utf8 COLLATE utf8_general_ci;
USE firstphpapp;

-- Cria tabela de configuração do tema
CREATE TABLE config (
    id INT PRIMARY KEY AUTO_INCREMENT,
    var VARCHAR(63) NOT NULL,
    val LONGTEXT NOT NULL
);

-- Insere configurações do tema
INSERT INTO config (var, val) VALUES 
    ('favicon', '/img/logo01.png'),
    ('appLogo', '/img/logo02.png'),
    ('appTitle', 'Meu Primeiro App'),
    ('appSlogan', 'Primeiros passos no PHP'),
    ('appYear', '2021'),
    ('appOwner', 'Seu Nome'),
    ('appOwnerEmail', 'contato@firstphpsite.tk'),
    ('backgroundColor', '#ffffff'),
    ('backgroundImage', '/img/background02.jpg'),
    ('meta_author', 'Seu nome'),
    ('meta_copyright', 'Seu nome'),
    ('meta_description', 'Site modelo para desenvolvimento de aplicativos Web full stack com PHP.'),
    ('meta_keywords', 'HTML, CSS, JavaScript, PHP, MySQL, aplicativo, Web, fullstack, back-end, front-end, dinâmico, flexbox'),
    ('social_facebook', 'https://facebook.com/seunome'),
    ('social_github', 'https://github.com/seunome'),
    ('social_instagram', 'https://instagram.com/seunome'),
    ('social_linkedin', 'https://linkedin.com/seunome')
;

-- Cria tabela para formulário de contatos
CREATE TABLE contacts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    name VARCHAR(127) NOT NULL,
    email VARCHAR(255) NOT NULL,
    subject VARCHAR(255) NOT NULL,
    message LONGTEXT NOT NULL,
    status ENUM('recebida', 'lida', 'respondida', 'apagada') DEFAULT 'recebida'
);

-- Cria tabela com autores dos artigos
CREATE TABLE authors (
    aut_id INT PRIMARY KEY AUTO_INCREMENT,
    aut_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    aut_name VARCHAR(127) NOT NULL, 
    aut_image VARCHAR(255) NOT NULL,
    aut_description VARCHAR(255) NOT NULL,
    aut_link VARCHAR(255),
    aut_email VARCHAR(255) NOT NULL,
    aut_status ENUM('inativo', 'ativo') DEFAULT 'ativo'
);

-- Insere alguns autores "fake" para os testes
INSERT INTO authors (
    aut_id,
    aut_name,
    aut_image,
    aut_link,
    aut_email,
    aut_description
) VALUES 
(
    '1',
    'Equipe FirstPHPSite',
    '/img/qrcode01.png',
    'http://www.firstphpsite.tk/',
    'equipe@firstphpsite.tk',
    'Site sobre tecnologia de alguma coisa.'
),
(
    '2',
    'Joca da Silva',
    'https://randomuser.me/api/portraits/lego/7.jpg',
    'http://www.joca.com/',
    'joca@silva.com',
    'Programador, desenvolvedor, contador, empreendedor e distrubuidor.'
),
(
    '3',
    'André Luferat',
    'https://randomuser.me/api/portraits/lego/4.jpg',
    'http://www.luferat.net/',
    'andre@luferat.net',
    'Especialista em TI, hardware, redes, devops, desenvolvedor Web e instrutor.'
),
(
    '4',
    'Setembrina Trocatapas',
    'https://randomuser.me/api/portraits/lego/3.jpg',
    'http://www.set.net/',
    'setembrina@set.net',
    'Diagramadora gráfica, especialista em Photoshop, Corel Draw e AutoCad.'
);

-- Cria tabela com categorias
CREATE TABLE categories (
    cat_id INT PRIMARY KEY AUTO_INCREMENT,
    cat_name VARCHAR (128) NOT NULL
);

-- Insere algumas categorias "fake" para os testes
INSERT INTO categories (cat_id, cat_name) VALUES
('1', 'JavaScript'),
('2', 'PHP'),
('3', 'Linux'),
('4', 'Windows'),
('5', 'Front-end'),
('6', 'Back-end');

-- Cria tabela com Artigos
CREATE TABLE articles (
    art_id INT PRIMARY KEY AUTO_INCREMENT,
    art_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    art_image VARCHAR(255) NOT NULL,
    art_title VARCHAR(127) NOT NULL,
    art_intro VARCHAR(255) NOT NULL,
    art_text LONGTEXT NOT NULL,
    art_author INT NOT NULL,
	art_css LONGTEXT DEFAULT '',
    art_status ENUM ('inativo', 'ativo') DEFAULT 'ativo',
    FOREIGN KEY (art_author) REFERENCES authors (aut_id)
);

-- Insere alguns artigos "fake" para os testes
INSERT INTO articles (
    art_id,
    art_date,
    art_image,
    art_title,
    art_intro,
    art_text,
    art_author
) VALUES  
(
    '1',
    '2021-03-10 10:10:00',
    'https://picsum.photos/300',
    'Primeiro artigo',
    'Este é nosso primeiro artigo sobre fuinhas, furões e afins.',
    '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repudiandae molestias, itaque inventore eius consequatur possimus delectus recusandae quaerat ratione doloribus corporis. At, repellat accusantium. Iusto quidem quis voluptatibus provident dolor?</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis ipsum quasi cupiditate neque, voluptas voluptate nam nostrum facilis aspernatur esse saepe expedita cumque animi consequatur ab odio? Ipsum, omnis ducimus.</p><img class="flush" src="https://picsum.photos/400/200" alt="imagem aleatória"><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptates incidunt officia id doloribus dicta saepe atque ab ullam nisi inventore quas libero, rem a eveniet assumenda ex quibusdam illo maiores?</p><h4>Lista de links:</h4><ul><li><a href="http://luferat.net/">Site do fessô</a></li><li><a href="http://github.com/luferat">GitHub do fessô</a></li></ul><p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ullam, exercitationem commodi!</p><p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nam, iusto eveniet? Harum nulla neque iusto, cumque similique voluptate doloremque quos totam repellendus omnis, assumenda a aperiam molestiae, beatae blanditiis quod.</p>',
    '3'
),
(
    '2',
    '2021-03-13 10:10:00',
    'https://picsum.photos/301',
    'Porque as fuinhas gritam',
    'Sabe quando sua fuinha dá aquele "gritinho"?',
    '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repudiandae molestias, itaque inventore eius consequatur possimus delectus recusandae quaerat ratione doloribus corporis. At, repellat accusantium. Iusto quidem quis voluptatibus provident dolor?</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis ipsum quasi cupiditate neque, voluptas voluptate nam nostrum facilis aspernatur esse saepe expedita cumque animi consequatur ab odio? Ipsum, omnis ducimus.</p><img class="flush" src="https://picsum.photos/400/200" alt="imagem aleatória"><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptates incidunt officia id doloribus dicta saepe atque ab ullam nisi inventore quas libero, rem a eveniet assumenda ex quibusdam illo maiores?</p><h4>Lista de links:</h4><ul><li><a href="http://luferat.net/">Site do fessô</a></li><li><a href="http://github.com/luferat">GitHub do fessô</a></li></ul><p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ullam, exercitationem commodi!</p><p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nam, iusto eveniet? Harum nulla neque iusto, cumque similique voluptate doloremque quos totam repellendus omnis, assumenda a aperiam molestiae, beatae blanditiis quod.</p>',
    '2'
);

INSERT INTO articles (
    art_id,
    art_date,
    art_image,
    art_title,
    art_intro,
    art_text,
    art_author
) VALUES 
(
    '3',
    '2021-03-13 11:42:00',
    'https://picsum.photos/302',
    'Fuinhas comem o que?',
    'Como alimetar seu pet de forma correta e saudável.',
    '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repudiandae molestias, itaque inventore eius consequatur possimus delectus recusandae quaerat ratione doloribus corporis. At, repellat accusantium. Iusto quidem quis voluptatibus provident dolor?</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis ipsum quasi cupiditate neque, voluptas voluptate nam nostrum facilis aspernatur esse saepe expedita cumque animi consequatur ab odio? Ipsum, omnis ducimus.</p><img class="flush" src="https://picsum.photos/400/200" alt="imagem aleatória"><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptates incidunt officia id doloribus dicta saepe atque ab ullam nisi inventore quas libero, rem a eveniet assumenda ex quibusdam illo maiores?</p><h4>Lista de links:</h4><ul><li><a href="http://luferat.net/">Site do fessô</a></li><li><a href="http://github.com/luferat">GitHub do fessô</a></li></ul><p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ullam, exercitationem commodi!</p><p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nam, iusto eveniet? Harum nulla neque iusto, cumque similique voluptate doloremque quos totam repellendus omnis, assumenda a aperiam molestiae, beatae blanditiis quod.</p>',
    '4'
),
(
    '4',
    '2021-03-14 10:10:00',
    'https://picsum.photos/303',
    'Fuinhas e outos pets juntos',
    'Seu cachorro e sua fuinha podem se melhores amigos.',
    '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repudiandae molestias, itaque inventore eius consequatur possimus delectus recusandae quaerat ratione doloribus corporis. At, repellat accusantium. Iusto quidem quis voluptatibus provident dolor?</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis ipsum quasi cupiditate neque, voluptas voluptate nam nostrum facilis aspernatur esse saepe expedita cumque animi consequatur ab odio? Ipsum, omnis ducimus.</p><img class="flush" src="https://picsum.photos/400/200" alt="imagem aleatória"><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptates incidunt officia id doloribus dicta saepe atque ab ullam nisi inventore quas libero, rem a eveniet assumenda ex quibusdam illo maiores?</p><h4>Lista de links:</h4><ul><li><a href="http://luferat.net/">Site do fessô</a></li><li><a href="http://github.com/luferat">GitHub do fessô</a></li></ul><p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ullam, exercitationem commodi!</p><p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nam, iusto eveniet? Harum nulla neque iusto, cumque similique voluptate doloremque quos totam repellendus omnis, assumenda a aperiam molestiae, beatae blanditiis quod.</p>',
    '3'
);

INSERT INTO articles (
    art_id,
    art_date,
    art_image,
    art_title,
    art_intro,
    art_text,
    art_author
) VALUES  
(
    '5',
    '2021-03-20 10:10:00',
    'https://picsum.photos/304',
    'Mais um artigo',
    'Se você estava esperando mais um artigo sobre fuinhas, furões e afins.',
    '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repudiandae molestias, itaque inventore eius consequatur possimus delectus recusandae quaerat ratione doloribus corporis. At, repellat accusantium. Iusto quidem quis voluptatibus provident dolor?</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis ipsum quasi cupiditate neque, voluptas voluptate nam nostrum facilis aspernatur esse saepe expedita cumque animi consequatur ab odio? Ipsum, omnis ducimus.</p><img class="flush" src="https://picsum.photos/400/200" alt="imagem aleatória"><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptates incidunt officia id doloribus dicta saepe atque ab ullam nisi inventore quas libero, rem a eveniet assumenda ex quibusdam illo maiores?</p><h4>Lista de links:</h4><ul><li><a href="http://luferat.net/">Site do fessô</a></li><li><a href="http://github.com/luferat">GitHub do fessô</a></li></ul><p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ullam, exercitationem commodi!</p><p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nam, iusto eveniet? Harum nulla neque iusto, cumque similique voluptate doloremque quos totam repellendus omnis, assumenda a aperiam molestiae, beatae blanditiis quod.</p>',
    '3'
),
(
    '6',
    '2021-03-23 10:10:00',
    'https://picsum.photos/305',
    'Porque as fuinhas fuçam',
    'Sabe quando sua fuinha fuça onde não deve?',
    '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repudiandae molestias, itaque inventore eius consequatur possimus delectus recusandae quaerat ratione doloribus corporis. At, repellat accusantium. Iusto quidem quis voluptatibus provident dolor?</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis ipsum quasi cupiditate neque, voluptas voluptate nam nostrum facilis aspernatur esse saepe expedita cumque animi consequatur ab odio? Ipsum, omnis ducimus.</p><img class="flush" src="https://picsum.photos/400/200" alt="imagem aleatória"><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptates incidunt officia id doloribus dicta saepe atque ab ullam nisi inventore quas libero, rem a eveniet assumenda ex quibusdam illo maiores?</p><h4>Lista de links:</h4><ul><li><a href="http://luferat.net/">Site do fessô</a></li><li><a href="http://github.com/luferat">GitHub do fessô</a></li></ul><p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ullam, exercitationem commodi!</p><p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nam, iusto eveniet? Harum nulla neque iusto, cumque similique voluptate doloremque quos totam repellendus omnis, assumenda a aperiam molestiae, beatae blanditiis quod.</p>',
    '2'
);

INSERT INTO articles (
    art_id,
    art_date,
    art_image,
    art_title,
    art_intro,
    art_text,
    art_author
) VALUES 
(
    '7',
    '2021-03-23 11:42:00',
    'https://picsum.photos/306',
    'Fuinhas bebem o que?',
    'Como dar água para seu pet de forma correta e saudável.',
    '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repudiandae molestias, itaque inventore eius consequatur possimus delectus recusandae quaerat ratione doloribus corporis. At, repellat accusantium. Iusto quidem quis voluptatibus provident dolor?</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis ipsum quasi cupiditate neque, voluptas voluptate nam nostrum facilis aspernatur esse saepe expedita cumque animi consequatur ab odio? Ipsum, omnis ducimus.</p><img class="flush" src="https://picsum.photos/400/200" alt="imagem aleatória"><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptates incidunt officia id doloribus dicta saepe atque ab ullam nisi inventore quas libero, rem a eveniet assumenda ex quibusdam illo maiores?</p><h4>Lista de links:</h4><ul><li><a href="http://luferat.net/">Site do fessô</a></li><li><a href="http://github.com/luferat">GitHub do fessô</a></li></ul><p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ullam, exercitationem commodi!</p><p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nam, iusto eveniet? Harum nulla neque iusto, cumque similique voluptate doloremque quos totam repellendus omnis, assumenda a aperiam molestiae, beatae blanditiis quod.</p>',
    '4'
),
(
    '8',
    '2021-03-24 10:10:00',
    'https://picsum.photos/307',
    'Fuinhas e jaguatiricas juntos',
    'Sua jaguatirica e sua fuinha podem se melhores amigos.',
    '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repudiandae molestias, itaque inventore eius consequatur possimus delectus recusandae quaerat ratione doloribus corporis. At, repellat accusantium. Iusto quidem quis voluptatibus provident dolor?</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis ipsum quasi cupiditate neque, voluptas voluptate nam nostrum facilis aspernatur esse saepe expedita cumque animi consequatur ab odio? Ipsum, omnis ducimus.</p><img class="flush" src="https://picsum.photos/400/200" alt="imagem aleatória"><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptates incidunt officia id doloribus dicta saepe atque ab ullam nisi inventore quas libero, rem a eveniet assumenda ex quibusdam illo maiores?</p><h4>Lista de links:</h4><ul><li><a href="http://luferat.net/">Site do fessô</a></li><li><a href="http://github.com/luferat">GitHub do fessô</a></li></ul><p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ullam, exercitationem commodi!</p><p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nam, iusto eveniet? Harum nulla neque iusto, cumque similique voluptate doloremque quos totam repellendus omnis, assumenda a aperiam molestiae, beatae blanditiis quod.</p>',
    '3'
);

INSERT INTO articles ( 
    art_id,
    art_date,
    art_image,
    art_title,
    art_intro,
    art_text,
    art_author
) VALUES  
(
    '9',
    '2021-03-30 10:10:00',
    'https://picsum.photos/308',
    'Novo artigo',
    'Mais novo artigo sobre fuinhas, furões e afins.',
    '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repudiandae molestias, itaque inventore eius consequatur possimus delectus recusandae quaerat ratione doloribus corporis. At, repellat accusantium. Iusto quidem quis voluptatibus provident dolor?</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis ipsum quasi cupiditate neque, voluptas voluptate nam nostrum facilis aspernatur esse saepe expedita cumque animi consequatur ab odio? Ipsum, omnis ducimus.</p><img class="flush" src="https://picsum.photos/400/200" alt="imagem aleatória"><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptates incidunt officia id doloribus dicta saepe atque ab ullam nisi inventore quas libero, rem a eveniet assumenda ex quibusdam illo maiores?</p><h4>Lista de links:</h4><ul><li><a href="http://luferat.net/">Site do fessô</a></li><li><a href="http://github.com/luferat">GitHub do fessô</a></li></ul><p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ullam, exercitationem commodi!</p><p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nam, iusto eveniet? Harum nulla neque iusto, cumque similique voluptate doloremque quos totam repellendus omnis, assumenda a aperiam molestiae, beatae blanditiis quod.</p>',
    '3'
),
(
    '10',
    '2021-03-31 10:10:00',
    'https://picsum.photos/309',
    'Porque as fuinhas mamam',
    'Sabe quando sua fuinha é filhote? Por que ela mama?',
    '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repudiandae molestias, itaque inventore eius consequatur possimus delectus recusandae quaerat ratione doloribus corporis. At, repellat accusantium. Iusto quidem quis voluptatibus provident dolor?</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis ipsum quasi cupiditate neque, voluptas voluptate nam nostrum facilis aspernatur esse saepe expedita cumque animi consequatur ab odio? Ipsum, omnis ducimus.</p><img class="flush" src="https://picsum.photos/400/200" alt="imagem aleatória"><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptates incidunt officia id doloribus dicta saepe atque ab ullam nisi inventore quas libero, rem a eveniet assumenda ex quibusdam illo maiores?</p><h4>Lista de links:</h4><ul><li><a href="http://luferat.net/">Site do fessô</a></li><li><a href="http://github.com/luferat">GitHub do fessô</a></li></ul><p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ullam, exercitationem commodi!</p><p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nam, iusto eveniet? Harum nulla neque iusto, cumque similique voluptate doloremque quos totam repellendus omnis, assumenda a aperiam molestiae, beatae blanditiis quod.</p>',
    '2'
);

INSERT INTO articles (
    art_id,
    art_date,
    art_image,
    art_title,
    art_intro,
    art_text,
    art_author
) VALUES 
(
    '11',
    '2021-04-13 11:42:00',
    'https://picsum.photos/310',
    'Fuinhas dormem onde?',
    'Como arrumar a cama de seu pet de forma correta e saudável.',
    '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repudiandae molestias, itaque inventore eius consequatur possimus delectus recusandae quaerat ratione doloribus corporis. At, repellat accusantium. Iusto quidem quis voluptatibus provident dolor?</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis ipsum quasi cupiditate neque, voluptas voluptate nam nostrum facilis aspernatur esse saepe expedita cumque animi consequatur ab odio? Ipsum, omnis ducimus.</p><img class="flush" src="https://picsum.photos/400/200" alt="imagem aleatória"><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptates incidunt officia id doloribus dicta saepe atque ab ullam nisi inventore quas libero, rem a eveniet assumenda ex quibusdam illo maiores?</p><h4>Lista de links:</h4><ul><li><a href="http://luferat.net/">Site do fessô</a></li><li><a href="http://github.com/luferat">GitHub do fessô</a></li></ul><p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ullam, exercitationem commodi!</p><p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nam, iusto eveniet? Harum nulla neque iusto, cumque similique voluptate doloremque quos totam repellendus omnis, assumenda a aperiam molestiae, beatae blanditiis quod.</p>',
    '4'
),
(
    '12',
    '2021-04-14 10:10:00',
    'https://picsum.photos/311',
    'Fuinhas e pernilongos juntos',
    'Seu pernilongo de estimação e sua fuinha podem se melhores amigos.',
    '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repudiandae molestias, itaque inventore eius consequatur possimus delectus recusandae quaerat ratione doloribus corporis. At, repellat accusantium. Iusto quidem quis voluptatibus provident dolor?</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis ipsum quasi cupiditate neque, voluptas voluptate nam nostrum facilis aspernatur esse saepe expedita cumque animi consequatur ab odio? Ipsum, omnis ducimus.</p><img class="flush" src="https://picsum.photos/400/200" alt="imagem aleatória"><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptates incidunt officia id doloribus dicta saepe atque ab ullam nisi inventore quas libero, rem a eveniet assumenda ex quibusdam illo maiores?</p><h4>Lista de links:</h4><ul><li><a href="http://luferat.net/">Site do fessô</a></li><li><a href="http://github.com/luferat">GitHub do fessô</a></li></ul><p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ullam, exercitationem commodi!</p><p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nam, iusto eveniet? Harum nulla neque iusto, cumque similique voluptate doloremque quos totam repellendus omnis, assumenda a aperiam molestiae, beatae blanditiis quod.</p>',
    '3'
);

INSERT INTO articles (
    art_id,
    art_date,
    art_image,
    art_title,
    art_intro,
    art_text,
    art_author
) VALUES  
(
    '13',
    '2021-05-10 10:10:00',
    'https://picsum.photos/312',
    'Só mais um artigo',
    'Este é nosso xxxxx artigo sobre fuinhas, furões e afins.',
    '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repudiandae molestias, itaque inventore eius consequatur possimus delectus recusandae quaerat ratione doloribus corporis. At, repellat accusantium. Iusto quidem quis voluptatibus provident dolor?</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis ipsum quasi cupiditate neque, voluptas voluptate nam nostrum facilis aspernatur esse saepe expedita cumque animi consequatur ab odio? Ipsum, omnis ducimus.</p><img class="flush" src="https://picsum.photos/400/200" alt="imagem aleatória"><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptates incidunt officia id doloribus dicta saepe atque ab ullam nisi inventore quas libero, rem a eveniet assumenda ex quibusdam illo maiores?</p><h4>Lista de links:</h4><ul><li><a href="http://luferat.net/">Site do fessô</a></li><li><a href="http://github.com/luferat">GitHub do fessô</a></li></ul><p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ullam, exercitationem commodi!</p><p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nam, iusto eveniet? Harum nulla neque iusto, cumque similique voluptate doloremque quos totam repellendus omnis, assumenda a aperiam molestiae, beatae blanditiis quod.</p>',
    '3'
),
(
    '14',
    '2021-05-13 10:10:00',
    'https://picsum.photos/313',
    'Porque as fuinhas cagam',
    'Sabe quando sua fuinha dá aquele "peidinho"?',
    '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repudiandae molestias, itaque inventore eius consequatur possimus delectus recusandae quaerat ratione doloribus corporis. At, repellat accusantium. Iusto quidem quis voluptatibus provident dolor?</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis ipsum quasi cupiditate neque, voluptas voluptate nam nostrum facilis aspernatur esse saepe expedita cumque animi consequatur ab odio? Ipsum, omnis ducimus.</p><img class="flush" src="https://picsum.photos/400/200" alt="imagem aleatória"><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptates incidunt officia id doloribus dicta saepe atque ab ullam nisi inventore quas libero, rem a eveniet assumenda ex quibusdam illo maiores?</p><h4>Lista de links:</h4><ul><li><a href="http://luferat.net/">Site do fessô</a></li><li><a href="http://github.com/luferat">GitHub do fessô</a></li></ul><p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ullam, exercitationem commodi!</p><p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nam, iusto eveniet? Harum nulla neque iusto, cumque similique voluptate doloremque quos totam repellendus omnis, assumenda a aperiam molestiae, beatae blanditiis quod.</p>',
    '2'
);

INSERT INTO articles (
    art_id,
    art_date,
    art_image,
    art_title,
    art_intro,
    art_text,
    art_author
) VALUES 
(
    '15',
    '2021-05-31 11:42:00',
    'https://picsum.photos/314',
    'Fuinhas pensam o que?',
    'Como saber o que seu pet está pensando.',
    '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repudiandae molestias, itaque inventore eius consequatur possimus delectus recusandae quaerat ratione doloribus corporis. At, repellat accusantium. Iusto quidem quis voluptatibus provident dolor?</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis ipsum quasi cupiditate neque, voluptas voluptate nam nostrum facilis aspernatur esse saepe expedita cumque animi consequatur ab odio? Ipsum, omnis ducimus.</p><img class="flush" src="https://picsum.photos/400/200" alt="imagem aleatória"><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptates incidunt officia id doloribus dicta saepe atque ab ullam nisi inventore quas libero, rem a eveniet assumenda ex quibusdam illo maiores?</p><h4>Lista de links:</h4><ul><li><a href="http://luferat.net/">Site do fessô</a></li><li><a href="http://github.com/luferat">GitHub do fessô</a></li></ul><p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ullam, exercitationem commodi!</p><p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nam, iusto eveniet? Harum nulla neque iusto, cumque similique voluptate doloremque quos totam repellendus omnis, assumenda a aperiam molestiae, beatae blanditiis quod.</p>',
    '4'
),
(
    '16',
    '2021-05-31 10:10:00',
    'https://picsum.photos/315',
    'Fuinhas e hipopótamos juntos',
    'Seu hipopótamo e sua fuinha podem se melhores amigos.',
    '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repudiandae molestias, itaque inventore eius consequatur possimus delectus recusandae quaerat ratione doloribus corporis. At, repellat accusantium. Iusto quidem quis voluptatibus provident dolor?</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis ipsum quasi cupiditate neque, voluptas voluptate nam nostrum facilis aspernatur esse saepe expedita cumque animi consequatur ab odio? Ipsum, omnis ducimus.</p><img class="flush" src="https://picsum.photos/400/200" alt="imagem aleatória"><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptates incidunt officia id doloribus dicta saepe atque ab ullam nisi inventore quas libero, rem a eveniet assumenda ex quibusdam illo maiores?</p><h4>Lista de links:</h4><ul><li><a href="http://luferat.net/">Site do fessô</a></li><li><a href="http://github.com/luferat">GitHub do fessô</a></li></ul><p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ullam, exercitationem commodi!</p><p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nam, iusto eveniet? Harum nulla neque iusto, cumque similique voluptate doloremque quos totam repellendus omnis, assumenda a aperiam molestiae, beatae blanditiis quod.</p>',
    '3'
);

-- Cria tabela de relacionamento artigo <-> categorias
CREATE TABLE art_cat (
    art_cat_id INT PRIMARY KEY AUTO_INCREMENT,
    article INT NOT NULL,
    category INT NOT NULL,
    FOREIGN KEY (article) REFERENCES articles (art_id),
    FOREIGN KEY (category) REFERENCES categories (cat_id)
);

-- Cria alguns relacionamentos "fake" entre artigo <-> categorias para os testes
INSERT INTO art_cat(article, category) VALUES 
('1', '1'),
('1', '2'),
('1', '3'),
('2', '2'),
('2', '3'),
('2', '6'),
('3', '2'),
('3', '3'),
('4', '4'),
('4', '5'),
('4', '6'),
('4', '1'),
('5', '1'),
('5', '3'),
('5', '4'),
('6', '6'),
('6', '3'),
('7', '4'),
('8', '1'),
('8', '2'),
('8', '3'),
('8', '4'),
('8', '5'),
('9', '1'),
('9', '6'),
('10', '2'),
('10', '4'),
('11', '2'),
('11', '3'),
('11', '4'),
('12', '3'),
('13', '1'),
('13', '5'),
('13', '6'),
('13', '4'),
('14', '3'),
('14', '4'),
('14', '6'),
('15', '1'),
('15', '2'),
('16', '3'),
('16', '4'),
('16', '5'),
('16', '6');

-- Altera estrutura da tabela "articles" para receber a seção "Sobre"
ALTER TABLE `articles` CHANGE
`art_status` `art_status` ENUM('inativo', 'ativo', 'sobre') NOT NULL DEFAULT 'ativo';

-- Insere conteúdo da seção "Sobre"
INSERT INTO articles (
    art_id,
    art_date,
    art_image,
    art_title,
    art_intro,
    art_text,
    art_author,
    art_status
) VALUES 
(
    '17',
    '2021-07-30 10:40:00',
    'https://picsum.photos/314',
    'Sobre o site',
    'Saiba mais sobre este site, porque e para quê ele foi criado.',
    '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repudiandae molestias, itaque inventore eius consequatur possimus delectus recusandae quaerat ratione doloribus corporis. At, repellat accusantium. Iusto quidem quis voluptatibus provident dolor?</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis ipsum quasi cupiditate neque, voluptas voluptate nam nostrum facilis aspernatur esse saepe expedita cumque animi consequatur ab odio? Ipsum, omnis ducimus.</p><img class="flush" src="https://picsum.photos/400/200" alt="imagem aleatória"><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptates incidunt officia id doloribus dicta saepe atque ab ullam nisi inventore quas libero, rem a eveniet assumenda ex quibusdam illo maiores?</p><h4>Lista de links:</h4><ul><li><a href="http://luferat.net/">Site do fessô</a></li><li><a href="http://github.com/luferat">GitHub do fessô</a></li></ul><p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ullam, exercitationem commodi!</p><p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nam, iusto eveniet? Harum nulla neque iusto, cumque similique voluptate doloremque quos totam repellendus omnis, assumenda a aperiam molestiae, beatae blanditiis quod.</p>',
    '1',
    'sobre'
),
(
    '18',
    '2021-07-30 10:30:00',
    'https://picsum.photos/315',
    'Quem faz',
    'Quem fez este site? Quais nossos objetivos, inspirações e aspirações.',
    '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repudiandae molestias, itaque inventore eius consequatur possimus delectus recusandae quaerat ratione doloribus corporis. At, repellat accusantium. Iusto quidem quis voluptatibus provident dolor?</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis ipsum quasi cupiditate neque, voluptas voluptate nam nostrum facilis aspernatur esse saepe expedita cumque animi consequatur ab odio? Ipsum, omnis ducimus.</p><img class="flush" src="https://picsum.photos/400/200" alt="imagem aleatória"><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptates incidunt officia id doloribus dicta saepe atque ab ullam nisi inventore quas libero, rem a eveniet assumenda ex quibusdam illo maiores?</p><h4>Lista de links:</h4><ul><li><a href="http://luferat.net/">Site do fessô</a></li><li><a href="http://github.com/luferat">GitHub do fessô</a></li></ul><p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ullam, exercitationem commodi!</p><p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nam, iusto eveniet? Harum nulla neque iusto, cumque similique voluptate doloremque quos totam repellendus omnis, assumenda a aperiam molestiae, beatae blanditiis quod.</p>',
    '1',
    'sobre'
);

-- Insere conteúdo da seção "Sobre"
INSERT INTO articles (
    art_id,
    art_date,
    art_image,
    art_title,
    art_intro,
    art_text,
    art_author,
    art_status
) VALUES 
(
    '19',
    '2021-07-30 10:20:00',
    'https://picsum.photos/314',
    'Sobre a privacidade',
    'Como cuidamos de seus dados, da sua segurança e privacidade.',
    '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repudiandae molestias, itaque inventore eius consequatur possimus delectus recusandae quaerat ratione doloribus corporis. At, repellat accusantium. Iusto quidem quis voluptatibus provident dolor?</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis ipsum quasi cupiditate neque, voluptas voluptate nam nostrum facilis aspernatur esse saepe expedita cumque animi consequatur ab odio? Ipsum, omnis ducimus.</p><img class="flush" src="https://picsum.photos/400/200" alt="imagem aleatória"><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptates incidunt officia id doloribus dicta saepe atque ab ullam nisi inventore quas libero, rem a eveniet assumenda ex quibusdam illo maiores?</p><h4>Lista de links:</h4><ul><li><a href="http://luferat.net/">Site do fessô</a></li><li><a href="http://github.com/luferat">GitHub do fessô</a></li></ul><p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ullam, exercitationem commodi!</p><p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nam, iusto eveniet? Harum nulla neque iusto, cumque similique voluptate doloremque quos totam repellendus omnis, assumenda a aperiam molestiae, beatae blanditiis quod.</p>',
    '1',
    'sobre'
),
(
    '20',
    '2021-07-30 10:10:00',
    'https://picsum.photos/315',
    'Sobre os cookies',
    'O que são os cookies, para que servem e porque você deve aceitá-los para usar o site.',
    '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repudiandae molestias, itaque inventore eius consequatur possimus delectus recusandae quaerat ratione doloribus corporis. At, repellat accusantium. Iusto quidem quis voluptatibus provident dolor?</p><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Reiciendis ipsum quasi cupiditate neque, voluptas voluptate nam nostrum facilis aspernatur esse saepe expedita cumque animi consequatur ab odio? Ipsum, omnis ducimus.</p><img class="flush" src="https://picsum.photos/400/200" alt="imagem aleatória"><p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptates incidunt officia id doloribus dicta saepe atque ab ullam nisi inventore quas libero, rem a eveniet assumenda ex quibusdam illo maiores?</p><h4>Lista de links:</h4><ul><li><a href="http://luferat.net/">Site do fessô</a></li><li><a href="http://github.com/luferat">GitHub do fessô</a></li></ul><p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ullam, exercitationem commodi!</p><p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nam, iusto eveniet? Harum nulla neque iusto, cumque similique voluptate doloremque quos totam repellendus omnis, assumenda a aperiam molestiae, beatae blanditiis quod.</p>',
    '1',
    'sobre'
);