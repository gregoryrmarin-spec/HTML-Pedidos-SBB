# Instruções permanentes para o Codex neste repositório

Este repositório é um catálogo HTML simples publicado no GitHub Pages.

## Regras de segurança

- Nunca imprima GH_TOKEN.
- Nunca rode echo $GH_TOKEN.
- Nunca coloque token no remote.
- Nunca salve token em arquivo.
- Nunca altere permissões, secrets ou tokens sem pedido explícito.

## Remote Git

Antes de buscar ou enviar alterações, garanta que o remote origin está configurado:

git remote remove origin 2>/dev/null || true
git remote add origin https://github.com/gregoryrmarin-spec/Catalogo.SBB.git

## Quando eu pedir alteração real no catálogo

Depois de editar os arquivos:

1. rode git status;
2. valide HTML/CSS/JS de forma simples, sem instalar ferramentas pesadas;
3. se index.html ou outro HTML foi alterado, valide com uma leitura simples usando Python;
4. faça git add dos arquivos alterados;
5. crie um commit claro em português;
6. rode git fetch origin main;
7. faça rebase com origin/main se necessário;
8. envie para o GitHub com:
   git push origin HEAD:main

## Testes simples

Quando eu pedir alteração simples em HTML, CSS ou JS:

- não instale Playwright;
- não tire screenshot, a menos que eu peça;
- não use html-validate se ele não estiver instalado;
- valide apenas com uma checagem simples de leitura do HTML usando Python;
- depois faça commit e push normalmente.

## Quando NÃO publicar

Se eu pedir apenas análise, teste, explicação ou diagnóstico, não faça commit e não faça push, a menos que eu peça explicitamente.

## Se algo quebrar

Se git fetch, git push, autenticação, remote origin ou GitHub Pages falharem, consulte primeiro o arquivo CODEX_REPAIR.md deste repositório, se ele existir, e siga o diagnóstico correspondente.

Não tente adivinhar token.
Não imprima GH_TOKEN.
Não rode echo $GH_TOKEN.
Não coloque token no remote.
Não salve token em arquivo.
Se o erro envolver autenticação, explique o erro e pare depois de seguir o diagnóstico seguro.

## Resposta final obrigatória

Ao terminar uma alteração publicada, diga:

- quais arquivos foram alterados;
- o que foi mudado;
- qual foi a mensagem do commit;
- se o push para main foi concluído;
- onde devo olhar no site para confirmar.

Depois:
1. rode git status;
2. faça git add AGENTS.md;
3. crie o commit:
   Add permanent Codex instructions
4. rode git fetch origin main;
5. faça rebase com origin/main se necessário;
6. faça push com:
   git push origin HEAD:main

Não altere index.html.
Não imprima GH_TOKEN.
Não rode echo $GH_TOKEN.
Não coloque token no remote.
