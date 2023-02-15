# Pokedex APP

Aplicativo para ver as variações do Ativo PETR4.

## Como rodar?
### Modo 1 - EASY

Instalar este <a href="https://github.com/vitoriassia/variacao-do-ativo/blob/master/assets/app/app.apk">APK</a>  em seu celular android.

### Modo 2 - HARD rsrs 
 1-> Instalar o <a href="https://flutter.dev/docs/get-started/install">Flutter</a> na sua máquina.

 2-> E rodar o comando abaixo no diretório do projeto:
 
 ## Modo DEBUG
 ```console

foo@terminal:~$ flutter run -t 'lib/main.prod.dart'

```
## Modo RELEASE
```console

foo@terminal:~$ flutter run -t 'lib/main.prod.dart' --release

```


## OBSERVACOES SOBRE O TESTE:

 -> Ao buscar o ativo, vocês solicitaram que pegasse nos ultimos 30 dias a variação do ativo.
    mas no array timestamp convertendo em DateTime com dart ou através do  <a href="https://www.epochconverter.com/">Site de conversão</a> 
    verifiquei que a diferença entre o ultimo array e o primeiro é de 7 horas. Então não consegui identificar uma maneira de pegar os
    30 dias, mantendo dentro do APP os 30 primeiros itens do array.
    
