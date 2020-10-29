local completion = require('completion')
local nvim_lsp = require('nvim_lsp')
local tree_sitter_configs = require('nvim-treesitter.configs')

local mapper = function(mode, key, result)
    vim.fn.nvim_buf_set_keymap(0, mode, key, result, {noremap = true, silent = true})
end

local on_attach = function(client)
    completion.on_attach(client)
    vim.g.completion_enable_snippet = 'UltiSnips'

    mapper('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
    mapper('n', '<c-]>', '<cmd>lua vim.lsp.buf.declaration()<CR>')
    mapper('n', 'gD', '<cmd>lua vim.lsp.buf.implementation()<CR>')
    mapper('n', '1gD', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
    mapper('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
    mapper('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
    mapper('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')
    mapper('n', '<leader>cr', '<cmd>lua vim.lsp.buf.rename()<CR>')
    mapper('n', '<leader>ld', '<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>')

    vim.cmd("setlocal omnifunc=v:lua.vim.lsp.omnifunc")
end

tree_sitter_configs.setup {
    ensure_installed = { "python", "go", "lua" },
    highlight = { enable = true,},
    refactor = {
        highlight_definitions = { enable = true, },
        navigation = {
            enable = true,
            keymaps = {
                goto_definition_lsp_fallback = "gd",
                list_definitions = "gnD",
                goto_next_usage = "<a-*>",
                goto_previous_usage = "<a-#>",
            },
        },
    },
}

nvim_lsp.pyls.setup {
    settings = {
        pyls = {
            plugins = {
                pycodestyle = { enabled = true; maxLineLength = 120; };
                pyflakes = { enabled = true; };
                pyls_mypy = { enabled = true; live_mode = false; };
                yapf = { enabled = false; };
                pylint = { enabled = false; };
            };
        };
    };
    on_attach = on_attach;
}

nvim_lsp.gopls.setup{
    on_attach = on_attach;
}

nvim_lsp.tsserver.setup{
    on_attach = on_attach;
}

nvim_lsp.yamlls.setup{
    on_attach = on_attach;
}
