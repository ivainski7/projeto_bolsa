# 📋 PADRONIZAÇÃO COMPLETA DAS PÁGINAS

## 📊 STATUS ATUAL

- ❌ **26 páginas** sem `menu-toggle`
- ❌ **26 páginas** sem `menu-overlay`
- ❌ **38 páginas** sem `mobile.css`
- ❌ **15 páginas** sem `script.js`

## ✅ PADRÃO DEFINIDO (baseado em bolsa-feminina.html)

### 1. HEAD - Links CSS e Font Awesome
```html
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="mobile.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
```

### 2. TOP BAR - Padrão
```html
<div class="top-bar">
    <div class="container">
        <div class="social-icons">
            <a href="https://www.facebook.com/share/1aSuzLSb5p/" target="_blank" rel="noopener noreferrer"><i class="fab fa-facebook-f"></i></a>
            <a href="https://www.instagram.com/promisesbolsas/" target="_blank" rel="noopener noreferrer"><i class="fab fa-instagram"></i></a>
            <a href="#"><i class="fab fa-linkedin-in"></i></a>
            <a href="https://www.threads.net/@promisesbolsas" target="_blank" rel="noopener noreferrer">
                <!-- SVG Threads -->
            </a>
        </div>
        <div class="contact-info">
            <a href="mailto:vendas@promisesbolsas.com.br">
                <i class="fas fa-envelope"></i>
                vendas@promisesbolsas.com.br
            </a>
            <a href="tel:+5541984945727" class="phone-button">
                <i class="fas fa-phone"></i>
                (41) 98494-5727
            </a>
        </div>
    </div>
</div>
```

### 3. HEADER - Menu Completo
```html
<header>
    <div class="container">
        <div class="logo">
            <a href="index.html"><img src="images/logo/logo.png" alt="Promises Bolsas"></a>
        </div>
        <button class="menu-toggle" type="button">
            <i class="fas fa-bars"></i>
        </button>
        <nav>
            <button class="close-menu-mobile" id="closeMenuMobile" aria-label="Fechar menu" type="button"><i class="fas fa-times"></i></button>
            <ul>
                <li><a href="index.html">Home</a></li>
                <li><a href="mochilas-e-acessorios.html">Mochilas e Acessórios</a></li>
                <li><a href="quem-somos.html">Quem somos</a></li>
                <li><a href="fale-conosco.html">Fale conosco</a></li>
                <li><a href="sac.html">SAC</a></li>
            </ul>
            <div class="menu-social-icons">
                <a href="https://www.instagram.com/promisesbolsas/" target="_blank" rel="noopener noreferrer"><i class="fab fa-instagram"></i></a>
                <a href="#"><i class="fab fa-linkedin-in"></i></a>
            </div>
        </nav>
        <div class="header-icons">
            <a href="#" class="search-icon"><i class="fas fa-search"></i></a>
            <a href="#" class="heart-icon"><i class="fas fa-heart"></i></a>
        </div>
    </div>
    <div class="menu-overlay"></div>
</header>
```

### 4. FOOTER - Final
```html
    <div class="scroll-to-top" id="scrollTop">
        <i class="fas fa-chevron-up"></i>
    </div>

    <script src="script.js"></script>
</body>
</html>
```

## 🔧 CORREÇÕES NECESSÁRIAS

1. Adicionar `mobile.css` em todas as páginas
2. Atualizar Font Awesome para 6.5.1
3. Adicionar `menu-toggle` button
4. Adicionar `close-menu-mobile` button
5. Adicionar `menu-overlay` div
6. Adicionar `menu-social-icons` no nav
7. Corrigir links do menu (quem-somos.html, fale-conosco.html, sac.html)
8. Adicionar `scroll-to-top` div
9. Adicionar `script.js` no final

## ⚠️ IMPORTANTE

O script `padronizar_paginas.ps1` foi criado, mas precisa ser executado manualmente ou ajustado conforme necessário.

