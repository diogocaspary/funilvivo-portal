# Funil Vivo — Portal (deploy EasyPanel + Cloudflare)

Portal estático (HTML único) servido por nginx via Docker. Hospedagem no **EasyPanel**, proteção/CDN pelo **Cloudflare**.

## Estrutura
- `index.html` — o portal (login + painéis equipe/cliente), já conectado ao Supabase.
- `Dockerfile` — imagem nginx que serve o site na porta 80.
- `nginx.conf` — config do servidor + cabeçalhos de segurança.

---

## Passo 1 — Subir para o GitHub
Crie um repositório novo (ex: `funilvivo-portal`) e suba estes arquivos. Se for pelo terminal:
```bash
git init
git add .
git commit -m "Portal Funil Vivo"
git branch -M main
git remote add origin https://github.com/SEU-USUARIO/funilvivo-portal.git
git push -u origin main
```
(ou use o botão "uploading an existing file" do GitHub e arraste os arquivos)

## Passo 2 — Criar o app no EasyPanel
1. EasyPanel → **Create Project** → nome `funilvivo`.
2. Dentro do projeto → **+ Service → App**.
3. **Source → GitHub** → selecione o repo `funilvivo-portal`, branch `main`.
4. **Build → Dockerfile** (o EasyPanel detecta automaticamente).
5. **Deploy**. Em segundos o serviço sobe na porta 80.

## Passo 3 — Domínio no EasyPanel
1. No serviço → aba **Domains** → Add Domain → `app.funilvivo.com.br`.
2. EasyPanel mostra para onde apontar (o IP do seu servidor).

## Passo 4 — Cloudflare (proteção)
1. No Cloudflare → DNS → adicione um registro **A**: nome `app`, valor = IP do servidor EasyPanel, **Proxy ligado (nuvem laranja)**.
2. SSL/TLS → modo **Full**.
3. (Opcional) WAF / Bot Fight Mode ligados para proteção extra.

> Dica de certificado: se o EasyPanel for emitir Let's Encrypt, deixe o proxy do Cloudflare **cinza** por alguns minutos até o cert ser emitido, depois ligue o laranja. Alternativa: usar um **Origin Certificate** do Cloudflare no EasyPanel.

## Passo 5 — Avisar o Supabase
Supabase → **Authentication → URL Configuration** → **Site URL** = `https://app.funilvivo.com.br`.

## Deploys futuros
Toda vez que atualizarmos o `index.html` e você der push no GitHub, é só clicar **Deploy** no EasyPanel. Eu faço as alterações no código; você aperta o botão.

---

### Acesso admin
Usuário `diogocaspary@gmail.com` já criado como **admin**. Use a senha temporária que combinamos e troque no primeiro login (botão "Trocar senha" no portal).
