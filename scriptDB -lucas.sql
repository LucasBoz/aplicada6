--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5beta2
-- Dumped by pg_dump version 9.5beta2

-- Started on 2015-11-24 16:52:10

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 207 (class 3079 OID 12355)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2272 (class 0 OID 0)
-- Dependencies: 207
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 187 (class 1259 OID 16739)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE cliente (
    idcliente integer NOT NULL,
    nome character varying NOT NULL,
    cpf character varying,
    rg character varying,
    logradouro character varying,
    numero integer,
    bairro character varying,
    cidade character varying,
    estado character varying,
    cep character varying
);


ALTER TABLE cliente OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 16737)
-- Name: cliente_idcliente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cliente_idcliente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cliente_idcliente_seq OWNER TO postgres;

--
-- TOC entry 2273 (class 0 OID 0)
-- Dependencies: 186
-- Name: cliente_idcliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cliente_idcliente_seq OWNED BY cliente.idcliente;


--
-- TOC entry 197 (class 1259 OID 16810)
-- Name: compra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE compra (
    idcompra integer NOT NULL,
    descricao character varying NOT NULL,
    datac character varying,
    valor double precision,
    fornecedor integer
);


ALTER TABLE compra OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 16808)
-- Name: compra_idcompra_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE compra_idcompra_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE compra_idcompra_seq OWNER TO postgres;

--
-- TOC entry 2274 (class 0 OID 0)
-- Dependencies: 196
-- Name: compra_idcompra_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE compra_idcompra_seq OWNED BY compra.idcompra;


--
-- TOC entry 195 (class 1259 OID 16797)
-- Name: fornecedor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE fornecedor (
    idfornecedor integer NOT NULL,
    razao_social character varying NOT NULL,
    cnpj character varying NOT NULL,
    logradouro character varying,
    numero character varying,
    bairro character varying,
    cidade character varying,
    estado character varying,
    cep character varying
);


ALTER TABLE fornecedor OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 16795)
-- Name: fornecedor_idfornecedor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE fornecedor_idfornecedor_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE fornecedor_idfornecedor_seq OWNER TO postgres;

--
-- TOC entry 2275 (class 0 OID 0)
-- Dependencies: 194
-- Name: fornecedor_idfornecedor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE fornecedor_idfornecedor_seq OWNED BY fornecedor.idfornecedor;


--
-- TOC entry 201 (class 1259 OID 16844)
-- Name: itemcompra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE itemcompra (
    iditemcompra integer NOT NULL,
    compra integer,
    produto integer,
    quantidade integer NOT NULL,
    valor double precision NOT NULL
);


ALTER TABLE itemcompra OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16842)
-- Name: itemcompra_iditemcompra_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE itemcompra_iditemcompra_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE itemcompra_iditemcompra_seq OWNER TO postgres;

--
-- TOC entry 2276 (class 0 OID 0)
-- Dependencies: 200
-- Name: itemcompra_iditemcompra_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE itemcompra_iditemcompra_seq OWNED BY itemcompra.iditemcompra;


--
-- TOC entry 199 (class 1259 OID 16826)
-- Name: itemservico; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE itemservico (
    iditemservico integer NOT NULL,
    quantidade integer,
    valor double precision,
    idservico integer,
    idproduto integer,
    idvenda integer
);


ALTER TABLE itemservico OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16824)
-- Name: itemservico_iditemservico_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE itemservico_iditemservico_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE itemservico_iditemservico_seq OWNER TO postgres;

--
-- TOC entry 2277 (class 0 OID 0)
-- Dependencies: 198
-- Name: itemservico_iditemservico_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE itemservico_iditemservico_seq OWNED BY itemservico.iditemservico;


--
-- TOC entry 205 (class 1259 OID 16878)
-- Name: itemvenda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE itemvenda (
    iditemvenda integer NOT NULL,
    idvenda integer,
    idproduto integer,
    quantidade integer NOT NULL,
    valor double precision NOT NULL
);


ALTER TABLE itemvenda OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16876)
-- Name: itemvenda_iditemvenda_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE itemvenda_iditemvenda_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE itemvenda_iditemvenda_seq OWNER TO postgres;

--
-- TOC entry 2278 (class 0 OID 0)
-- Dependencies: 204
-- Name: itemvenda_iditemvenda_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE itemvenda_iditemvenda_seq OWNED BY itemvenda.iditemvenda;


--
-- TOC entry 181 (class 1259 OID 16701)
-- Name: marca; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE marca (
    idmarca integer NOT NULL,
    descricao character varying
);


