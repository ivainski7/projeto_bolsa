# 🔒 Como Ativar HTTPS no GitHub Pages

## ⚠️ Problema Atual

O HTTPS está **desabilitado** porque o domínio `promisesbolsas.com` não está configurado corretamente no DNS.

Status atual: **"DNS Check in Progress"** (verificação DNS em andamento)

## ✅ Solução Passo a Passo

### **Passo 1: Verificar Configuração DNS**

Vá até o painel do seu provedor de domínio (Registro.br, GoDaddy, etc.) e configure:

#### **Opção A: Usando Registros A (Recomendado para domínio raiz)**

Adicione **4 registros A** com estes valores:

```
Tipo: A
Nome: @ (ou deixe em branco)
Valor: 185.199.108.153
TTL: 3600 (ou padrão)

Tipo: A
Nome: @
Valor: 185.199.109.153
TTL: 3600

Tipo: A
Nome: @
Valor: 185.199.110.153
TTL: 3600

Tipo: A
Nome: @
Valor: 185.199.111.153
TTL: 3600
```

#### **Opção B: Usando CNAME (Alternativa)**

Se seu provedor permitir CNAME no domínio raiz:

```
Tipo: CNAME
Nome: @ (ou deixe em branco)
Valor: ivainski7.github.io
TTL: 3600
```

### **Passo 2: Verificar Arquivo CNAME no Repositório**

Certifique-se de que existe um arquivo `CNAME` na raiz do repositório com:

```
promisesbolsas.com
```

**Se não existir**, crie o arquivo:

1. No GitHub, vá em **Code** → clique em **Add file** → **Create new file**
2. Nomeie como: `CNAME` (sem extensão)
3. Adicione apenas: `promisesbolsas.com`
4. Commit: "Add CNAME file for custom domain"

### **Passo 3: Aguardar Propagação DNS**

- **Tempo esperado**: 15 minutos a 24 horas
- Durante esse tempo, o status ficará como "DNS Check in Progress"

**Como verificar se o DNS está correto:**

Abra o terminal/PowerShell e execute:

```powershell
nslookup promisesbolsas.com
```

Você deve ver os IPs:
- 185.199.108.153
- 185.199.109.153
- 185.199.110.153
- 185.199.111.153

### **Passo 4: Ativar HTTPS no GitHub**

Após o DNS ser verificado (status mudará de "DNS Check in Progress"):

1. Vá em **Settings** → **Pages**
2. Na seção **"Enforce HTTPS"**:
   - O checkbox ficará **habilitado** (não mais cinza)
   - ✅ **Marque a caixa "Enforce HTTPS"**
3. Clique em **Save**

### **Passo 5: Verificar se Funcionou**

1. Aguarde mais alguns minutos após ativar
2. Acesse: `https://promisesbolsas.com`
3. Verifique se aparece o **cadeado 🔒** no navegador
4. Não deve aparecer avisos de "Não seguro"

## 🔧 Troubleshooting

### Problema: "DNS Check in Progress" não muda

**Soluções:**
1. Verifique se os registros DNS estão corretos no seu provedor
2. Aguarde até 24 horas (pode demorar)
3. Remova e re-adicione o domínio no GitHub:
   - Settings → Pages → Custom domain
   - Clique em **Remove**
   - Aguarde 5 minutos
   - Adicione novamente: `promisesbolsas.com`
   - Clique em **Save**

### Problema: HTTPS ainda não funciona após 24h

1. Verifique o DNS: `nslookup promisesbolsas.com`
2. Verifique se o arquivo `CNAME` existe no repositório
3. Tente remover e re-adicionar o domínio no GitHub
4. Verifique se não há outros registros DNS conflitantes

### Problema: Certificado inválido

- O GitHub usa Let's Encrypt automaticamente
- Se aparecer erro de certificado, aguarde mais algumas horas
- Pode ser necessário limpar o cache do navegador

## 📝 Checklist

- [ ] DNS configurado com 4 registros A (ou CNAME)
- [ ] Arquivo `CNAME` existe no repositório
- [ ] Domínio adicionado em Settings → Pages
- [ ] Aguardou propagação DNS (15min - 24h)
- [ ] Status mudou de "DNS Check in Progress"
- [ ] Checkbox "Enforce HTTPS" está habilitado
- [ ] ✅ Marquei "Enforce HTTPS"
- [ ] Site acessível via `https://promisesbolsas.com`
- [ ] Cadeado 🔒 aparece no navegador

## ⏱️ Tempo Estimado

- **DNS**: 15 minutos a 24 horas
- **Certificado SSL**: Automático pelo GitHub (pode levar algumas horas)
- **Total**: Geralmente funciona em 1-2 horas, mas pode levar até 24h

## 🆘 Precisa de Ajuda?

Se após 24 horas ainda não funcionar:
1. Verifique o DNS com `nslookup promisesbolsas.com`
2. Verifique se o arquivo `CNAME` está correto
3. Tente remover e re-adicionar o domínio no GitHub
4. Verifique se o provedor de domínio não está bloqueando

## 📚 Links Úteis

- [GitHub Pages - Custom Domain](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site)
- [Troubleshooting Custom Domains](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/troubleshooting-custom-domains-and-github-pages)




