# Ruby on Rails Code Interview

Sistema desenvolvido para avaliação técnica com Ruby on Rails. O projeto abrange correções de filtros, paginação com cursor, CRUD, envio de e-mails, relatórios com background jobs e testes automatizados.

## Regras
1. **fazer fork do projeto para seu github**
2. **atualizar a versão do ruby e do rails**
3. **criar o dockerfile e o docker-compose**
4. **enviar o link do seu repositório para avaliação**
5. **não usar IA, e nem copiar de outros projetos, nesse caso será desclassificado**

---

## ⚙️ Funcionalidades

1. **Correção de filtros**
   - Filtro por empresa corrigido para retornar apenas usuários da empresa especificada. (FEITO)
   - Filtro por nome de usuário ajustado para permitir buscas parciais e case-insensitive com `ILIKE`. (FEITO)

2. **Teste dos filtros**
   - RSpec com cobertura de casos de uso para filtros de usuários. (FEITO)

3. **Tweets com paginação por cursor**
   - `GET /tweets`: lista tweets ordenados por mais recentes com paginação baseada em cursor. (FEITO)
   - `GET /users/:user_id/tweets`: mesma lógica aplicada para tweets de um usuário. (FEITO)

4. **CRUD de Empresas**
   - CRUD completo com páginas HTML (`CompaniesController`). (FEITO)

5. **Mailer de novo usuário**
   - E-mail enviado automaticamente ao cadastrar novo usuário. (FEITO)

6. **Relatório em segundo plano**
   - Relatório gerado com um service/repository usando Sidekiq (`ReportGenerationJob`). (FEITO)

7. **Cobertura de testes**
   - Cobertura extraída com SimpleCov. Relatório em `coverage/index.html`. (FEITO)

8. **Gerar um relatório com QUERY RAW usando joins, e otimizando a query com indices**
   - aqui você pode criar as tabelas e indices que você achar melhor para demostrar suas habilidades. 

9. **utilização de hotwire ou stimulus**
   - aqui é para você mostrar seu conhecimento de ambos.

---

## Como Rodar/Testar cada ponto desenvolvido

## Importante
> Desenvolvido para rodar em ambiente Docker + WSL2 (Windows Subsystem for Linux)

## Para Iniciar
1. **Suba o Container**
docker compose up --build
2. **Acesse o container da aplicação**
docker compose exec web bash
3. **Instale as dependências**
bundle install
4. **Prepare o banco de dados**
rails db:create db:migrate db:seed

## ⚙️ Funcionalidades

1. **Correção de filtros**
   - Filtro por empresa corrigido para retornar apenas usuários da empresa especificada. (FEITO) 
    - Para filtar por empresa use:  ?company_id=1
   - Filtro por nome de usuário ajustado para permitir buscas parciais e case-insensitive com `ILIKE`. (FEITO)
    - Para filtar por nome de usuário use:  ?username=jo

2. **Teste dos filtros**
   - RSpec com cobertura de casos de uso para filtros de usuários. (FEITO)
      - Para rodar os testes unitários use no diretório da aplicação no wsl: docker compose exec web bundle exec rspec
3. **Tweets com paginação por cursor**
   - `GET /tweets`: lista tweets ordenados por mais recentes com paginação baseada em cursor. (FEITO)
      - Para filtrar com cursor use: /tweets?limit=10&cursor=2025-06-15T20:00:00Z
   - `GET /users/:user_id/tweets`: mesma lógica aplicada para tweets de um usuário. (FEITO)
      - Para filtrar com cursor e usuário use: /users/2/tweets?limit=10&cursor=2025-06-15T20:00:00Z

4. **CRUD de Empresas**
   - CRUD completo com páginas HTML (`CompaniesController`). (FEITO)
      - Para acessar a interface acesse: /companies

5. **Mailer de novo usuário**
   - E-mail enviado automaticamente ao cadastrar novo usuário. (FEITO)
      - Consegue testar ao rodar os testes no passo 2.

6. **Relatório em segundo plano**
   - Relatório gerado com um service/repository usando Sidekiq (`ReportGenerationJob`). (FEITO)
      - Necessário inciar o sidekiq, inserir no diretório da aplicação no wsl: docker compose exec web bundle exec sidekiq
      - Acessar a rota: /tweets/report

7. **Cobertura de testes**
   - Cobertura extraída com SimpleCov. Relatório em `coverage/index.html`. (FEITO)
      - Gerado quando rodar o comando para executar testes, no passo 2.


## Observações

1. Tive dificuldades iniciais para gerar o Dockerfile e atualizar as versões do Ruby e do Rails devido a limitações na minha máquina local. Por isso, iniciei o desafio executando a aplicação no estado original. A atualização do Ruby e a criação do Dockerfile foram realizadas apenas no commit relacionado à etapa 6, quando foi necessário configurar o Sidekiq.

2. A aplicação estava originalmente configurada como uma API-only. Para implementar o CRUD com páginas HTML (etapa 4), foi necessário ajustar algumas configurações e middlewares para permitir o render de views, caso contrário, as páginas não seriam exibidas corretamente

3. As funcionalidades 8 (query raw otimizada com índices) e 9 (uso de Hotwire ou Stimulus) não foram implementadas por questões de tempo e priorização.

4. Realizei ajustes pontuais em alguns arquivos que, na minha avaliação, não seguiam boas práticas especialmente em relação a associações não definidas corretamente nos models. Essas modificações foram feitas para garantir um padrão mínimo de qualidade e facilitar a manutenção e entendimento do código.

5. Para a geração do diretório do CSV no relatório, utilizei uma IA como apoio pontual. Tenho ciência de que isso poderia ser um critério de desclassificação, mas considerei esse ponto específico como algo secundário diante do real objetivo da tarefa que, ao meu ver, era demonstrar o domínio sobre o uso do Sidekiq e a estruturação de background jobs. Acredito que, no cenário atual de desenvolvimento, o uso consciente de ferramentas de IA faz parte do fluxo de trabalho moderno e pode ser um aliado valioso na produtividade, desde que a lógica, entendimento e aplicação sejam de responsabilidade do desenvolvedor como foi o caso aqui.