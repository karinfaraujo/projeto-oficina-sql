INSERT INTO cliente (nome, telefone, endereco) VALUES 
('João Silva', '11988887777', 'Rua A, 123'),
('Maria Souza', '21999996666', 'Av. Central, 456');

INSERT INTO veiculo (id_cliente, placa, modelo, ano) VALUES
(1, 'ABC1234', 'Gol', 2015),
(2, 'XYZ9876', 'Civic', 2020);

INSERT INTO equipe (nome_equipe) VALUES
('Equipe Alfa'),
('Equipe Beta');

INSERT INTO mecanico (id_equipe, nome, endereco, especialidade) VALUES
(1, 'Carlos Mecânico', 'Rua B, 45', 'Suspensão'),
(2, 'Pedro Mecânico', 'Av. D, 77', 'Motor');

INSERT INTO servico (descricao, valor_mao_obra) VALUES
('Troca de óleo', 120.00),
('Alinhamento', 200.00);

INSERT INTO peca (descricao, valor_unitario) VALUES
('Filtro de óleo', 30.00),
('Pneu', 400.00);

INSERT INTO ordem_servico (id_veiculo, id_equipe, data_emissao, status, valor_total) VALUES
(1, 1, '2025-09-01', 'Em andamento', 0.00),
(2, 2, '2025-09-05', 'Concluída', 0.00);

INSERT INTO os_servico (id_os, id_servico, quantidade, valor_unitario) VALUES
(1, 1, 1, 120.00),
(2, 2, 1, 200.00);

INSERT INTO os_peca (id_os, id_peca, quantidade, valor_unitario) VALUES
(1, 1, 1, 30.00),
(2, 2, 4, 400.00);
