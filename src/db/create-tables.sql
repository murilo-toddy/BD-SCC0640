CREATE TABLE residencia (
  id               INT          GENERATED ALWAYS AS IDENTITY,
  aluguel          MONEY        NOT NULL,
  coletividade     BOOLEAN      NOT NULL,
  estado           VARCHAR(2)   NOT NULL,
  cidade           VARCHAR(50)  NOT NULL,
  cep              VARCHAR(8)   NOT NULL,
  endereço         VARCHAR(100) NOT NULL,
  n_quartos        INT          NOT NULL,
  n_banheiros      INT          NOT NULL,
  area_interna     INT          NOT NULL,
  area_externa     INT,
  infos_adicionais VARCHAR,

  CONSTRAINT pk_residencia PRIMARY KEY(id),
  CONSTRAINT cep_number CHECK(cep ~ '^\d\+$')
);

CREATE TABLE imovel (
  id             INT,
  valor_venda    MONEY   NOT NULL,
  condominio     MONEY,
  aceita_animais BOOLEAN NOT NULL,

  CONSTRAINT pk_imovel PRIMARY KEY(id),
  CONSTRAINT fk_imovel_residencia FOREIGN KEY(id)
                                  REFERENCES residencia(id)
                                  ON DELETE CASCADE
);

CREATE TABLE moradia (
  id               INT,
  n_moradores      INT NOT NULL,
  n_colegas_quarto INT NOT NULL,
  n_animais        INT NOT NULL,
  n_total_vagas    INT NOT NULL,

  CONSTRAINT pk_moradia PRIMARY KEY (id),
  CONSTRAINT fk_moradia_residencia FOREIGN KEY (id)
                                   REFERENCES residencia(id)
                                   ON DELETE CASCADE
);

CREATE TABLE festa (
  id                INT         GENERATED ALWAYS AS IDENTITY,
  data              DATE        NOT NULL,
  horario           TIME        NOT NULL,
  nome              VARCHAR(50) NOT NULL,
  moradia           INT         NOT NULL,
  preço             MONEY       NOT NULL,
  n_ingressos_total INT         NOT NULL,
  n_disponivel      INT         NOT NULL,  -- was this deleted?
  open_bar          VARCHAR,

  CONSTRAINT pk_festa PRIMARY KEY(id),
  CONSTRAINT sk_festa UNIQUE(data, horario, nome, moradia),
  CONSTRAINT fk_festa_moradia FOREIGN KEY(moradia)
                              REFERENCES moradia(id)
                              ON DELETE CASCADE
);

CREATE TABLE pessoa (
  CPF        VARCHAR(11),
  RG         VARCHAR(12) NOT NULL,
  nome       VARCHAR(75) NOT NULL,
  nascimento DATE        NOT NULL,

  CONSTRAINT CPF_number CHECK(CPF ~ '^\d\+$'),
  CONSTRAINT RG_number CHECK(RG ~ '^\d\+$'),
  CONSTRAINT pk_pessoa PRIMARY KEY(CPF),
  CONSTRAINT sk_pessoa UNIQUE(CPF),
);

CREATE TABLE atuacao (
  CPF     VARCHAR(11),
  atuacao VARCHAR(10),

  CONSTRAINT PRIMARY KEY(CPF, atuacao),
  CONSTRAINT fk_atuacao_pessoa FOREIGN KEY(CPF)
                               REFERENCES pessoa(CPF)
                               ON DELETE CASCADE
);

CREATE TABLE aluno (
  CPF                VARCHAR(11),
  n_indicacoes       INT,
  procurando_moradia BOOLEAN,
  procurando_imovel  BOOLEAN,

  CONSTRAINT PRIMARY KEY(CPF),
  CONSTRAINT fk_aluno_pessoa FOREIGN KEY(CPF)
                               REFERENCES pessoa(CPF)
                               ON DELETE CASCADE
);

CREATE TABLE professor (
  CPF          VARCHAR(11),
  area_atuacao VARCHAR,

  CONSTRAINT PRIMARY KEY(CPF),
  CONSTRAINT fk_professor_pessoa FOREIGN KEY(CPF)
                               REFERENCES pessoa(CPF)
                               ON DELETE CASCADE
);

CREATE TABLE orienta (
  professor VARCHAR(11),
  aluno     VARCHAR(11),

  CONSTRAINT PRIMARY KEY(professor, aluno),
  CONSTRAINT fk_orienta_professor FOREIGN KEY(professor)
                                  REFERENCES professor(CPF)
                                  ON DELETE CASCADE,
  CONSTRAINT fk_orienta_aluno FOREIGN KEY(aluno)
                              REFERENCES aluno(CPF)
                              ON DELETE CASCADE
);

CREATE TYPE CATEGORIA_UNIVERSIDADE AS ENUM ('pública', 'privada');
CREATE TABLE campus (
  id                     INT          GENERATED ALWAYS AS IDENTITY,
  CNPJ_universidade      VARCHAR(14)            NOT NULL,
  nome_campus            VARCHAR(50)            NOT NULL,
  cidade                 VARCHAR(50)            NOT NULL,
  nome_universidade      VARCHAR(50)            NOT NULL,
  categoria_universidade CATEGORIA_UNIVERSIDADE NOT NULL,
  estado                 VARCHAR(2)             NOT NULL,
  cep                    VARCHAR(8)             NOT NULL,
  endereço               VARCHAR(100)           NOT NULL,

  CONSTRAINT pk_campus PRIMARY KEY(id),
  CONSTRAINT sk_campus UNIQUE(CNPJ_universidade, nome_campus, cidade),
  CONSTRAINT CNPJ_universidade_number CHECK(CNPJ_universidade ~ '^\d\+$'),
  CONSTRAINT cep_number CHECK(cep ~ '^\d\+$')
);
