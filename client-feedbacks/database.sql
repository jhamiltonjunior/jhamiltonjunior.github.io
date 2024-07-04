CREATE DATABASE IF NOT EXISTS client_feedback;

USE client_feedback;

CREATE TABLE admin (
    admin_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    cpf VARCHAR(11) NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at DATETIME NOT NULL DEFAULT NOW()
);

CREATE TABLE patient (
    patient_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    cpf VARCHAR(11) UNIQUE,
    created_date DATETIME NOT NULL DEFAULT NOW()
);

CREATE TABLE professional (
    professional_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    image VARCHAR(255) UNIQUE NOT NULL,
    created_date DATETIME NOT NULL DEFAULT NOW()
);

CREATE TABLE specialty (
  specialty_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL UNIQUE,
  created_date DATETIME NOT NULL DEFAULT NOW()
);

CREATE TABLE role_specialty (
  role_specialty_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,

  specialty_id INT NOT NULL,
  professional_id INT NOT NULL,
  
  FOREIGN KEY(specialty_id)
    REFERENCES specialty(specialty_id)
      ON UPDATE CASCADE
        ON DELETE CASCADE,

  FOREIGN KEY(professional_id)
    REFERENCES professional(professional_id)
      ON UPDATE CASCADE
        ON DELETE CASCADE,

    
    created_date DATETIME NOT NULL DEFAULT NOW()
);


CREATE TABLE grade (
    grade_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    
    service INT NOT NULL,
    punctuality INT NOT NULL,
    frontDesk INT NOT NULL,
    infrastructure INT NOT NULL,
    average INT NOT NULL,

    feedback VARCHAR(255) NOT NULL,

    patient_id INT NOT NULL,
    professional_id INT NOT NULL,
    specialty_id INT NOT NULL,

    FOREIGN KEY (patient_id) 
    REFERENCES patient(patient_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    FOREIGN KEY (professional_id) 
    REFERENCES professional(professional_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    FOREIGN KEY (specialty_id) 
    REFERENCES specialty(specialty_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    
    created_at DATE NOT NULL
);

SET character_set_client = utf8;
SET character_set_connection = utf8;
SET character_set_results = utf8;
SET collation_connection = utf8_general_ci;


INSERT INTO patient(name, cpf) VALUES ("Jose Hamilton Santos Junior", "97459422002");



INSERT INTO professional(name, cpf, image) VALUES (
    'Melissa Goncalves Silva',
    '72438512075',
    'fashion-gf3eef880e_640.jpg'
    );
INSERT INTO professional(name, cpf, image) VALUES (
    'Vitória Cavalcanti Carvalho',
    '92485428085',
    'hijab-g29ce69b70_640.jpg');
INSERT INTO professional(name, cpf, image) VALUES (
    'Aline Melo Almeida',
    '38697540011',
    'portrait-gd50060fea_640.jpg');
INSERT INTO professional(name, cpf, image) VALUES (
    'Douglas Correia Sousa',
    '77171107094',
    'beanie-g6a8e1501c_640.jpg');
INSERT INTO professional(name, cpf, image) VALUES (
    'Mateus Correia Souza',
    '89257217086',
    'beard-gd86ddd68b_640.jpg');
INSERT INTO professional(name, cpf, image) VALUES (
    'Beatriz Sousa Cunha',
    '14246808083',
    'woman-gb74b3a7db_640.jpg');
INSERT INTO professional(name, cpf, image) VALUES (
    'Letícia Alves Cavalcanti',
    '07023309063',
    'woman-g004b1a3ce_640.jpg');
INSERT INTO professional(name, cpf, image) VALUES (
    'Gabriela Costa Ribeiro',
    '12343982066',
    'woman-gd0a928835_640.jpg');


INSERT INTO specialty(name) VALUES ('Ortopedia');
INSERT INTO specialty(name) VALUES ('Dermatologia');
INSERT INTO specialty(name) VALUES ('Psiquiatria');
INSERT INTO specialty(name) VALUES ('Cardiologia');
INSERT INTO specialty(name) VALUES ('Odontologia');
INSERT INTO specialty(name) VALUES ('Pediatria');
INSERT INTO specialty(name) VALUES ('Urologia');



INSERT INTO role_specialty(specialty_id, professional_id) VALUES (1, 7);
INSERT INTO role_specialty(specialty_id, professional_id) VALUES (2, 6);
INSERT INTO role_specialty(specialty_id, professional_id) VALUES (3, 5);
INSERT INTO role_specialty(specialty_id, professional_id) VALUES (4, 6);
INSERT INTO role_specialty(specialty_id, professional_id) VALUES (5, 3);
INSERT INTO role_specialty(specialty_id, professional_id) VALUES (6, 2);
INSERT INTO role_specialty(specialty_id, professional_id) VALUES (7, 1);


INSERT INTO admin(name, cpf, password) VALUES (
    "Jose Hamilton Santos Junior",
    "97459422002",
    "827ccb0eea8a706c4c34a16891f84e7b"
    );


