CREATE TYPE BR_STATE AS ENUM (
    'AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF',
    'ES', 'GO', 'MA', 'MT', 'MS', 'MG', 'PA',
    'PB', 'PR', 'PE', 'PI', 'RJ', 'RN', 'RS',
    'RO', 'RR', 'SC', 'SP', 'SE', 'TO'
);

CREATE TABLE residencia (
    id               INT          GENERATED ALWAYS AS IDENTITY,
    aluguel          MONEY        NOT NULL,
    coletividade     BOOLEAN      NOT NULL,
    estado           BR_STATE     NOT NULL,
    cidade           VARCHAR(50)  NOT NULL,
    cep              CHAR(8)      NOT NULL,
    endereço         VARCHAR(100) NOT NULL,
    n_quartos        INT          NOT NULL,
    n_banheiros      INT          NOT NULL,
    area_interna     INT          NOT NULL,
    area_externa     INT,
    infos_adicionais VARCHAR,

    CONSTRAINT pk_residencia PRIMARY KEY(id),
    CONSTRAINT cep_number CHECK(cep ~ '^[0-9]{8}$'),
    CONSTRAINT validate_aluguel CHECK(aluguel::NUMERIC::INT > 0),
    CONSTRAINT validate_quartos CHECK(n_quartos > 0),
    CONSTRAINT validate_banheiros CHECK(n_banheiros > 0),
    CONSTRAINT validate_area CHECK(area_interna > 0 AND area_externa >= 0)
);

CREATE TABLE imovel (
    id             INT,
    valor_venda    MONEY   NOT NULL,
    condominio     MONEY,
    aceita_animais BOOLEAN NOT NULL,

    CONSTRAINT validate_venda CHECK (valor_venda::NUMERIC::INT > 0),
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

    CONSTRAINT validate_people CHECK (n_moradores >= 0 AND n_colegas_quarto >= 0),
    CONSTRAINT validate_animais CHECK (n_animais >= 0),
    CONSTRAINT validate_vagas CHECK (n_total_vagas >= 0),
    CONSTRAINT pk_moradia PRIMARY KEY (id),
    CONSTRAINT fk_moradia_residencia FOREIGN KEY (id)
                                     REFERENCES residencia(id)
                                     ON DELETE CASCADE
);

CREATE TABLE festa (
    id                INT         GENERATED ALWAYS AS IDENTITY,
    data_horario      TIMESTAMP   NOT NULL,
    nome              VARCHAR(50) NOT NULL,
    moradia           INT         NOT NULL,
    preço             MONEY       NOT NULL,
    n_ingressos_total INT         NOT NULL,
    open_bar          VARCHAR,

    CONSTRAINT validate_price CHECK (preço::NUMERIC::INT > 0),
    CONSTRAINT validate_tickets CHECK (n_ingressos_total > 0),
    CONSTRAINT pk_festa PRIMARY KEY(id),
    CONSTRAINT sk_festa UNIQUE(data_horario, nome, moradia),
    CONSTRAINT fk_festa_moradia FOREIGN KEY(moradia)
                                REFERENCES moradia(id)
                                ON DELETE CASCADE
);

CREATE TABLE pessoa (
    CPF        CHAR(11),
    RG         VARCHAR(9)  NOT NULL,
    nome       VARCHAR(75) NOT NULL,
    nascimento DATE        NOT NULL,

    CONSTRAINT pk_pessoa PRIMARY KEY(CPF),
    CONSTRAINT sk_pessoa UNIQUE(CPF),
    CONSTRAINT CPF_number CHECK(CPF ~ '^[0-9]{11}$'),
    CONSTRAINT RG_number CHECK(RG ~ '^[0-9]{7,8}([0-9]|X)$')
);

CREATE TABLE ingresso (
    festa     INT,
    comprador CHAR(11),

    CONSTRAINT pk_ingresso PRIMARY KEY(festa, comprador),
    CONSTRAINT fk_presenca_aluno FOREIGN KEY(festa)
                                 REFERENCES festa(id)
                                 ON DELETE CASCADE,
    CONSTRAINT fk_presenca_curso FOREIGN KEY(comprador)
                                 REFERENCES pessoa(CPF)
                                 ON DELETE CASCADE
);

CREATE TYPE ATUACAO_PESSOA AS ENUM ('aluno', 'professor', 'responsavel');
CREATE TABLE atuacao (
    pessoa  CHAR(11),
    atuacao ATUACAO_PESSOA,

    CONSTRAINT pk_atuacao PRIMARY KEY(pessoa, atuacao),
    CONSTRAINT fk_atuacao_pessoa FOREIGN KEY(pessoa)
                                 REFERENCES pessoa(CPF)
                                 ON DELETE CASCADE
);

CREATE TABLE responsavel (
    CPF CHAR(11),

    CONSTRAINT pk_responsavel PRIMARY KEY(CPF),
    CONSTRAINT fk_responsavel_pessoa FOREIGN KEY(CPF)
                                     REFERENCES pessoa(CPF)
                                     ON DELETE CASCADE
);

