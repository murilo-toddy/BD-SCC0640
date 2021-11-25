CREATE TABLE residencia (
  id               INT          GENERATED ALWAYS AS IDENTITY,
  aluguel          MONEY        NOT NULL,
  coletividade     BOOLEAN      NOT NULL,
  estado           VARCHAR(2)   NOT NULL,
  cidade           VARCHAR(50)  NOT NULL,
  cep              NUMERIC(8,0) NOT NULL,
  endereço         VARCHAR(100) NOT NULL,
  n_quartos        INT          NOT NULL,
  n_banheiros      INT          NOT NULL,
  area_interna     INT          NOT NULL,
  area_externa     INT,
  infos_adicionais VARCHAR,

  CONSTRAINT pk_residencia PRIMARY KEY(id)
);

CREATE TABLE imovel (
  id_residencia  INT,
  valor_venda    MONEY   NOT NULL,
  condominio     MONEY,
  aceita_animais BOOLEAN NOT NULL,

  CONSTRAINT pk_imovel PRIMARY KEY(id_residencia),
  CONSTRAINT fk_residencia FOREIGN KEY(id_residencia)
                           REFERENCES residencia(id)
                           ON DELETE CASCADE
);

CREATE TABLE moradia (
  id_residencia    INT,
  n_moradores      INT NOT NULL,
  n_colegas_quarto INT NOT NULL,
  n_animais        INT NOT NULL,
  n_total_vagas    INT NOT NULL,

  CONSTRAINT pk_imovel PRIMARY KEY (id_residencia),
  CONSTRAINT fk_residencia FOREIGN KEY (id_residencia)
                           REFERENCES residencia(id)
                           ON DELETE CASCADE
);

