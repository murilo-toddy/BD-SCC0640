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
  data_horario      TIMESTAMP   NOT NULL, -- Data e Horário viraram um campo só!!!!!
  nome              VARCHAR(50) NOT NULL,
  moradia           INT         NOT NULL,
  preço             MONEY       NOT NULL,
  n_ingressos_total INT         NOT NULL,
  n_disponivel      INT         NOT NULL,  -- was this deleted?
  open_bar          VARCHAR,

  CONSTRAINT pk_festa PRIMARY KEY(id),
  CONSTRAINT sk_festa UNIQUE(data_horario, nome, moradia),
  CONSTRAINT fk_festa_moradia FOREIGN KEY(moradia)
                              REFERENCES moradia(id)
                              ON DELETE CASCADE
);

CREATE TABLE pessoa (
  CPF        VARCHAR(11),
  RG         VARCHAR(12) NOT NULL,
  nome       VARCHAR(75) NOT NULL,
  nascimento DATE        NOT NULL,

  CONSTRAINT pk_pessoa PRIMARY KEY(CPF),
  CONSTRAINT sk_pessoa UNIQUE(RG)
);

CREATE TABLE ingresso (
  festa     INT,
  comprador VARCHAR(11),

  CONSTRAINT pk_presenca PRIMARY KEY(festa, comprador),
  CONSTRAINT fk_presenca_aluno FOREIGN KEY(festa)
                               REFERENCES festa(id)
                               ON DELETE CASCADE,
  CONSTRAINT fk_presenca_curso FOREIGN KEY(comprador)
                               REFERENCES pessoa(CPF)
                               ON DELETE CASCADE
);

CREATE TABLE atuacao (
  CPF     VARCHAR(11),
  atuacao VARCHAR(10),

  CONSTRAINT pk_atuacao PRIMARY KEY(CPF, atuacao),
  CONSTRAINT fk_atuacao_pessoa FOREIGN KEY(CPF)
                               REFERENCES pessoa(CPF)
                               ON DELETE CASCADE
);

CREATE TABLE aluno (
  CPF                VARCHAR(11),
  n_indicacoes       INT,
  procurando_moradia BOOLEAN,
  procurando_imovel  BOOLEAN,

  CONSTRAINT pk_aluno PRIMARY KEY(CPF),
  CONSTRAINT fk_aluno_pessoa FOREIGN KEY(CPF)
                               REFERENCES pessoa(CPF)
                               ON DELETE CASCADE
);

CREATE TABLE professor (
  CPF          VARCHAR(11),
  area_atuacao VARCHAR,

  CONSTRAINT pk_professor PRIMARY KEY(CPF),
  CONSTRAINT fk_professor_pessoa FOREIGN KEY(CPF)
                               REFERENCES pessoa(CPF)
                               ON DELETE CASCADE
);

CREATE TABLE orienta (
  professor VARCHAR(11),
  aluno     VARCHAR(11),

  CONSTRAINT pk_orienta PRIMARY KEY(professor, aluno),
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

CREATE TABLE oferecimento_curso (
  campus            INT,
  nome              VARCHAR(50),
  area_conhecimento VARCHAR(50),

  CONSTRAINT pk_oferecimento_curso PRIMARY KEY(campus, nome),
  CONSTRAINT fk_oferecimento_curso_campus FOREIGN KEY(campus)
                                          REFERENCES campus(id)
                                          ON DELETE CASCADE
);

CREATE TABLE cursando (
  aluno        VARCHAR(11),
  campus       INT,
  curso        VARCHAR(50),
  ano_ingresso DATE,

  CONSTRAINT pk_cursando PRIMARY KEY(aluno, campus, curso),
  CONSTRAINT fk_cursando_aluno FOREIGN KEY(aluno)
                               REFERENCES aluno(CPF)
                               ON DELETE CASCADE,
  CONSTRAINT fk_cursando_curso FOREIGN KEY(campus, curso)
                               REFERENCES oferecimento_curso(campus, nome)
                               ON DELETE CASCADE
);

CREATE TABLE trabalho (
  professor VARCHAR(11),
  campus    INT,
  curso     VARCHAR(50),

  CONSTRAINT pk_trabalho PRIMARY KEY(professor, campus, curso),
  CONSTRAINT fk_trabalho_professor FOREIGN KEY(professor)
                                   REFERENCES professor(CPF)
                                   ON DELETE CASCADE,
  CONSTRAINT fk_trabalho_curso FOREIGN KEY(campus, curso)
                               REFERENCES oferecimento_curso(campus, nome)
                               ON DELETE CASCADE
);

CREATE TABLE palestra (
  id           INT GENERATED ALWAYS AS IDENTITY,
  ministrante  VARCHAR(11) NOT NULL,
  nome         VARCHAR(50) NOT NULL,
  campus       INT NOT NULL,
  data_horario TIMESTAMP NOT NULL, -- Data e Horário viraram um campo só!!!!!
  tema         VARCHAR(50),

  CONSTRAINT pk_palestra PRIMARY KEY(id),
  CONSTRAINT sk_palestra UNIQUE(nome, campus, data_horario),
  CONSTRAINT fk_palestra_professor FOREIGN KEY(ministrante)
                                   REFERENCES professor(CPF)
                                   ON DELETE CASCADE,
  CONSTRAINT fk_palestra_campus FOREIGN KEY(campus)
                                REFERENCES campus(id)
                                ON DELETE CASCADE
);

CREATE TABLE presenca_marcada (
  aluno    VARCHAR(11),
  palestra INT,

  CONSTRAINT pk_presenca PRIMARY KEY(aluno, palestra),
  CONSTRAINT fk_presenca_aluno FOREIGN KEY(aluno)
                               REFERENCES aluno(CPF)
                               ON DELETE CASCADE,
  CONSTRAINT fk_presenca_curso FOREIGN KEY(palestra)
                               REFERENCES palestra(id)
                               ON DELETE CASCADE
);