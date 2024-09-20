# Your Hotel - Sistema de Gestão Hoteleira
Bem-vindo ao Your Hotel, um sistema open-source de gestão hoteleira desenvolvido como projeto de TCC. O objetivo do sistema é facilitar a administração de pequenos hotéis, oferecendo funcionalidades essenciais como controle financeiro, gerenciamento de reservas, cadastro de hóspedes, e geração de relatórios financeiros (DRE e DFC).

Este projeto foi criado para atender às necessidades específicas de hotéis de pequeno porte, proporcionando uma solução prática e acessível para otimizar operações e melhorar a eficiência na gestão diária.

## Funcionalidades
-Gerenciamento de reservas: Fácil controle de check-ins, check-outs e status de reservas.

-Gestão financeira: Controle de receitas, despesas e relatórios financeiros detalhados (DRE e DFC).

-Cadastro de hóspedes: Manutenção e histórico dos hóspedes com dados detalhados.

-Relatórios financeiros: Geração automática de relatórios como DRE (Demonstração de Resultados) e DFC (Demonstrativo de Fluxo de Caixa).

-Interface intuitiva: Usabilidade simplificada para garantir que qualquer usuário possa administrar o hotel sem complicações.

## Instalação

### Pré-requisitos

Antes de iniciar, certifique-se de ter instalado:

-Ruby (versão 3.0 ou superior)

-Rails (versão 7.0 ou superior)

-Banco de dados (PostgreSQL, MySQL ou SQLite)

## Passos para instalar o projeto

Clone este repositório em sua máquina local:

```git clone https://github.com/AlexandrePateis/tcc_you_hotel.git```

Acesse o diretório do projeto:

```cd tcc_you_hotel```

Instale as dependências do projeto:

```bundle install```

Configure o banco de dados:

```rails db:create db:migrate```

Inicie o servidor local:

```rails server```

Abra o navegador e acesse o endereço:

```http://localhost:3000```

## Deploy em Produção

Para realizar o deploy em um servidor de produção, siga as instruções de seu provedor, garantindo que tenha configurado corretamente as variáveis de ambiente, como as chaves de banco de dados e configuração do ambiente Rails.

## Contribuições

Este projeto é open-source e está disponível para contribuições. Se você deseja contribuir, fique à vontade para abrir issues ou enviar pull requests. Queremos garantir que este projeto cresça com a ajuda da comunidade, criando um sistema ainda mais robusto para pequenos hotéis.

## Sobre o Projeto

O Your Hotel é parte de um projeto de TCC, desenvolvido como uma solução prática e aplicável para o setor hoteleiro. Por ser open-source, ele pode ser utilizado por qualquer pessoa ou empresa que deseje implementar um sistema de gestão em seus negócios.

Sinta-se livre para explorar, modificar e adaptar conforme suas necessidades.

## Licença

Este projeto é licenciado sob a licença MIT - consulte o arquivo LICENSE para obter mais detalhes.

Agradecemos por conferir o Your Hotel!
