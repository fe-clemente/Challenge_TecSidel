
CREATE TABLE SOCORRISTA (
                tipo_socorrista VARCHAR NOT NULL,
                qtda_socorrista FLOAT NOT NULL,
                local_camera VARCHAR NOT NULL,
                escala VARCHAR NOT NULL,
                qtda_solicitacoes VARCHAR NOT NULL,
                tipo_encerramento VARCHAR NOT NULL,
                tempo_resposta FLOAT NOT NULL,
                qtda_guicho FLOAT NOT NULL,
                qtda_paramedico FLOAT NOT NULL,
                qtda_motorista FLOAT NOT NULL,
                qtda_ambulancia FLOAT NOT NULL,
                status_veiculos_de_socorro VARCHAR NOT NULL,
                local_ponto_controle VARCHAR NOT NULL,
                tipo_relatorio VARCHAR NOT NULL,
                CONSTRAINT New_SOCORRISTA_pk PRIMARY KEY (tipo_socorrista)
);


CREATE TABLE CAMERAS (
                nro_camera DOUBLE NOT NULL,
                local_camera VARCHAR NOT NULL,
                status_camera VARCHAR NOT NULL,
                tempo_gravacao VARCHAR NOT NULL,
                armazenamento_gravacao VARCHAR NOT NULL,
                fabricante VARCHAR NOT NULL,
                ult_manutencao DATE NOT NULL,
                tipo_camera VARCHAR NOT NULL,
                qtda_camera FLOAT NOT NULL,
                CONSTRAINT New_Sistema_Camera_pk PRIMARY KEY (nro_camera)
);


CREATE TABLE FREE_FLOE_Table (
                id_equipam DOUBLE NOT NULL,
                valor_arrecadado VARCHAR NOT NULL,
                qtda_sensor VARCHAR NOT NULL,
                local_sennsor VARCHAR NOT NULL,
                ultim_calibracao VARCHAR NOT NULL,
                prox_calibracao VARCHAR NOT NULL,
                status_sensor VARCHAR NOT NULL,
                qtda_evasao VARCHAR NOT NULL,
                qtda_freeflow VARCHAR NOT NULL,
                id_software VARCHAR NOT NULL,
                versao_software VARCHAR NOT NULL,
                tipo_relatorio VARCHAR NOT NULL,
                CONSTRAINT New_Free_Flow_pk PRIMARY KEY (id_equipam, valor_arrecadado)
);


CREATE TABLE ANUNCIANTES (
                id_anunciantes DOUBLE NOT NULL,
                local_anunc VARCHAR NOT NULL,
                duracao_anunc VARCHAR NOT NULL,
                dia_anunc DATE NOT NULL,
                modelo_contrat VARCHAR NOT NULL,
                tipo_estrutura VARCHAR NOT NULL,
                manut_anunc DATE NOT NULL,
                tipo_relatorio VARCHAR NOT NULL,
                CONSTRAINT New_ANUNCIANTES_pk PRIMARY KEY (id_anunciantes)
);


CREATE TABLE CONCESSIONARIA_Table (
                id_concessionaria VARCHAR NOT NULL,
                app_concessionaria VARCHAR NOT NULL,
                km_rodovia FLOAT NOT NULL,
                tempo_concessao DATE NOT NULL,
                valor_investido FLOAT NOT NULL,
                valor_a_ser_investido FLOAT NOT NULL,
                qtda_funcionarios DOUBLE NOT NULL,
                tipo_cargos FLOAT NOT NULL,
                qtda_alertas_lumin FLOAT NOT NULL,
                oper_neblina FLOAT NOT NULL,
                oper_chuva VARCHAR NOT NULL,
                oper_feriado VARCHAR NOT NULL,
                local_pontos_controle VARCHAR NOT NULL,
                id_equipam DOUBLE NOT NULL,
                id_anunciantes DOUBLE NOT NULL,
                nro_camera DOUBLE NOT NULL,
                tipo_socorrista VARCHAR NOT NULL,
                valor_arrecadado VARCHAR NOT NULL,
                CONSTRAINT New_CONCESSIONARIA_pk PRIMARY KEY (id_concessionaria, app_concessionaria)
);