CREATE TABLE aluno (
    CPF                CHAR(11),
    n_indicacoes       INT,
    procurando_moradia BOOLEAN,
    procurando_imovel  BOOLEAN,

    CONSTRAINT validate_indicacoes CHECK (n_indicacoes >= 0),
    CONSTRAINT pk_aluno PRIMARY KEY(CPF),
    CONSTRAINT fk_aluno_pessoa FOREIGN KEY(CPF)
                                 REFERENCES pessoa(CPF)
                                 ON DELETE CASCADE
);

CREATE TABLE professor (
    CPF          CHAR(11),
    area_atuacao VARCHAR,

    CONSTRAINT pk_professor PRIMARY KEY(CPF),
    CONSTRAINT fk_professor_pessoa FOREIGN KEY(CPF)
                                 REFERENCES pessoa(CPF)
                                 ON DELETE CASCADE
);

CREATE TABLE responsabilidade (
    residencia INT,
    responsavel CHAR(11),
    permissao_venda BOOLEAN,

    CONSTRAINT pk_responsabilidade PRIMARY KEY(residencia, responsavel),
    CONSTRAINT fk_responsabilidade_residencia FOREIGN KEY(residencia)
                                                REFERENCES residencia(ID)
                                                ON DELETE CASCADE,
    CONSTRAINT fk_responsabilidade_pessoa FOREIGN KEY(responsavel)
                                            REFERENCES pessoa(CPF)
                                            ON DELETE CASCADE
);

CREATE TABLE contrato_aluguel (
    inicio      DATE,
    residencia  INT,
    responsavel CHAR(11),
    locatario   CHAR(11),
    fim         DATE  NOT NULL,
    aluguel     MONEY NOT NULL,
    multa       MONEY NOT NULL,
    desconto    MONEY NOT NULL,

    CONSTRAINT validate_prices CHECK (aluguel::NUMERIC::INT > 0 AND
                                      multa::NUMERIC::INT >= 0 AND 
                                      desconto::NUMERIC::INT >= 0),
    CONSTRAINT pk_contrato_aluguel PRIMARY KEY(inicio, residencia, responsavel, locatario),
    CONSTRAINT fk_contrato_aluguel_responsabilidade FOREIGN KEY(residencia, responsavel)
                                                    REFERENCES responsabilidade(residencia, responsavel)
                                                    ON DELETE SET NULL,
    CONSTRAINT fk_contrato_aluguel_pessoa FOREIGN KEY(locatario)
                                            REFERENCES pessoa(CPF)
                                            ON DELETE SET NULL,
    CONSTRAINT contrato_aluguel_inicio_before_fim CHECK(fim >= inicio)
);

CREATE TABLE venda (
    residencia  INT,
    responsavel CHAR(11),
    comprador   CHAR(11),
    data        DATE  NOT NULL,
    valor       MONEY NOT NULL,
    desconto    MONEY NOT NULL,

    CONSTRAINT validate_prices CHECK (valor::NUMERIC::INT > 0 AND
                                      desconto::NUMERIC::INT >= 0),
    CONSTRAINT pk_venda PRIMARY KEY(residencia, responsavel, comprador),
    CONSTRAINT fk_venda_responsabilidade FOREIGN KEY(residencia, responsavel)
                                        REFERENCES responsabilidade(residencia, responsavel)
                                        ON DELETE SET NULL,
    CONSTRAINT fk_venda_pessoa FOREIGN KEY(comprador)
                                        REFERENCES pessoa(CPF)
                                        ON DELETE SET NULL
);

CREATE TABLE orienta (
    professor CHAR(11),
    aluno     CHAR(11),

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
    id                     INT                    GENERATED ALWAYS AS IDENTITY,
    CNPJ_universidade      CHAR(14)               NOT NULL,
    nome_campus            VARCHAR(50)            NOT NULL,
    cidade                 VARCHAR(50)            NOT NULL,
    nome_universidade      VARCHAR(50)            NOT NULL,
    categoria_universidade CATEGORIA_UNIVERSIDADE NOT NULL,
    estado                 BR_STATE               NOT NULL,
    cep                    VARCHAR(8)             NOT NULL,
    endereço               VARCHAR(100)           NOT NULL,

    CONSTRAINT pk_campus PRIMARY KEY(id),
    CONSTRAINT sk_campus UNIQUE(CNPJ_universidade, nome_campus, cidade),
    CONSTRAINT CNPJ_universidade_number CHECK(CNPJ_universidade ~ '^[0-9]{14}$'),
    CONSTRAINT cep_number CHECK(cep ~ '^[0-9]{8}$')
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
    aluno        CHAR(11),
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
    professor CHAR(11),
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
    ministrante  CHAR(11) NOT NULL,
    nome         VARCHAR(50) NOT NULL,
    campus       INT NOT NULL,
    data_horario TIMESTAMP NOT NULL,
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
    aluno    CHAR(11),
    palestra INT,

    CONSTRAINT pk_presenca PRIMARY KEY(aluno, palestra),
    CONSTRAINT fk_presenca_aluno FOREIGN KEY(aluno)
                                 REFERENCES aluno(CPF)
                                 ON DELETE CASCADE,
    CONSTRAINT fk_presenca_curso FOREIGN KEY(palestra)
                                 REFERENCES palestra(id)
                                 ON DELETE CASCADE
);
