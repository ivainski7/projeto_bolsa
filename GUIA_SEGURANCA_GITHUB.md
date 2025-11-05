# Guia de Segurança - GitHub Pages

## 🔒 Como Deixar o Site Seguro pelo GitHub

### 1. **Habilitar HTTPS no GitHub Pages**

O GitHub Pages oferece HTTPS automaticamente para sites com domínio personalizado. Para garantir que está ativado:

1. Acesse o repositório no GitHub
2. Vá em **Settings** → **Pages**
3. Na seção **Custom domain**, verifique se:
   - O domínio está configurado: `promisesbolsas.com`
   - A opção **Enforce HTTPS** está marcada/ativada
   - Se não estiver, clique em **Enforce HTTPS**

### 2. **Configurações no GitHub**

#### No repositório do GitHub:

1. **Settings** → **Pages**
   - Source: Branch (geralmente `main` ou `gh-pages`)
   - Custom domain: `promisesbolsas.com`
   - ✅ **Enforce HTTPS** (deve estar ativado)

2. **Settings** → **Security**
   - Verifique se não há vulnerabilidades
   - Ative dependabot se necessário

### 3. **Configuração do DNS**

No seu provedor de domínio (onde comprou `promisesbolsas.com`):

#### Opção A: Usando registros A (Recomendado)
```
Tipo: A
Nome: @
Valor: 185.199.108.153
Valor: 185.199.109.153
Valor: 185.199.110.153
Valor: 185.199.111.153

Tipo: AAAA (se suportar IPv6)
Nome: @
Valor: 2606:50c0:8000::153
Valor: 2606:50c0:8001::153
```

#### Opção B: Usando CNAME (Alternativa)
```
Tipo: CNAME
Nome: @ ou www
Valor: seu-usuario.github.io
```

**Importante**: O arquivo `CNAME` no repositório deve conter apenas:
```
promisesbolsas.com
```

### 4. **Verificar Status do HTTPS**

Após configurar:

1. Aguarde alguns minutos (pode levar até 24 horas)
2. Acesse: `https://promisesbolsas.com`
3. Verifique se aparece o cadeado 🔒 no navegador
4. Se aparecer aviso de "não seguro", pode levar até 24h para o certificado SSL ser ativado

### 5. **Forçar HTTPS no Código (Opcional)**

Se quiser garantir que todos os links usem HTTPS, adicione esta meta tag no `<head>` de todas as páginas:

```html
<meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
```

Ou use links absolutos com HTTPS:
```html
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
```

### 6. **Checklist de Segurança**

- [ ] HTTPS ativado no GitHub Pages
- [ ] Domínio personalizado configurado
- [ ] Arquivo CNAME presente no repositório
- [ ] DNS configurado corretamente
- [ ] Certificado SSL ativo (verificado pelo cadeado no navegador)
- [ ] Todos os recursos externos usam HTTPS
- [ ] Não há conteúdo misto (HTTP e HTTPS juntos)

### 7. **Troubleshooting**

**Problema**: HTTPS não está funcionando
- Solução: Aguarde até 24 horas após configurar o domínio
- Verifique se o DNS está correto: use `dig promisesbolsas.com`

**Problema**: Aviso de "conteúdo misto"
- Solução: Certifique-se de que todos os links externos usam `https://`

**Problema**: Certificado não válido
- Solução: Remova e re-adicione o domínio personalizado no GitHub

### 8. **Comandos Úteis (via Terminal)**

```bash
# Verificar DNS
nslookup promisesbolsas.com

# Verificar certificado SSL
openssl s_client -connect promisesbolsas.com:443 -servername promisesbolsas.com

# Verificar headers de segurança
curl -I https://promisesbolsas.com
```

## 📝 Notas Importantes

- O GitHub Pages fornece certificado SSL **gratuitamente** via Let's Encrypt
- O processo pode levar de **alguns minutos até 24 horas**
- Não é necessário configurar certificado manualmente
- O GitHub faz a renovação automática do certificado

## 🔗 Links Úteis

- [GitHub Pages Docs](https://docs.github.com/en/pages)
- [Custom Domain Guide](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site)
- [HTTPS no GitHub Pages](https://docs.github.com/en/pages/getting-started-with-github-pages/securing-your-github-pages-site-with-https)