CREATE TABLE APP_CONCESSIONARIA (
                id_acesso VARCHAR NOT NULL,
                id_concessionaria DOUBLE NOT NULL,
                app_concessionaria VARCHAR NOT NULL,
                servico_contratado_usuario VARCHAR NOT NULL,
                status_app VARCHAR NOT NULL,
                versao VARCHAR NOT NULL,
                responsavel VARCHAR NOT NULL,
                qtda_acesso VARCHAR NOT NULL,
                CONSTRAINT New_APP_CONCESSIONARIA_pk PRIMARY KEY (id_acesso)
);


CREATE TABLE Ponto_recarga_Table (
                nroequipamento DOUBLE NOT NULL,
                local_equipamento VARCHAR NOT NULL,
                capid_recarregam VARCHAR NOT NULL,
                forma_pagamento VARCHAR NOT NULL,
                valor_arrecadado FLOAT NOT NULL,
                qtda_cargas_realiz VARCHAR NOT NULL,
                status_placa_solar VARCHAR NOT NULL,
                id_concessionaria FLOAT NOT NULL,
                app_concessionaria VARCHAR NOT NULL,
                CONSTRAINT new_Ponto_recarga_pk PRIMARY KEY (nroequipamento)
);


CREATE TABLE tb_USUARIO (
                id_usuario DOUBLE NOT NULL,
                placa VARCHAR NOT NULL,
                id_acesso VARCHAR NOT NULL,
                cpf FLOAT NOT NULL,
                nome VARCHAR NOT NULL,
                cep VARCHAR NOT NULL,
                cartao_n VARCHAR NOT NULL,
                cartao_validad VARCHAR NOT NULL,
                cartao_codseg VARCHAR NOT NULL,
                cartao_nome VARCHAR NOT NULL,
                CONSTRAINT TB_Usuario_pk PRIMARY KEY (id_usuario, placa, id_acesso)
);


CREATE TABLE SPEEDDOK_Table (
                id_usuario DOUBLE NOT NULL,
                placa VARCHAR NOT NULL,
                id_acesso VARCHAR NOT NULL,
                tipo_divida VARCHAR NOT NULL,
                qtda_parcelamento VARCHAR NOT NULL,
                qtd_parcelas FLOAT NOT NULL,
                forma_pagam VARCHAR NOT NULL,
                email_enviodoc VARCHAR NOT NULL,
                estado_divida VARCHAR NOT NULL,
                email_enviado VARCHAR NOT NULL,
                tipo_relatorio VARCHAR NOT NULL,
                CONSTRAINT New_SPEEDDOK_pk PRIMARY KEY (id_usuario, placa, id_acesso)
);


CREATE TABLE tb_PROG_FIDELIDADE (
                id_usuario DOUBLE NOT NULL,
                placa VARCHAR NOT NULL,
                id_acesso VARCHAR NOT NULL,
                km_rodado FLOAT NOT NULL,
                pontos FLOAT NOT NULL,
                ult_troca DATE NOT NULL,
                pontos_expirados FLOAT NOT NULL,
                parceiro_troca VARCHAR NOT NULL,
                total_acumulado FLOAT NOT NULL,
                CONSTRAINT tb_PROG_FIDELIDADE_pk PRIMARY KEY (id_usuario, placa, id_acesso)
);


