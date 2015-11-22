CREATE DATABASE aplicada6; 
CREATE TABLE marca
(	idMarca serial PRIMARY KEY,
	descricao character varying
);

CREATE TABLE modelo 
(
	idmodelo serial PRIMARY KEY,
	descricao character varying NOT NULL,
	marca integer REFERENCES marca (id) NOT NULL 
);

CREATE TABLE usuario 
(
	idusuario serial PRIMARY KEY,
	login character varying NOT NULL,
	senha varchar NOT NULL
);

CREATE TABLE cliente 
(	idcliente serial PRIMARY KEY,
	nome character varying NOT NULL,
	cpf character varying UNIQUE,
	rg character varying UNIQUE,
	logradouro character varying,
	numero integer,
	bairro character varying,
	cidade character varying,
	estado character varying,
	cep character varying
);

CREATE TABLE veiculo (
	idveiculo serial PRIMARY KEY,
	placa character varying NOT NULL,
	chassi character varying NOT NULL,
	idmodelo integer REFERENCES modelo(id),
	idcliente integer REFERENCES cliente(id),
	cor character varying NOT NULL
);
 

CREATE TABLE produto 
(	idproduto serial PRIMARY KEY,
	descricao character varying NOT NULL,
	valor float,
	quantidade integer
);


CREATE TABLE servico
(	idservico serial PRIMARY KEY,
	descricao character varying NOT NULL,
	valor float
);
CREATE TABLE fornecedor
(	idfornecedor serial PRIMARY KEY,
	razao_social character varying NOT NULL,
	cnpj character varying UNIQUE NOT NULL,
	logradouro character varying ,
	numero character varying ,
	bairro character varying,
	cidade character varying,
	estado character varying,
	cep character varying
);

CREATE TABLE compra
(
  idcompra serial NOT NULL,
  descricao character varying NOT NULL,
  datac character varying,
  valor double precision,
  fornecedor integer,
  CONSTRAINT compra_pkey PRIMARY KEY (id),
  CONSTRAINT compra_fornecedor_fkey FOREIGN KEY (fornecedor)
      REFERENCES fornecedor (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE itemservico
(
  iditemservico serial NOT NULL,
  quantidade integer,
  valor double precision,
  servico integer,
  produto integer,
  CONSTRAINT itemservico_pkey PRIMARY KEY (id),
  CONSTRAINT itemservico_produto_fkey FOREIGN KEY (produto)
      REFERENCES produto (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT itemservico_servico_fkey FOREIGN KEY (servico)
      REFERENCES servico (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE itemcompra
(
	iditemcompra serial PRIMARY KEY,
	compra integer REFERENCES compra (id),
	produto integer REFERENCES produto (id),
	quantidade integer NOT NULL, 
	valor float NOT NULL
);

CREATE TABLE venda
(
  idvenda serial NOT NULL,
  descricao character varying NOT NULL,
  datac character varying,
  valor double precision,
  veiculo integer,
  CONSTRAINT venda_pkey PRIMARY KEY (id),
  CONSTRAINT venda_veiculo_fkey FOREIGN KEY (veiculo)
      REFERENCES fornecedor (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE itemvenda
(
	iditemvenda serial PRIMARY KEY,
	venda integer REFERENCES venda(id),
	produto integer REFERENCES produto (id),
	quantidade integer NOT NULL, 
	valor float NOT NULL
);
