# Script para padronizar TODAS as páginas HTML
# Baseado no padrão de bolsa-feminina.html

$arquivos = Get-ChildItem -Path "." -Filter "*.html" -File | Where-Object { 
    $_.Name -notlike "index.html" -and 
    $_.Name -notmatch "^projeto_mat" -and
    $_.Name -ne "padronizar_paginas.ps1" -and
    $_.Name -ne "padronizar_todas_paginas.ps1"
}

$contador = 0
$total = $arquivos.Count

Write-Host "Iniciando padronização de $total páginas..."
Write-Host ""

foreach ($arquivo in $arquivos) {
    $contador++
    $conteudo = Get-Content $arquivo.FullName -Raw -Encoding UTF8
    $modificado = $false
    
    # 1. Adicionar mobile.css se não existir
    if ($conteudo -notmatch 'mobile\.css') {
        $conteudo = $conteudo -replace '(<link rel="stylesheet" href="styles\.css">)', '$1`n    <link rel="stylesheet" href="mobile.css">'
        $modificado = $true
    }
    
    # 2. Remover media query do mobile.css se existir
    $conteudo = $conteudo -replace 'mobile\.css" media="[^"]*"', 'mobile.css"'
    
    # 3. Atualizar Font Awesome para 6.5.1
    if ($conteudo -match 'font-awesome/6\.0\.0') {
        $conteudo = $conteudo -replace 'font-awesome/6\.0\.0', 'font-awesome/6.5.1'
        $modificado = $true
    }
    
    # 4. Adicionar menu-toggle se não existir (após logo, antes de nav)
    if ($conteudo -match '<div class="logo">.*?</div>\s*<nav>' -and $conteudo -notmatch 'menu-toggle') {
        $conteudo = $conteudo -replace '(            </div>\s*</div>\s*<div class="logo">.*?</div>\s*)<nav>', '$1            <button class="menu-toggle" type="button">`n                <i class="fas fa-bars"></i>`n            </button>`n            <nav>'
        $modificado = $true
    }
    
    # Versão alternativa para menu-toggle (se logo estiver em linha diferente)
    if ($conteudo -match '<div class="logo">' -and $conteudo -notmatch 'menu-toggle' -and $conteudo -match '\s+<nav>') {
        $conteudo = $conteudo -replace '(            <div class="logo">.*?</div>\s*)<nav>', '$1            <button class="menu-toggle" type="button">`n                <i class="fas fa-bars"></i>`n            </button>`n            <nav>'
        $modificado = $true
    }
    
    # 5. Adicionar close-menu-mobile se não existir (dentro de nav, antes de ul)
    if ($conteudo -match '<nav>' -and $conteudo -notmatch 'close-menu-mobile') {
        $conteudo = $conteudo -replace '(<nav>)', '$1`n                <button class="close-menu-mobile" id="closeMenuMobile" aria-label="Fechar menu" type="button"><i class="fas fa-times"></i></button>'
        $modificado = $true
    }
    
    # 6. Adicionar menu-social-icons se não existir (dentro de nav, após ul)
    if ($conteudo -match '</ul>\s*</nav>' -and $conteudo -notmatch 'menu-social-icons') {
        $conteudo = $conteudo -replace '(                </ul>)', '$1`n                <div class="menu-social-icons">`n                    <a href="https://www.instagram.com/promisesbolsas/" target="_blank" rel="noopener noreferrer"><i class="fab fa-instagram"></i></a>`n                    <a href="#"><i class="fab fa-linkedin-in"></i></a>`n                </div>'
        $modificado = $true
    }
    
    # 7. Adicionar menu-overlay se não existir (antes de </header>)
    if ($conteudo -match '</header>' -and $conteudo -notmatch 'menu-overlay') {
        $conteudo = $conteudo -replace '(        </div>\s*</header>)', '        </div>`n        <div class="menu-overlay"></div>`n    </header>'
        $modificado = $true
    }
    
    # 8. Corrigir links do menu
    $conteudo = $conteudo -replace '<li><a href="#">Quem somos</a></li>', '<li><a href="quem-somos.html">Quem somos</a></li>'
    $conteudo = $conteudo -replace '<li><a href="#">Fale conosco</a></li>', '<li><a href="fale-conosco.html">Fale conosco</a></li>'
    $conteudo = $conteudo -replace '<li><a href="#">SAC</a></li>', '<li><a href="sac.html">SAC</a></li>'
    
    # 9. Adicionar scroll-to-top se não existir (antes de </body>)
    if ($conteudo -match '</body>' -and $conteudo -notmatch 'scroll-to-top') {
        $conteudo = $conteudo -replace '(    </footer>\s*</body>)', '    </footer>`n`n    <div class="scroll-to-top" id="scrollTop">`n        <i class="fas fa-chevron-up"></i>`n    </div>`n`n    <script src="script.js"></script>`n</body>'
        $modificado = $true
    }
    
    # 10. Adicionar script.js se não existir (mas não duplicar)
    if ($conteudo -match '</body>' -and $conteudo -notmatch 'script\.js') {
        if ($conteudo -notmatch 'scroll-to-top') {
            $conteudo = $conteudo -replace '(    </footer>\s*</body>)', '    </footer>`n`n    <div class="scroll-to-top" id="scrollTop">`n        <i class="fas fa-chevron-up"></i>`n    </div>`n`n    <script src="script.js"></script>`n</body>'
        } else {
            $conteudo = $conteudo -replace '(    </div>\s*</body>)', '    </div>`n`n    <script src="script.js"></script>`n</body>'
        }
        $modificado = $true
    }
    
    if ($modificado) {
        Set-Content -Path $arquivo.FullName -Value $conteudo -Encoding UTF8 -NoNewline
        Write-Host "[$contador/$total] ✅ Padronizado: $($arquivo.Name)"
    } else {
        Write-Host "[$contador/$total] ⏭️  Já está padrão: $($arquivo.Name)"
    }
}

Write-Host ""
Write-Host "✅ Concluído! Todas as $total páginas foram verificadas e padronizadas."
Write-Host ""
Write-Host "Pressione qualquer tecla para continuar..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

