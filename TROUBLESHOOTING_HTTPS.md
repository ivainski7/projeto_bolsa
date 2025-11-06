# 🔧 Troubleshooting: HTTPS Não Habilita

## ✅ Passo 1: Verificar se o Arquivo CNAME Existe

O arquivo `CNAME` deve estar na **raiz do repositório** (mesmo nível do `index.html`).

**Se não existir, crie:**

1. No GitHub: **Code** → **Add file** → **Create new file**
2. Nome: `CNAME` (sem extensão, tudo maiúsculo)
3. Conteúdo: apenas `promisesbolsas.com` (sem http:// ou https://)
4. Commit: "Add CNAME file"

## ✅ Passo 2: Verificar DNS

Execute no PowerShell:

```powershell
nslookup promisesbolsas.com
```

**Resultado esperado:**
Deve mostrar os 4 IPs do GitHub:
- 185.199.108.153
- 185.199.109.153
- 185.199.110.153
- 185.199.111.153

**Se não aparecer esses IPs:**
- O DNS ainda não propagou (aguarde até 24h)
- Ou há configuração incorreta no provedor

## ✅ Passo 3: Verificar Configuração no GitHub

1. Vá em **Settings** → **Pages**
2. Verifique se:
   - ✅ Domínio está configurado: `promisesbolsas.com`
   - ✅ Status não mostra mais "DNS Check in Progress"
   - ✅ Checkbox "Enforce HTTPS" está **habilitado** (não cinza)

## ✅ Passo 4: Remover e Re-adicionar Domínio

Se o DNS está correto mas ainda não habilita:

1. **Settings** → **Pages** → **Custom domain**
2. Clique em **Remove** (remover domínio)
3. Aguarde **5 minutos**
4. Digite novamente: `promisesbolsas.com`
5. Clique em **Save**
6. Aguarde mais alguns minutos
7. Verifique se o checkbox "Enforce HTTPS" ficou habilitado

## ✅ Passo 5: Verificar Tipos de Registro DNS

**Importante:** Alguns provedores de domínio têm limitações:

### Se usar Registro.br:
- Use **apenas registros A** (não CNAME no domínio raiz)
- Não use CNAME para `@` (domínio raiz)

### Se usar GoDaddy, Namecheap, etc.:
- Pode usar CNAME ou registros A
- Verifique se o provedor permite CNAME no domínio raiz

## ✅ Passo 6: Verificar se Existem Registros Conflitantes

No painel do seu provedor de domínio, verifique:

- ❌ Não deve ter registros CNAME E A ao mesmo tempo para `@`
- ❌ Não deve ter registros antigos/incorretos
- ✅ Deve ter APENAS os 4 registros A do GitHub

## ✅ Passo 7: Limpar Cache do Navegador

Às vezes o navegador mostra status antigo:

1. Pressione `Ctrl + Shift + Delete`
2. Limpe cache e cookies
3. Ou use modo anônimo: `Ctrl + Shift + N`
4. Acesse: `https://github.com/ivainski7/projeto_bolsa/settings/pages`

## ✅ Passo 8: Verificar Status do Certificado SSL

O GitHub usa Let's Encrypt. Pode levar algumas horas após o DNS estar correto.

**Verificar certificado:**
```powershell
# Testar conexão HTTPS
Test-NetConnection promisesbolsas.com -Port 443
```

## 🔍 Problemas Comuns

### Problema 1: "DNS Check in Progress" não sai
**Solução:**
- Aguarde até 24 horas
- Verifique DNS com `nslookup`
- Remova e re-adicione o domínio

### Problema 2: Checkbox "Enforce HTTPS" está cinza
**Solução:**
- O DNS ainda não foi verificado pelo GitHub
- Aguarde mais tempo ou verifique se o DNS está correto

### Problema 3: DNS correto mas HTTPS não habilita
**Solução:**
- Remova e re-adicione o domínio
- Aguarde algumas horas (certificado SSL pode demorar)
- Verifique se o arquivo CNAME está correto

### Problema 4: Arquivo CNAME não está no repositório
**Solução:**
- Crie o arquivo CNAME na raiz
- Conteúdo: apenas `promisesbolsas.com`
- Commit e push

## 📋 Checklist Completo

- [ ] Arquivo `CNAME` existe na raiz do repositório
- [ ] Conteúdo do CNAME: apenas `promisesbolsas.com`
- [ ] DNS configurado com 4 registros A corretos
- [ ] `nslookup promisesbolsas.com` mostra os IPs corretos
- [ ] Domínio configurado em Settings → Pages
- [ ] Removi e re-adicionei o domínio (se necessário)
- [ ] Aguardei tempo suficiente (até 24h)
- [ ] Limpei cache do navegador
- [ ] Status não mostra mais "DNS Check in Progress"
- [ ] Checkbox "Enforce HTTPS" está habilitado (não cinza)

## 🆘 Se Nada Funcionar

1. **Verifique com suporte do provedor de domínio:**
   - Peça para confirmar que os registros DNS estão corretos
   - Pergunte se há algum bloqueio ou configuração especial

2. **Tente usar www:**
   - Configure `www.promisesbolsas.com` como CNAME
   - Pode ser mais fácil de configurar

3. **Verifique logs do GitHub:**
   - Settings → Pages → verifique se há erros de build

## 📞 Informações Úteis para Suporte

Se precisar de ajuda do provedor de domínio, informe:

- **Tipo de registro:** A (IPv4)
- **IPs do GitHub:**
  - 185.199.108.153
  - 185.199.109.153
  - 185.199.110.153
  - 185.199.111.153
- **Domínio:** promisesbolsas.com
- **Serviço:** GitHub Pages (ivainski7.github.io)




