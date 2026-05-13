# Manual de reparo do Codex

Este arquivo explica como diagnosticar e corrigir problemas quando o Codex não conseguir publicar alterações no GitHub.

## 1. Teste rápido

Rode:

cd /workspace/Catalogo.SBB
git status
git remote -v
git fetch origin main
git push origin HEAD:main

Resultado esperado:

Everything up-to-date

ou push concluído com sucesso.

## 2. Se aparecer: fatal: could not read Username

Causa provável:
GH_TOKEN não está disponível no ambiente atual do Codex.

Como corrigir:
1. Abrir o ambiente do Codex deste repositório.
2. Conferir se existe Environment Variable chamada GH_TOKEN.
3. Conferir se existe Environment Variable chamada GIT_TERMINAL_PROMPT com valor 0.
4. Conferir se o script de configuração cria /tmp/git-askpass-github.
5. Resetar cache.
6. Abrir nova tarefa.

Nunca imprimir GH_TOKEN.
Nunca rodar echo $GH_TOKEN.

## 3. Se aparecer: origin does not appear to be a git repository

Causa provável:
O remote origin não está configurado.

Correção:

git remote remove origin 2>/dev/null || true
git remote add origin https://github.com/gregoryrmarin-spec/Catalogo.SBB.git
git fetch origin main

## 4. Se aparecer: Permission denied ou 403

Causa provável:
Token sem permissão, token expirado, token revogado ou branch protegida.

Como corrigir:
1. Verificar se o token do GitHub ainda existe.
2. Verificar se o token tem permissão de escrita no repositório.
3. Se for token classic, conferir se tem repo e workflow.
4. Se for fine-grained token, conferir se este repositório está liberado e se Contents está como Read and write.
5. Salvar o novo token como GH_TOKEN no ambiente do Codex.
6. Resetar cache.
7. Abrir nova tarefa.

## 5. Se aparecer: non-fast-forward

Causa provável:
A branch main do GitHub tem mudanças que a tarefa local ainda não tem.

Correção:

git fetch origin main
git rebase origin/main
git push origin HEAD:main

## 6. Se o site não atualizar

Causa provável:
GitHub Pages ainda está processando ou cache do navegador.

Como verificar:
1. Esperar 1 a 3 minutos.
2. Atualizar a página.
3. Fechar e abrir a aba.
4. Conferir se o commit apareceu no GitHub.
5. Conferir configurações do GitHub Pages.

## 7. Regra de segurança

Nunca colocar token no código.
Nunca colocar token no remote.
Nunca salvar token em arquivo.
Nunca colar token no chat.
