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

  CONSTRAINT pk_residencia PRIMARY KEY (id)
);