ALTER TABLE marca OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 16699)
-- Name: marca_idmarca_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE marca_idmarca_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE marca_idmarca_seq OWNER TO postgres;

--
-- TOC entry 2279 (class 0 OID 0)
-- Dependencies: 180
-- Name: marca_idmarca_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE marca_idmarca_seq OWNED BY marca.idmarca;


--
-- TOC entry 183 (class 1259 OID 16712)
-- Name: modelo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE modelo (
    idmodelo integer NOT NULL,
    descricao character varying NOT NULL,
    idmarca integer NOT NULL
);


ALTER TABLE modelo OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 16710)
-- Name: modelo_idmodelo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE modelo_idmodelo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE modelo_idmodelo_seq OWNER TO postgres;

--
-- TOC entry 2280 (class 0 OID 0)
-- Dependencies: 182
-- Name: modelo_idmodelo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE modelo_idmodelo_seq OWNED BY modelo.idmodelo;


--
-- TOC entry 191 (class 1259 OID 16775)
-- Name: produto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE produto (
    idproduto integer NOT NULL,
    descricao character varying NOT NULL,
    valor double precision,
    quantidade integer
);


ALTER TABLE produto OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 16773)
-- Name: produto_idproduto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE produto_idproduto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE produto_idproduto_seq OWNER TO postgres;

--
-- TOC entry 2281 (class 0 OID 0)
-- Dependencies: 190
-- Name: produto_idproduto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE produto_idproduto_seq OWNED BY produto.idproduto;


--
-- TOC entry 193 (class 1259 OID 16786)
-- Name: servico; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE servico (
    idservico integer NOT NULL,
    descricao character varying NOT NULL,
    valor double precision
);


ALTER TABLE servico OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 16784)
-- Name: servico_idservico_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE servico_idservico_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE servico_idservico_seq OWNER TO postgres;

--
-- TOC entry 2282 (class 0 OID 0)
-- Dependencies: 192
-- Name: servico_idservico_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE servico_idservico_seq OWNED BY servico.idservico;


--
-- TOC entry 206 (class 1259 OID 16907)
-- Name: tipo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tipo (
    idtipo integer,
    nome character varying
);


ALTER TABLE tipo OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 16728)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE usuario (
    idusuario integer NOT NULL,
    login character varying NOT NULL,
    senha character varying NOT NULL
);


ALTER TABLE usuario OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 16726)
-- Name: usuario_idusuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE usuario_idusuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE usuario_idusuario_seq OWNER TO postgres;

--
-- TOC entry 2283 (class 0 OID 0)
-- Dependencies: 184
-- Name: usuario_idusuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE usuario_idusuario_seq OWNED BY usuario.idusuario;


--
-- TOC entry 189 (class 1259 OID 16754)
-- Name: veiculo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE veiculo (
    idveiculo integer NOT NULL,
    placa character varying NOT NULL,
    chassi character varying NOT NULL,
    idmodelo integer,
    idcliente integer,
    cor character varying NOT NULL
);


ALTER TABLE veiculo OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 16752)
-- Name: veiculo_idveiculo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE veiculo_idveiculo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE veiculo_idveiculo_seq OWNER TO postgres;

--
-- TOC entry 2284 (class 0 OID 0)
-- Dependencies: 188
-- Name: veiculo_idveiculo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE veiculo_idveiculo_seq OWNED BY veiculo.idveiculo;


--
-- TOC entry 203 (class 1259 OID 16862)
-- Name: venda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE venda (
    idvenda integer NOT NULL,
    descricao character varying NOT NULL,
    datav character varying,
    valor double precision,
    idveiculo integer,
    idcliente integer
);


ALTER TABLE venda OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16860)
-- Name: venda_idvenda_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE venda_idvenda_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE venda_idvenda_seq OWNER TO postgres;

--
-- TOC entry 2285 (class 0 OID 0)
-- Dependencies: 202
-- Name: venda_idvenda_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE venda_idvenda_seq OWNED BY venda.idvenda;


--
-- TOC entry 2071 (class 2604 OID 16742)
-- Name: idcliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cliente ALTER COLUMN idcliente SET DEFAULT nextval('cliente_idcliente_seq'::regclass);


--
-- TOC entry 2076 (class 2604 OID 16813)
-- Name: idcompra; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY compra ALTER COLUMN idcompra SET DEFAULT nextval('compra_idcompra_seq'::regclass);


--
-- TOC entry 2075 (class 2604 OID 16800)
-- Name: idfornecedor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fornecedor ALTER COLUMN idfornecedor SET DEFAULT nextval('fornecedor_idfornecedor_seq'::regclass);


