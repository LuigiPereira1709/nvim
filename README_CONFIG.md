# 🧠 Neovim Config: Manual de Referência e Contexto Técnico

Este documento fornece o contexto completo necessário para entender, instalar e modificar esta configuração do Neovim. Ele foi estruturado para servir de guia para humanos e de **contexto para IAs (LLMs)**.

---

## 🚀 1. Filosofia e Arquitetura
Esta é uma configuração **modular, moderna e focada em automação**.
- **Gerenciador de Plugins**: `lazy.nvim` (carregamento sob demanda).
- **Instalação de Ferramentas**: `mason.nvim` + `mason-tool-installer` (automação total de binários).
- **UI & UX**: Focada em performance e estética limpa, utilizando `telescope`, `nvim-tree` (lateral) e `noice`.

---

## 📦 2. Dependências de Sistema
Para que esta configuração funcione em um OS limpo, instale os seguintes pacotes:

### A. Base Essencial
- **Neovim ≥ 0.10**: Necessário para suporte às APIs de LSP estáveis.
- **Git, Make, GCC/Clang**: Necessários para clonar e compilar plugins (ex: `telescope-fzf-native`).
- **Ripgrep & FD**: Mecanismos de busca ultra-rápidos para o Telescope.
- **Gettext, Unzip, Wget, Curl**: Utilitários para o Mason baixar e extrair binários.

### B. Runtimes de Linguagem
- **Node.js & npm**: Runtime obrigatório para a maioria dos LSPs (Web, JSON, Bash).
- **Go**: Necessário para ferramentas de sistema e ferramentas Go (`gopls`, `delve`).
- **JDK 17+**: Necessário apenas se for utilizar Java (`jdtls`).

### C. Estética
- **Nerd Font**: Obrigatório para renderização de ícones em toda a interface.

---

## 📂 3. Estrutura do Codebase
A lógica reside em `~/.config/nvim/lua/`:

- `core/`: Configurações globais, variáveis de sistema, cabeçalhos do dashboard e mensagens.
- `plugins/`: Definições de plugins divididas por categoria.
- `mappings.lua`: Atalhos globais (Built-in e Plugins).
- `options.lua`: Configurações de comportamento do Neovim (vim.opt).
- `globals.lua`: Variáveis globais customizadas.

---

## ⌨️ 4. Guia de Hotkeys (Mapeamento Principal)
A tecla **Leader** é o `Espaço`.

### Grupos de Atalhos:
| Atalho | Grupo | Descrição Principal |
|---|---|---|
| `<leader>f` | **Find** | Busca de arquivos, texto (grep), símbolos e projetos. |
| `<leader>l` | **LSP** | Informações, Code Actions, Rename, Diagnósticos. |
| `<leader>b` | **Buffers/Wins** | Navegação e gerenciamento de janelas. |
| `<leader>T` | **Tests** | Rodar testes (Nearest, File, Summary) via Neotest. |
| `<leader>t` | **Terminal** | Toggle de terminais (Floating, Horizontal, Vertical). |
| `<leader>g` | **Git** | Gitsigns, Blame e Diffview. |
| `<leader>d` | **Debug** | Controles do DAP (Breakpoints, Continue, Step). |
| `<leader>p` | **Plugins** | Menu do Lazy.nvim (Sync, Clean, Update). |
| `<leader>o` | **Options** | Toggles de interface (Line numbers, Wrap, CMP). |
| `<leader>s` | **Sessions** | Salvar e carregar sessões de trabalho. |

---

## 🛠️ 5. Automação de Instalação (Mason)
Ao abrir o Neovim pela primeira vez, as seguintes ferramentas são instaladas **automaticamente**:

- **Go**: `gopls`, `delve`, `staticcheck`, `gofumpt`, `revive`.
- **JSON**: `json-lsp`, `fixjson`.
- **Lua**: `lua-language-server`, `stylua`.
- **Web**: `prettier`.

---

## 🤖 6. Instruções para Contexto de Prompt (Para IAs)
1.  **Modularidade**: Sempre use `lua/plugins/...`.
2.  **Mapeamentos**: Sempre adicione `desc` para as keymaps para que o `Which-Key` possa listá-las.
3.  **LSP**: Configurações específicas de servidores LSP devem ir em `lua/plugins/lsp/settings/`.
4.  **Estética**: Esta config prioriza `Noice` para mensagens e `Nvim-Tree` na lateral esquerda.
5.  **Instalação**: Se precisar de uma ferramenta CLI nova, adicione-a ao `mason.lua`.

---

## 🍎 7. Suporte Multi-OS (Linux & macOS)

A configuração foi preparada para ser cross-platform, mas existem detalhes específicos para cada sistema:

### A. Detecção de OS (`lua/core/globals.lua`)
A variável `vim.g.os` é detectada automaticamente:
- No Linux, retorna `"Linux"`.
- No macOS, retorna `"Mac"`.

### B. Caminhos de Binários (DAP)
Alguns interpretadores de Debug (DAP) possuem caminhos fixos que podem variar:

| Ferramenta | Caminho Linux (Padrão) | Caminho macOS (Sugestão) | Arquivo de Config |
|---|---|---|---|
| **Firefox** | `/usr/bin/firefox` | `/Applications/Firefox.app/Contents/MacOS/firefox` | `dap/settings/firefox-debug-adapter.lua` |
| **Bash** | `/bin/bash` | `/bin/zsh` (ou instalar bash via brew) | `dap/settings/bash-debug-adapter.lua` |

### C. Diferenças de Instalação (Brew vs Pacman)
- No **macOS**, use `brew install` para pacotes como `ripgrep`, `fd`, `node`, `go`.
- No **Linux (Arch)**, use `pacman -S`.

> **Dica para IA**: Ao ajustar caminhos de executáveis, utilize a verificação `if vim.g.os == "Mac" then ... else ... end`.
