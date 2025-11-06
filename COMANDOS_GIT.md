# 📋 COMANDOS PARA COMMITAR AS CORREÇÕES

## ✅ Arquivos Preparados para Commit

Execute os seguintes comandos para fazer commit e push das correções:

```bash
# Adicionar todas as imagens renomeadas
git add images/bolsa-viagem/bolsa-viagem-matelasse.png
git add images/kit-termico/cooler-termico-e-porta-pratos.png
git add images/kit-escolar/kit-escolar-colegio-umbrella.png
git add images/kit-escolar/kit-escolar-efrata.png
git add images/variedades/variedades3.jpg
git add images/maleta/maleta.jpg
git add images/mochila-corporate-max/pegueot-site.png

# Adicionar todos os HTMLs corrigidos
git add mochilas-e-acessorios.html
git add bolsa-viagem-matelasse.html
git add bolsa-viagem.html
git add bolsa-viagem-camuflada.html
git add bolsa-viagem-premium.html
git add kit-escolar-umbrella.html
git add kit-escolar-efrata.html
git add kit-escolar.html
git add cooler-termico-porta-pratos.html
git add variedades.html
git add saiba-mais-variedades2.html
git add saiba-mais-variedades3.html
git add mochila-corporate-max.html
git add mochila-infantil.html
git add mochila-unissex.html
git add termica-com-porta-marmita.html
git add termicas-rosa-brasil-gostinho-sitio.html
git add maleta.html
git add maleta-profissional.html
git add maleta-equipamentos-odontologicos.html
git add maleta-profissional-detalhe.html
git add maletinha-de-mao.html
git add maleta-odontologica-dentalmed.html
git add maleta-odontologica-neodent.html

# Fazer commit
git commit -m "Corrigir nomes de imagens para compatibilidade com GitHub Pages

- Renomear arquivos com espaços e maiúsculas
- Corrigir caminhos em todos os HTMLs
- Resolver problemas de case sensitivity
- Garantir compatibilidade com Linux/GitHub"

# Fazer push
git push origin main
```

## ⚠️ IMPORTANTE

Após fazer push:
1. Aguarde 5-10 minutos para o GitHub Pages atualizar
2. Limpe o cache do navegador (Ctrl + Shift + R)
3. Teste acessando: `https://promisesbolsas.com/mochilas-e-acessorios.html`
4. Verifique se a imagem da Bolsa Viagem Matelassê aparece

## 🔍 Verificar no GitHub

Após o push, verifique no GitHub:
- Vá em: `https://github.com/SEU-USUARIO/SEU-REPO/tree/main/images/bolsa-viagem`
- Confirme que existe `bolsa-viagem-matelasse.png`
- Se ainda existir `BOLSA_VIAGEM_MATELASSÊ.png`, delete-o manualmente