--
-- TOC entry 2078 (class 2604 OID 16847)
-- Name: iditemcompra; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY itemcompra ALTER COLUMN iditemcompra SET DEFAULT nextval('itemcompra_iditemcompra_seq'::regclass);


--
-- TOC entry 2077 (class 2604 OID 16829)
-- Name: iditemservico; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY itemservico ALTER COLUMN iditemservico SET DEFAULT nextval('itemservico_iditemservico_seq'::regclass);


--
-- TOC entry 2080 (class 2604 OID 16881)
-- Name: iditemvenda; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY itemvenda ALTER COLUMN iditemvenda SET DEFAULT nextval('itemvenda_iditemvenda_seq'::regclass);


--
-- TOC entry 2068 (class 2604 OID 16704)
-- Name: idmarca; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY marca ALTER COLUMN idmarca SET DEFAULT nextval('marca_idmarca_seq'::regclass);


--
-- TOC entry 2069 (class 2604 OID 16715)
-- Name: idmodelo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modelo ALTER COLUMN idmodelo SET DEFAULT nextval('modelo_idmodelo_seq'::regclass);


--
-- TOC entry 2073 (class 2604 OID 16778)
-- Name: idproduto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto ALTER COLUMN idproduto SET DEFAULT nextval('produto_idproduto_seq'::regclass);


--
-- TOC entry 2074 (class 2604 OID 16789)
-- Name: idservico; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY servico ALTER COLUMN idservico SET DEFAULT nextval('servico_idservico_seq'::regclass);


--
-- TOC entry 2070 (class 2604 OID 16731)
-- Name: idusuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario ALTER COLUMN idusuario SET DEFAULT nextval('usuario_idusuario_seq'::regclass);


--
-- TOC entry 2072 (class 2604 OID 16757)
-- Name: idveiculo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY veiculo ALTER COLUMN idveiculo SET DEFAULT nextval('veiculo_idveiculo_seq'::regclass);


--
-- TOC entry 2079 (class 2604 OID 16865)
-- Name: idvenda; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venda ALTER COLUMN idvenda SET DEFAULT nextval('venda_idvenda_seq'::regclass);


--
-- TOC entry 2245 (class 0 OID 16739)
-- Dependencies: 187
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY cliente (idcliente, nome, cpf, rg, logradouro, numero, bairro, cidade, estado, cep) FROM stdin;
1	Jose	23423423423423	1231231	Casa	123	Centro	Foz do Iguaçu	Parana	85851250
\.


--
-- TOC entry 2286 (class 0 OID 0)
-- Dependencies: 186
-- Name: cliente_idcliente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cliente_idcliente_seq', 1, true);


--
-- TOC entry 2255 (class 0 OID 16810)
-- Dependencies: 197
-- Data for Name: compra; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY compra (idcompra, descricao, datac, valor, fornecedor) FROM stdin;
\.


--
-- TOC entry 2287 (class 0 OID 0)
-- Dependencies: 196
-- Name: compra_idcompra_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('compra_idcompra_seq', 1, false);


--
-- TOC entry 2253 (class 0 OID 16797)
-- Dependencies: 195
-- Data for Name: fornecedor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY fornecedor (idfornecedor, razao_social, cnpj, logradouro, numero, bairro, cidade, estado, cep) FROM stdin;
1	asdasdasd	asdasd	asdasd	\N	asdasd	asdasd	asdas	asdasdas
\.


--
-- TOC entry 2288 (class 0 OID 0)
-- Dependencies: 194
-- Name: fornecedor_idfornecedor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('fornecedor_idfornecedor_seq', 1, true);


--
-- TOC entry 2259 (class 0 OID 16844)
-- Dependencies: 201
-- Data for Name: itemcompra; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY itemcompra (iditemcompra, compra, produto, quantidade, valor) FROM stdin;
\.


--
-- TOC entry 2289 (class 0 OID 0)
-- Dependencies: 200
-- Name: itemcompra_iditemcompra_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('itemcompra_iditemcompra_seq', 1, false);


--
-- TOC entry 2257 (class 0 OID 16826)
-- Dependencies: 199
-- Data for Name: itemservico; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY itemservico (iditemservico, quantidade, valor, idservico, idproduto, idvenda) FROM stdin;
1	3	125	1	1	1
\.


--
-- TOC entry 2290 (class 0 OID 0)
-- Dependencies: 198
-- Name: itemservico_iditemservico_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('itemservico_iditemservico_seq', 2, true);


