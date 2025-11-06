# Script PowerShell para padronizar todas as páginas HTML
# Baseado no padrão da página bolsa-feminina.html

$arquivos = Get-ChildItem -Path "." -Filter "*.html" -File | Where-Object { $_.Name -notlike "index.html" -and $_.Name -notmatch "^projeto_mat" }

foreach ($arquivo in $arquivos) {
    $conteudo = Get-Content $arquivo.FullName -Raw -Encoding UTF8
    $modificado = $false
    
    # 1. Adicionar mobile.css se não existir
    if ($conteudo -notmatch 'mobile\.css') {
        $conteudo = $conteudo -replace '(<link rel="stylesheet" href="styles\.css">)', '$1`n    <link rel="stylesheet" href="mobile.css">'
        $modificado = $true
    }
    
    # 2. Atualizar Font Awesome para 6.5.1
    $conteudo = $conteudo -replace 'font-awesome/6\.0\.0', 'font-awesome/6.5.1'
    
    # 3. Corrigir header - adicionar menu-toggle se não existir
    if ($conteudo -match '<header>.*?<div class="logo">' -and $conteudo -notmatch 'menu-toggle') {
        $conteudo = $conteudo -replace '(            <div class="logo">)', "            <button class=`"menu-toggle`" type=`"button`">`n                <i class=`"fas fa-bars`"></i>`n            </button>`n`$1"
        $modificado = $true
    }
    
    # 4. Adicionar close-menu-mobile e menu-overlay se não existirem
    if ($conteudo -match '<nav>' -and $conteudo -notmatch 'close-menu-mobile') {
        $conteudo = $conteudo -replace '(<nav>)', "$1`n                <button class=`"close-menu-mobile`" id=`"closeMenuMobile`" aria-label=`"Fechar menu`" type=`"button`"><i class=`"fas fa-times`"></i></button>"
        $modificado = $true
    }
    
    if ($conteudo -match '</header>' -and $conteudo -notmatch 'menu-overlay') {
        $conteudo = $conteudo -replace '(        </div>\s*</header>)', "        </div>`n        <div class=`"menu-overlay`"></div>`n    </header>"
        $modificado = $true
    }
    
    # 5. Corrigir links do menu
    $conteudo = $conteudo -replace '<li><a href="#">Quem somos</a></li>', '<li><a href="quem-somos.html">Quem somos</a></li>'
    $conteudo = $conteudo -replace '<li><a href="#">Fale conosco</a></li>', '<li><a href="fale-conosco.html">Fale conosco</a></li>'
    $conteudo = $conteudo -replace '<li><a href="#">SAC</a></li>', '<li><a href="sac.html">SAC</a></li>'
    
    # 6. Adicionar menu-social-icons se não existir
    if ($conteudo -match '</ul>\s*</nav>' -and $conteudo -notmatch 'menu-social-icons') {
        $conteudo = $conteudo -replace '(                </ul>)', "$1`n                <div class=`"menu-social-icons`">`n                    <a href=`"https://www.instagram.com/promisesbolsas/`" target=`"_blank`" rel=`"noopener noreferrer`"><i class=`"fab fa-instagram`"></i></a>`n                    <a href=`"#`"><i class=`"fab fa-linkedin-in`"></i></a>`n                </div>"
        $modificado = $true
    }
    
    # 7. Adicionar script.js se não existir
    if ($conteudo -match '</body>' -and $conteudo -notmatch 'script\.js') {
        $conteudo = $conteudo -replace '(</body>)', "    <script src=`"script.js`"></script>`n`$1"
        $modificado = $true
    }
    
    # 8. Adicionar scroll-to-top se não existir
    if ($conteudo -match '</footer>' -and $conteudo -notmatch 'scroll-to-top') {
        $conteudo = $conteudo -replace '(    </footer>)', "$1`n`n    <div class=`"scroll-to-top`" id=`"scrollTop`">`n        <i class=`"fas fa-chevron-up`"></i>`n    </div>"
        $modificado = $true
    }
    
    if ($modificado) {
        Set-Content -Path $arquivo.FullName -Value $conteudo -Encoding UTF8 -NoNewline
        Write-Host "✅ Padronizado: $($arquivo.Name)"
    } else {
        Write-Host "⏭️  Já está padrão: $($arquivo.Name)"
    }
}

Write-Host "`n✅ Concluído! Todas as páginas foram padronizadas."

