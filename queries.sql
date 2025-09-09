-- Clientes que possuem mais de 1 veículo? Resposta: Nenhum cliente possui mais de um veículo.

SELECT c.nome, COUNT(v.id_veiculo) AS qtd_veiculos
FROM cliente c
JOIN veiculo v ON c.id_cliente = v.id_cliente
GROUP BY c.id_cliente
HAVING COUNT(v.id_veiculo) > 1;


-- Valor total das ordens de serviço (atributo derivado):

SELECT os.id_os,
       SUM(IFNULL(os_s.quantidade * os_s.valor_unitario, 0) +
           IFNULL(os_p.quantidade * os_p.valor_unitario, 0)) AS valor_calculado
FROM ordem_servico os
LEFT JOIN os_servico os_s ON os.id_os = os_s.id_os
LEFT JOIN os_peca os_p ON os.id_os = os_p.id_os
GROUP BY os.id_os;


-- Mecânicos de cada equipe:

SELECT e.nome_equipe, m.nome AS mecanico, m.especialidade
FROM equipe e
JOIN mecanico m ON e.id_equipe = m.id_equipe
ORDER BY e.nome_equipe;


-- Ordens de serviço concluídas em setembro/2025? Resposta: Nenhuma ordem de serviço concluída existe nesse período.

SELECT os.id_os, c.nome AS cliente, v.modelo, os.data_conclusao, os.status
FROM ordem_servico os
JOIN veiculo v ON os.id_veiculo = v.id_veiculo
JOIN cliente c ON v.id_cliente = c.id_cliente
WHERE os.status = 'Concluída' 
  AND MONTH(os.data_conclusao) = 9 
  AND YEAR(os.data_conclusao) = 2025;


-- Equipes que atenderam mais de 1 ordem de serviço? Resposta: Nenhuma equipe atendeu mais de uma ordem de serviço.

SELECT e.nome_equipe, COUNT(os.id_os) AS qtd_ordens
FROM equipe e
JOIN ordem_servico os ON e.id_equipe = os.id_equipe
GROUP BY e.id_equipe
HAVING COUNT(os.id_os) > 1;