--
-- TOC entry 2263 (class 0 OID 16878)
-- Dependencies: 205
-- Data for Name: itemvenda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY itemvenda (iditemvenda, idvenda, idproduto, quantidade, valor) FROM stdin;
1	1	1	3	125
\.


--
-- TOC entry 2291 (class 0 OID 0)
-- Dependencies: 204
-- Name: itemvenda_iditemvenda_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('itemvenda_iditemvenda_seq', 1, true);


--
-- TOC entry 2239 (class 0 OID 16701)
-- Dependencies: 181
-- Data for Name: marca; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY marca (idmarca, descricao) FROM stdin;
1	Testando
\.


--
-- TOC entry 2292 (class 0 OID 0)
-- Dependencies: 180
-- Name: marca_idmarca_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('marca_idmarca_seq', 2, true);


--
-- TOC entry 2241 (class 0 OID 16712)
-- Dependencies: 183
-- Data for Name: modelo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY modelo (idmodelo, descricao, idmarca) FROM stdin;
1	teste	1
\.


--
-- TOC entry 2293 (class 0 OID 0)
-- Dependencies: 182
-- Name: modelo_idmodelo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('modelo_idmodelo_seq', 1, true);


--
-- TOC entry 2249 (class 0 OID 16775)
-- Dependencies: 191
-- Data for Name: produto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY produto (idproduto, descricao, valor, quantidade) FROM stdin;
2	asdasd	14	14
1	Caixa de fosforo	125	3
\.


--
-- TOC entry 2294 (class 0 OID 0)
-- Dependencies: 190
-- Name: produto_idproduto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('produto_idproduto_seq', 2, true);


--
-- TOC entry 2251 (class 0 OID 16786)
-- Dependencies: 193
-- Data for Name: servico; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY servico (idservico, descricao, valor) FROM stdin;
1	Testando a parada	123
\.


--
-- TOC entry 2295 (class 0 OID 0)
-- Dependencies: 192
-- Name: servico_idservico_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('servico_idservico_seq', 1, true);


--
-- TOC entry 2264 (class 0 OID 16907)
-- Dependencies: 206
-- Data for Name: tipo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tipo (idtipo, nome) FROM stdin;
\.


--
-- TOC entry 2243 (class 0 OID 16728)
-- Dependencies: 185
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY usuario (idusuario, login, senha) FROM stdin;
1	admin	admin
\.


--
-- TOC entry 2296 (class 0 OID 0)
-- Dependencies: 184
-- Name: usuario_idusuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('usuario_idusuario_seq', 1, true);


--
-- TOC entry 2247 (class 0 OID 16754)
-- Dependencies: 189
-- Data for Name: veiculo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY veiculo (idveiculo, placa, chassi, idmodelo, idcliente, cor) FROM stdin;
1	1234576	1231	1	1	rosa
\.


--
-- TOC entry 2297 (class 0 OID 0)
-- Dependencies: 188
-- Name: veiculo_idveiculo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('veiculo_idveiculo_seq', 1, true);


--
-- TOC entry 2261 (class 0 OID 16862)
-- Dependencies: 203
-- Data for Name: venda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY venda (idvenda, descricao, datav, valor, idveiculo, idcliente) FROM stdin;
1	teste	\N	123	1	1
2	jose	\N	100	1	1
\.


--
-- TOC entry 2298 (class 0 OID 0)
-- Dependencies: 202
-- Name: venda_idvenda_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('venda_idvenda_seq', 2, true);


--
-- TOC entry 2088 (class 2606 OID 16749)
-- Name: cliente_cpf_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_cpf_key UNIQUE (cpf);


--
-- TOC entry 2090 (class 2606 OID 16747)
-- Name: cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (idcliente);


--
-- TOC entry 2092 (class 2606 OID 16751)
-- Name: cliente_rg_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cliente
    ADD CONSTRAINT cliente_rg_key UNIQUE (rg);


--
-- TOC entry 2104 (class 2606 OID 16818)
-- Name: compra_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY compra
    ADD CONSTRAINT compra_pkey PRIMARY KEY (idcompra);


--
-- TOC entry 2100 (class 2606 OID 16807)
-- Name: fornecedor_cnpj_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fornecedor
    ADD CONSTRAINT fornecedor_cnpj_key UNIQUE (cnpj);


--
-- TOC entry 2102 (class 2606 OID 16805)
-- Name: fornecedor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fornecedor
    ADD CONSTRAINT fornecedor_pkey PRIMARY KEY (idfornecedor);


--
-- TOC entry 2108 (class 2606 OID 16849)
-- Name: itemcompra_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY itemcompra
    ADD CONSTRAINT itemcompra_pkey PRIMARY KEY (iditemcompra);


