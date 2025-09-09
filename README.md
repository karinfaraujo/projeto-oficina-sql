# Projeto Oficina Mecânica SQL

Este projeto implementa o modelo lógico e físico de um sistema de oficina mecânica em MySQL do curso **Randstad - Análise de Dados** da **DIO**.

## Estrutura do banco

- **Cliente**: cadastro de clientes da oficina.  
- **Veículo**: veículos vinculados aos clientes.  
- **Equipe**: equipes responsáveis pelos serviços.  
- **Mecânico**: mecânicos pertencentes a cada equipe.  
- **Ordem de Serviço (OS)**: registro de serviços e peças utilizados.  
- **Serviço**: catálogo de serviços prestados.  
- **Peça**: peças usadas nas manutenções.  
- **os_servico**: tabela de associação OS ↔ Serviço.  
- **os_peca**: tabela de associação OS ↔ Peça.  

## Como usar

1. Abrir o **MySQL Workbench**.  
2. Rodar `script_oficina.sql` para criar as tabelas.  
3. Rodar `insert_data.sql` para popular com dados de exemplo.  
4. Rodar `queries.sql` para executar relatórios e consultas.

## Exemplos de queries

- **Clientes com mais de 1 veículo**:
```sql
SELECT c.nome, COUNT(v.id_veiculo) AS qtd_veiculos
FROM cliente c
JOIN veiculo v ON c.id_cliente = v.id_cliente
GROUP BY c.id_cliente
HAVING COUNT(v.id_veiculo) > 1;
