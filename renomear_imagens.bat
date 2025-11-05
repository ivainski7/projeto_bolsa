@echo off
REM Script para renomear imagens com problemas de espaços e case sensitivity
REM Execute este script na pasta raiz do projeto

echo Renomeando imagens com problemas...

REM Renomear arquivo com espaços
if exist "images\variedades\variedades 3 .jpg" (
    ren "images\variedades\variedades 3 .jpg" "variedades3.jpg"
    echo [OK] Renomeado: variedades 3 .jpg -> variedades3.jpg
)

REM Renomear arquivo com espaços
if exist "images\kit-termico\cooler-termico e porta pratos.png" (
    ren "images\kit-termico\cooler-termico e porta pratos.png" "cooler-termico-e-porta-pratos.png"
    echo [OK] Renomeado: cooler-termico e porta pratos.png -> cooler-termico-e-porta-pratos.png
)

REM Renomear arquivo com espaço antes de COLÉGIO
if exist "images\kit-escolar\KIT_ESCOLAR _COLÉGIO_UMBRELLA.png" (
    ren "images\kit-escolar\KIT_ESCOLAR _COLÉGIO_UMBRELLA.png" "kit-escolar-colegio-umbrella.png"
    echo [OK] Renomeado: KIT_ESCOLAR _COLÉGIO_UMBRELLA.png -> kit-escolar-colegio-umbrella.png
)

REM Renomear arquivo com maiúsculas
if exist "images\kit-escolar\KIT_ESCOLAR_EFRATA.png" (
    ren "images\kit-escolar\KIT_ESCOLAR_EFRATA.png" "kit-escolar-efrata.png"
    echo [OK] Renomeado: KIT_ESCOLAR_EFRATA.png -> kit-escolar-efrata.png
)

REM Renomear arquivo na pasta com espaços
if exist "images\mochila corporate max\pegueot site.png" (
    ren "images\mochila corporate max\pegueot site.png" "pegueot-site.png"
    echo [OK] Renomeado: pegueot site.png -> pegueot-site.png
)

REM Renomear pasta com espaços (precisa mover arquivo primeiro)
if exist "images\mochila corporate max\pegueot-site.png" (
    if not exist "images\mochila-corporate-max" mkdir "images\mochila-corporate-max"
    move "images\mochila corporate max\pegueot-site.png" "images\mochila-corporate-max\pegueot-site.png"
    rmdir "images\mochila corporate max"
    echo [OK] Pasta renomeada: mochila corporate max -> mochila-corporate-max
)

REM Renomear arquivo com M maiúsculo
if exist "images\maleta\Maleta.jpg" (
    ren "images\maleta\Maleta.jpg" "maleta.jpg"
    echo [OK] Renomeado: Maleta.jpg -> maleta.jpg
)

REM Renomear arquivo tudo maiúsculo
if exist "images\bolsa-viagem\BOLSA_VIAGEM_MATELASSÊ.png" (
    ren "images\bolsa-viagem\BOLSA_VIAGEM_MATELASSÊ.png" "bolsa-viagem-matelasse.png"
    echo [OK] Renomeado: BOLSA_VIAGEM_MATELASSÊ.png -> bolsa-viagem-matelasse.png
)

echo.
echo Concluido! Agora execute as correcoes nos arquivos HTML.
pause