CREATE TABLE Tb_VEICULO (
                id_usuario DOUBLE NOT NULL,
                placa VARCHAR NOT NULL,
                id_acesso VARCHAR NOT NULL,
                id_concessionaria DOUBLE NOT NULL,
                app_concessionaria VARCHAR NOT NULL,
                cod_renavam VARCHAR NOT NULL,
                tipo_veiculo VARCHAR NOT NULL,
                cor VARCHAR NOT NULL,
                modelo VARCHAR NOT NULL,
                ano VARCHAR NOT NULL,
                status_ipva VARCHAR NOT NULL,
                status_licenciamento VARCHAR NOT NULL,
                status_multa VARCHAR NOT NULL,
                CONSTRAINT Tb_VEICULO_pk PRIMARY KEY (id_usuario, placa, id_acesso, id_concessionaria, app_concessionaria)
);


ALTER TABLE CONCESSIONARIA_Table ADD CONSTRAINT SOCORRISTA_CONCESSIONARIA_Table_fk
FOREIGN KEY (tipo_socorrista)
REFERENCES SOCORRISTA (tipo_socorrista)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE CONCESSIONARIA_Table ADD CONSTRAINT Sistema_Camera_Table_CONCESSIONARIA_Table_fk
FOREIGN KEY (nro_camera)
REFERENCES CAMERAS (nro_camera)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE CONCESSIONARIA_Table ADD CONSTRAINT FREE_FLOE_Table_CONCESSIONARIA_Table_fk
FOREIGN KEY (id_equipam, valor_arrecadado)
REFERENCES FREE_FLOE_Table (id_equipam, valor_arrecadado)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE CONCESSIONARIA_Table ADD CONSTRAINT ANUNCIANTES_CONCESSIONARIA_Table_fk
FOREIGN KEY (id_anunciantes)
REFERENCES ANUNCIANTES (id_anunciantes)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

/*
Warning: Column types mismatch in the following column mapping(s):
        id_concessionaria: VARCHAR -- id_concessionaria: FLOAT
*/
ALTER TABLE Ponto_recarga_Table ADD CONSTRAINT CONCESSIONARIA_Table_Ponto_recarga_Table_fk
FOREIGN KEY (id_concessionaria, app_concessionaria)
REFERENCES CONCESSIONARIA_Table (id_concessionaria, app_concessionaria)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

/*
Warning: Column types mismatch in the following column mapping(s):
        id_concessionaria: VARCHAR -- id_concessionaria: DOUBLE
*/
ALTER TABLE Tb_VEICULO ADD CONSTRAINT CONCESSIONARIA_Table_Tb_VEICULO_fk
FOREIGN KEY (id_concessionaria, app_concessionaria)
REFERENCES CONCESSIONARIA_Table (id_concessionaria, app_concessionaria)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

/*
Warning: Column types mismatch in the following column mapping(s):
        id_concessionaria: VARCHAR -- id_concessionaria: DOUBLE
*/
ALTER TABLE APP_CONCESSIONARIA ADD CONSTRAINT CONCESSIONARIA_Table_APP_CONCESSIONARIA_fk
FOREIGN KEY (id_concessionaria, app_concessionaria)
REFERENCES CONCESSIONARIA_Table (id_concessionaria, app_concessionaria)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE tb_USUARIO ADD CONSTRAINT APP_CONCESSIONARIA_tb_USUARIO_fk
FOREIGN KEY (id_acesso)
REFERENCES APP_CONCESSIONARIA (id_acesso)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Tb_VEICULO ADD CONSTRAINT tb_USUARIO_Tb_VEICULO_fk
FOREIGN KEY (id_usuario, placa, id_acesso)
REFERENCES tb_USUARIO (id_usuario, placa, id_acesso)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE tb_PROG_FIDELIDADE ADD CONSTRAINT tb_USUARIO_tb_PROG_FIDELIDADE_fk
FOREIGN KEY (id_usuario, placa, id_acesso)
REFERENCES tb_USUARIO (id_usuario, placa, id_acesso)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE SPEEDDOK_Table ADD CONSTRAINT tb_USUARIO_SPEEDDOK_Table_fk
FOREIGN KEY (id_usuario, placa, id_acesso)
REFERENCES tb_USUARIO (id_usuario, placa, id_acesso)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
