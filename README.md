
# 🍽️ Sistema de Gerenciamento de Restaurante — Banco de Dados

Repositório dedicado à modelagem e implementação do banco de dados relacional desenvolvido como projeto acadêmico para o curso de **Ciência da Computação na PUCPR**.

O objetivo deste projeto é simular o ecossistema de dados de um restaurante, contemplando o gerenciamento de clientes, cardápio, pedidos, funcionários e entregas com integridade referencial e consultas otimizadas.

---

## 🚀 Tecnologias Utilizadas

* **SGBD:** PostgreSQL / MySQL *(ajuste conforme o SGBD que você está utilizando)*
* **Modelagem:** Diagrama Entidade-Relacionamento (DER) / Modelo Lógico
* **Ferramentas:** VS Code, Git e GitHub Desktop


## 📊 Visão Geral da Modelagem

O banco de dados foi estruturado seguindo os princípios de normalização para evitar redundâncias e garantir a consistência dos dados. As principais entidades modeladas incluem:

* **Cliente:** Armazena informações de cadastro e histórico de contato.
* **Funcionário:** Gerencia a equipe e cargos (atendentes, cozinheiros, entregadores).
* **Cardápio/Produto:** Catálogo de pratos, bebidas e preços atualizados.
* **Pedido:** Registra a transação, associando cliente, funcionário responsável e status.
* **Item do Pedido:** Tabela associativa que detalha os produtos contidos em cada pedido e suas respectivas quantidades.

---

## 🛠️ Como Executar os Scripts

Se você quiser testar a criação e o funcionamento do banco no seu ambiente local:

1. Clone o repositório:
```bash
git clone https://github.com/seu-usuario/seu-repositorio.git

```


2. Abra o seu gerenciador de banco de dados preferido (DBeaver, pgAdmin, MySQL Workbench, etc.).
3. Execute os scripts na ordem numérica:
* Primeiro, execute o script da pasta `sql/` para criar as tabelas e restrições.
* Em seguida, execute o script de inserção (`DML`) para povoar o banco com dados de exemplo.
* Explore o arquivo de consultas (`queries`) para testar os relatórios e cruzamentos de dados (`JOINs`).



---

## 👨‍💻 Autor

Desenvolvido por **Felipe Augusto**

Estudante de Ciência da Computação — PUCPR

---

O que achou da estrutura? Se quiser que eu ajuste algum detalhe específico (como o nome de tabelas exatas do seu modelo ou o SGBD utilizado), é só me avisar!