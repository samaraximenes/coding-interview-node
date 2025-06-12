# Ruby on Rails Code Interview

Sistema desenvolvido para avaliação técnica com Ruby on Rails. O projeto abrange correções de filtros, paginação com cursor, CRUD, envio de e-mails, relatórios com background jobs e testes automatizados.

---

## ⚙️ Funcionalidades

1. **Correção de filtros**
   - Filtro por empresa corrigido para retornar apenas usuários da empresa especificada.
   - Filtro por nome de usuário ajustado para permitir buscas parciais e case-insensitive com `ILIKE`.

2. **Teste dos filtros**
   - RSpec com cobertura de casos de uso para filtros de usuários.

3. **Tweets com paginação por cursor**
   - `GET /tweets`: lista tweets ordenados por mais recentes com paginação baseada em cursor.
   - `GET /users/:user_id/tweets`: mesma lógica aplicada para tweets de um usuário.

4. **CRUD de Empresas**
   - CRUD completo com páginas HTML (`CompaniesController`).

5. **Mailer de novo usuário**
   - E-mail enviado automaticamente ao cadastrar novo usuário.

6. **Relatório em segundo plano**
   - Relatório gerado com um service/repository usando Sidekiq (`ReportGenerationJob`).

7. **Cobertura de testes**
   - Cobertura extraída com SimpleCov. Relatório em `coverage/index.html`.

---

## ▶️ Como rodar

### Pré-requisitos

- Docker e Docker Compose instalados

### Passos

```bash
git clone https://github.com/seu-usuario/rails-code-interview.git
cd rails-code-interview
docker-compose build
docker-compose up
docker-compose exec app rails db:setup
