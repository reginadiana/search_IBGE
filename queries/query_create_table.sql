-- Criando as tabelas
CREATE TABLE federatives (
  status VARCHAR(2) NOT NULL,
  code INT NOT NULL,
  title VARCHAR(60) NOT NULL,
  PRIMARY KEY (ID_federative)
);

CREATE TABLE counties (
  status VARCHAR(2) NOT NULL,
  code INT NOT NULL,
  title VARCHAR(60) NOT NULL,
  population INT NOT NULL,
  PRIMARY KEY (ID_county)
);