--
-- TOC entry 2106 (class 2606 OID 16831)
-- Name: itemservico_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY itemservico
    ADD CONSTRAINT itemservico_pkey PRIMARY KEY (iditemservico);


--
-- TOC entry 2112 (class 2606 OID 16883)
-- Name: itemvenda_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY itemvenda
    ADD CONSTRAINT itemvenda_pkey PRIMARY KEY (iditemvenda);


--
-- TOC entry 2082 (class 2606 OID 16709)
-- Name: marca_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY marca
    ADD CONSTRAINT marca_pkey PRIMARY KEY (idmarca);


--
-- TOC entry 2084 (class 2606 OID 16720)
-- Name: modelo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modelo
    ADD CONSTRAINT modelo_pkey PRIMARY KEY (idmodelo);


--
-- TOC entry 2096 (class 2606 OID 16783)
-- Name: produto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (idproduto);


--
-- TOC entry 2098 (class 2606 OID 16794)
-- Name: servico_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY servico
    ADD CONSTRAINT servico_pkey PRIMARY KEY (idservico);


--
-- TOC entry 2086 (class 2606 OID 16736)
-- Name: usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (idusuario);


--
-- TOC entry 2094 (class 2606 OID 16762)
-- Name: veiculo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY veiculo
    ADD CONSTRAINT veiculo_pkey PRIMARY KEY (idveiculo);


--
-- TOC entry 2110 (class 2606 OID 16870)
-- Name: venda_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venda
    ADD CONSTRAINT venda_pkey PRIMARY KEY (idvenda);


--
-- TOC entry 2116 (class 2606 OID 16819)
-- Name: compra_fornecedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY compra
    ADD CONSTRAINT compra_fornecedor_fkey FOREIGN KEY (fornecedor) REFERENCES fornecedor(idfornecedor);


--
-- TOC entry 2119 (class 2606 OID 16850)
-- Name: itemcompra_compra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY itemcompra
    ADD CONSTRAINT itemcompra_compra_fkey FOREIGN KEY (compra) REFERENCES compra(idcompra);


--
-- TOC entry 2120 (class 2606 OID 16855)
-- Name: itemcompra_produto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY itemcompra
    ADD CONSTRAINT itemcompra_produto_fkey FOREIGN KEY (produto) REFERENCES produto(idproduto);


--
-- TOC entry 2117 (class 2606 OID 16832)
-- Name: itemservico_produto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY itemservico
    ADD CONSTRAINT itemservico_produto_fkey FOREIGN KEY (idproduto) REFERENCES produto(idproduto);


--
-- TOC entry 2118 (class 2606 OID 16837)
-- Name: itemservico_servico_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY itemservico
    ADD CONSTRAINT itemservico_servico_fkey FOREIGN KEY (idservico) REFERENCES servico(idservico);


--
-- TOC entry 2123 (class 2606 OID 16889)
-- Name: itemvenda_produto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY itemvenda
    ADD CONSTRAINT itemvenda_produto_fkey FOREIGN KEY (idproduto) REFERENCES produto(idproduto);


--
-- TOC entry 2122 (class 2606 OID 16884)
-- Name: itemvenda_venda_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY itemvenda
    ADD CONSTRAINT itemvenda_venda_fkey FOREIGN KEY (idvenda) REFERENCES venda(idvenda);


--
-- TOC entry 2113 (class 2606 OID 16721)
-- Name: modelo_idmarca_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY modelo
    ADD CONSTRAINT modelo_idmarca_fkey FOREIGN KEY (idmarca) REFERENCES marca(idmarca);


--
-- TOC entry 2115 (class 2606 OID 16768)
-- Name: veiculo_idcliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY veiculo
    ADD CONSTRAINT veiculo_idcliente_fkey FOREIGN KEY (idcliente) REFERENCES cliente(idcliente);


--
-- TOC entry 2114 (class 2606 OID 16763)
-- Name: veiculo_idmodelo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY veiculo
    ADD CONSTRAINT veiculo_idmodelo_fkey FOREIGN KEY (idmodelo) REFERENCES modelo(idmodelo);


--
-- TOC entry 2121 (class 2606 OID 16871)
-- Name: venda_veiculo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venda
    ADD CONSTRAINT venda_veiculo_fkey FOREIGN KEY (idveiculo) REFERENCES fornecedor(idfornecedor);


--
-- TOC entry 2271 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2015-11-24 16:52:11

--
-- PostgreSQL database dump complete
--

