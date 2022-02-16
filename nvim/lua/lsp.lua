-- local completion = require('completion')
local compe = require('compe')
local nvim_lsp = require('lspconfig')
local tree_sitter_configs = require('nvim-treesitter.configs')

local on_attach = function(client)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- completion.on_attach(client)
    -- vim.g.completion_enable_snippet = 'UltiSnips'

    -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
    -- buf_set_option('completeopt', 'menu,menuone,noselect')

    -- Mappings.
    local opts = { noremap=true, silent=true }
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<leader>k', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<leader>ld', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
            hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
            hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
            hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
            augroup lsp_document_highlight
                autocmd!
                autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
        ]], false)
    end
end

compe.setup {
    enabled = true;
    debug = false;
    min_length = 1;
    preselect = 'enable';
    source = {
        path = true;
        buffer = true;
        vsnip = true;
        nvim_lsp = true;
    };
}

tree_sitter_configs.setup {
    ensure_installed = { "python", "go", "lua", "toml", "yaml" },
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
        smart_rename = {
            enable = true,
            keymaps = {
                smart_rename = "grr",
            },
        },
    },
}

-- nvim_lsp.pyls.setup {
--     settings = {
--         pyls = {
--             plugins = {
--                 pycodestyle = { enabled = true; maxLineLength = 120; };
--                 pyflakes = { enabled = true; };
--                 pyls_mypy = { enabled = true; live_mode = false; };
--                 yapf = { enabled = false; };
--                 pylint = { enabled = false; };
--             };
--         };
--     };
--     on_attach = on_attach;
-- }
-- nvim_lsp.pyright.setup{
--     on_attach = on_attach;
--     settings = {
--         python = {
--             analysis = {
--                 useLibraryCodeForTypes = true
--             }
--         }
--     }
-- }

nvim_lsp.gopls.setup{
    on_attach = on_attach;
}

nvim_lsp.tsserver.setup{
    on_attach = on_attach;
}

nvim_lsp.yamlls.setup{
    on_attach = on_attach;
}

nvim_lsp.dockerls.setup{
    on_attach = on_attach;
}


-- galaxyline
local gl = require('galaxyline')

function is_buffer_empty()
    -- Check whether the current buffer is empty
    return vim.fn.empty(vim.fn.expand('%:t')) == 1
end

function has_width_gt(cols)
    -- Check if the windows width is greater than a given number of columns
    return vim.fn.winwidth(0) / 2 > cols
end


local gls = gl.section
gl.short_line_list = {'dirvish'}

local colors = {
    bg = '#282c34',
    fg = '#aab2bf',
    section_bg = '#38393f',
    blue = '#61afef',
    green = '#98c379',
    purple = '#c678dd',
    orange = '#e5c07b',
    red1 = '#e06c75',
    red2 = '#be5046',
    yellow = '#e5c07b',
    gray1 = '#5c6370',
    gray2 = '#2c323d',
    gray3 = '#3e4452',
    darkgrey = '#5c6370',
    grey = '#848586',
    middlegrey = '#8791A5'
}

-- Local helper functions
local buffer_not_empty = function() return not is_buffer_empty() end

local checkwidth = function()
    return has_width_gt(35) and buffer_not_empty()
end

local function has_value(tab, val)
    for index, value in ipairs(tab) do
        if value[1] == val then return true end
    end
    return false
end

local mode_color = function()
    local mode_colors = {
        [110] = colors.green,
        [105] = colors.blue,
        [99] = colors.green,
        [116] = colors.blue,
        [118] = colors.purple,
        [22] = colors.purple,
        [86] = colors.purple,
        [82] = colors.red1,
        [115] = colors.red1,
        [83] = colors.red1
    }

    mode_color = mode_colors[vim.fn.mode():byte()]
    if mode_color ~= nil then
        return mode_color
    else
        return colors.purple
    end
end

local function file_readonly()
    if vim.bo.filetype == 'help' then return '' end
    if vim.bo.readonly == true then return '  ' end
    return ''
end

local function get_current_file_name()
    local file = vim.fn.expand('%:t')
    if vim.fn.empty(file) == 1 then return '' end
    if string.len(file_readonly()) ~= 0 then return file .. file_readonly() end
    if vim.bo.modifiable then
        if vim.bo.modified then return file .. '  ' end
    end
    return file .. ' '
end

local function trailing_whitespace()
    local trail = vim.fn.search('\\s$', 'nw')
    if trail ~= 0 then
        return '  '
    else
        return nil
    end
end

local function tab_indent()
    local tab = vim.fn.search('^\\t', 'nw')
    if tab ~= 0 then
        return ' → '
    else
        return nil
    end
end

local function buffers_count()
    local buffers = {}
    for _, val in ipairs(vim.fn.range(1, vim.fn.bufnr('$'))) do
        if vim.fn.bufexists(val) == 1 and vim.fn.buflisted(val) == 1 then
            table.insert(buffers, val)
        end
    end
    return #buffers
end

