# 🧠 Neovim Config: Manual de Referência - Branch MAIN (Full)

Este documento é a "Fonte da Verdade" para a configuração principal (**main**). Ela é mais complexa, produtiva e personalizada que a versão simples, incluindo ferramentas avançadas de diagnóstico, visualização e navegação.

---

## 🚀 1. Filosofia e Diferenciais da Main
Esta versão foca em uma experiência de IDE completa:
- **Navegação Avançada**: `Oil.lua` (edição de arquivos como buffer) e `Telescope` (customizado).
- **UX Refinada**: `Noice` para UI, `Tiny-Inline-Diagnostic` para erros elegantes e `UFO` para folding inteligente.
- **Visualização**: `Markview` e `Helpview` para renderização de Markdown e Ajuda.
- **Debugging & Testes**: Suporte total para Go, JS/TS, Java e Shell.

---

## 📦 2. Dependências de Sistema

### A. Essenciais
- **Neovim ≥ 0.10**
- **Git, Make, GCC/Clang**
- **Ripgrep & FD**
- **SQLite3** (`libsqlite3`) - Necessário para histórico do Telescope.
- **Nerd Font** - Essencial para ícones.

### B. Runtimes
- **Node.js & npm** (Essencial para LSPs Web/JSON/Bash).
- **Go** (Essencial para ferramentas Go e DAP).
- **JDK 17+** (Opcional, para Java/Spring Boot).
- **Python 3** (Alguns plugins podem utilizar).

---

## 📂 3. Organização do Codebase (`lua/`)
- `core/`: Globais, Headers, Mensagens e Autocomandos.
- `plugins/`:
  - `lsp/`: Mason (automação), Lspconfig, Conform (formatters).
  - `tools/dev-tools/`: Neotest (testes), Harpoon, SpringBoot, LeetCode.
  - `tools/navigation/`: Oil, Telescope, Nvim-Tree, Project.
  - `tools/helpers/`: Flash (pulo rápido), Grug-Far (search & replace), Precognition.
  - `ui/enchancement/`: Noice, Dashboard, Treesitter, SmoothCursor.
  - `ui/layout/`: UFO (folding), ZenMode.
  - `ui/statusline/`: Lualine, Bufferline (abas modernas).

---

## 🛠️ 4. Automação Mason (Zero-to-Hero)
A configuração instala automaticamente ao abrir:
- **LSPs**: `gopls`, `vtsls`, `eslint`, `jsonls`, `lua_ls`, `tailwindcss`, `yamlls`, `bashls`, `sqlls`.
- **Tools**: `delve`, `staticcheck`, `gofumpt`, `revive`, `golangci-lint`.
- **Formatters**: `prettier`, `stylua`, `fixjson`, `beautysh`, `sql-formatter`.

---

## ⌨️ 5. Principais Hotkeys (Leader = Espaço)

| Atalho | Grupo | Função |
|---|---|---|
| `<leader>e` | **Explorer** | Nvim-Tree (Lateral). |
| `<leader>O` | **Oil** | Abrir File Explorer como buffer (Oil.lua). |
| `<leader>f` | **Find** | Busca completa (Files, Grep, Git, Todos). |
| `<leader>l` | **LSP** | Sagals (Hover, Rename, Actions, etc). |
| `<leader>T` | **Tests** | Interface do Neotest. |
| `<leader>d` | **Debug** | DAP UI e controles de execução. |
| `<leader>zz` | **Zen** | Ativar Zen Mode. |
| `<leader>/` | **Comment** | Comentar linha/bloco. |
| `<leader>ss` | **Sessions** | Gerenciar sessões de trabalho. |

---

## 🍎 6. Suporte Multi-OS
- **Detecção**: O arquivo `lua/core/globals.lua` detecta `Linux` vs `Mac` automaticamente.
- **DAP**: Verifique caminhos de navegadores em `lua/plugins/dap/settings/` caso use macOS.

---

## 🤖 7. Instruções para Contexto de Prompt (IA)
1. **Consistência**: Mantenha a separação entre `plugins/tools` e `plugins/ui`.
2. **UFO & Folding**: A configuração de folding usa `ufo.nvim`. Não mude via `vim.opt.foldmethod` diretamente.
3. **Diagnósticos**: Usamos `tiny-inline-diagnostic`. Se houver conflito visual, ajuste as opções nele em `lua/plugins/lsp/configs/diagnostics/`.
4. **Novos Atalhos**: Adicione sempre no `mappings.lua` com a descrição correta.