-- Left side
gls.left[1] = {
    ViMode = {
        provider = function()
            local aliases = {
                [110] = 'N',
                [105] = 'I',
                [99] = 'C',
                [116] = 'T',
                [118] = 'V',
                [22] = 'V-BLOCK',
                [86] = 'V-LINE',
                [82] = 'REPLACE',
                [115] = 'SELECT',
                [83] = 'S-LINE'
            }
            vim.api.nvim_command('hi GalaxyViMode guibg=' .. mode_color())
            alias = aliases[vim.fn.mode():byte()]
            if alias ~= nil then
                if has_width_gt(35) then
                    mode = alias
                else
                    mode = alias:sub(1, 1)
                end
            else
                mode = vim.fn.mode():byte()
            end
            return '  ' .. mode .. ' '
        end,
        highlight = {colors.bg, colors.bg, 'bold'}
    }
}
gls.left[2] = {
    FileIcon = {
        provider = {function() return '  ' end, 'FileIcon'},
        condition = buffer_not_empty,
        highlight = {
            require('galaxyline.provider_fileinfo').get_file_icon,
            colors.section_bg
        }
    }
}
gls.left[3] = {
    FileName = {
        provider = 'FileName',
        condition = buffer_not_empty,
        highlight = {colors.fg, colors.section_bg},
        separator = ' ',
        separator_highlight = {colors.section_bg, colors.bg}
    }
}
gls.left[4] = {
    WhiteSpace = {
        provider = trailing_whitespace,
        condition = buffer_not_empty,
        highlight = {colors.fg, colors.bg}
    }
}
gls.left[5] = {
    TabIndent = {
        provider = tab_indent,
        condition = buffer_not_empty,
        highlight = {colors.fg, colors.bg}
    }
}
gls.left[9] = {
    DiagnosticError = {
        provider = 'DiagnosticError',
        icon = '  ',
        highlight = {colors.red1, colors.bg}
    }
}
gls.left[10] = {
    Space = {
        provider = function() return ' ' end,
        highlight = {colors.section_bg, colors.bg}
    }
}
gls.left[11] = {
    DiagnosticWarn = {
        provider = 'DiagnosticWarn',
        icon = '  ',
        highlight = {colors.orange, colors.bg}
    }
}
gls.left[12] = {
    Space = {
        provider = function() return ' ' end,
        highlight = {colors.section_bg, colors.bg}
    }
}
gls.left[13] = {
    DiagnosticInfo = {
        provider = 'DiagnosticInfo',
        icon = '  ',
        highlight = {colors.blue, colors.section_bg},
        separator = ' ',
        separator_highlight = {colors.section_bg, colors.bg}
    }
}

-- Right side
gls.right[1] = {
    DiffAdd = {
        provider = 'DiffAdd',
        condition = checkwidth,
        icon = '+',
        highlight = {colors.green, colors.bg}
    }
}
gls.right[2] = {
    DiffModified = {
        provider = 'DiffModified',
        condition = checkwidth,
        icon = '~',
        highlight = {colors.orange, colors.bg}
    }
}
gls.right[3] = {
    DiffRemove = {
        provider = 'DiffRemove',
        condition = checkwidth,
        icon = '-',
        highlight = {colors.red1, colors.bg}
    }
}
gls.right[4] = {
    Space = {
        provider = function() return ' ' end,
        highlight = {colors.section_bg, colors.bg}
    }
}
gls.right[5] = {
    GitIcon = {
        provider = function() return '  ' end,
        condition = buffer_not_empty and
            require('galaxyline.provider_vcs').check_git_workspace,
        highlight = {colors.middlegrey, colors.bg}
    }
}
gls.right[6] = {
    GitBranch = {
        provider = 'GitBranch',
        condition = buffer_not_empty,
        highlight = {colors.middlegrey, colors.bg}
    }
}
gls.right[7] = {
    LineColumn = {
        provider = 'LineColumn',
        separator_highlight = {colors.blue, colors.bg},
        highlight = {colors.middlegrey, colors.bg}
    }
}

gls.right[8] = {
    PerCent = {
        provider = 'LinePercent',
        separator = ' ',
        separator_highlight = {colors.blue, colors.bg},
        highlight = {colors.gray2, colors.blue}
    }
}
-- Short status line
gls.short_line_left[1] = {
    FileIcon = {
        provider = {function() return '  ' end, 'FileIcon'},
        condition = function()
            return buffer_not_empty and
                       has_value(gl.short_line_list, vim.bo.filetype)
        end,
        highlight = {
            require('galaxyline.provider_fileinfo').get_file_icon,
            colors.section_bg
        }
    }
}
gls.short_line_left[2] = {
    FileName = {
        provider = get_current_file_name,
        condition = buffer_not_empty,
        highlight = {colors.fg, colors.section_bg},
        separator = '',
        separator_highlight = {colors.section_bg, colors.bg}
    }
}

gls.short_line_right[1] = {
    BufferIcon = {
        provider = 'BufferIcon',
        highlight = {colors.yellow, colors.section_bg},
        separator = '',
        separator_highlight = {colors.section_bg, colors.bg}
    }
}

-- Force manual load so that nvim boots with a status line
gl.load_galaxyline()
