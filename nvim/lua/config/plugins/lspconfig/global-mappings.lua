local function default_mapping_opts(desc)
  return { noremap = true, silent = true, desc=desc }
end

local function supported_mapping(client, method, mapping)
  if client.supports_method(method) then
    vim.keymap.set(mapping.mode, mapping.lhs, mapping.rhs, mapping.opts)
  end
end

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    -- Rename
    supported_mapping(client, "textDocument/rename", {
      mode = "n",
      lhs = "<leader>cr",
      rhs = vim.lsp.buf.rename,
      opts = default_mapping_opts("Refactor")
    })

    -- Go to Definition
    supported_mapping(client, "textDocument/definition", {
      mode = "n",
      lhs = "<leader>cd",
      rhs = vim.lsp.buf.definition,
      opts = default_mapping_opts("Go to definition")
    })

    -- Hover Documentation
    supported_mapping(client, "textDocument/hover", {
      mode = "n",
      lhs = "<leader>ch",
      rhs = vim.lsp.buf.hover,
      opts = default_mapping_opts("Hover")
    })

    -- Signature Help
    supported_mapping(client, "textDocument/signatureHelp", {
      mode = "n",
      lhs = "<leader>cs",
      rhs = vim.lsp.buf.signature_help,
      opts = default_mapping_opts("Signature help")
    })

    -- Go to Implementation
    supported_mapping(client, "textDocument/implementation", {
      mode = "n",
      lhs = "<leader>ci",
      rhs = vim.lsp.buf.implementation,
      opts = default_mapping_opts("Go to implementation")
    })

    -- Go to Type Definition
    supported_mapping(client, "textDocument/typeDefinition", {
      mode = "n",
      lhs = "<leader>ct",
      rhs = vim.lsp.buf.type_definition,
      opts = default_mapping_opts("Type definition")
    })

    -- Show Diagnostics
    vim.keymap.set("n", "<leader>co", vim.diagnostic.open_float, default_mapping_opts("Open diagnostics"))

    -- Go to Next Diagnostic
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, default_mapping_opts("Previous diagnostic"))

    -- Go to Previous Diagnostic
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, default_mapping_opts("Next diagnostic"))

    -- Show References
    supported_mapping(client, "textDocument/references", {
      mode = "n",
      lhs = "<leader>cf",
      rhs = vim.lsp.buf.references,
      opts = default_mapping_opts("Where is this used")
    })

    -- Code Actions
    supported_mapping(client, "textDocument/codeAction", {
      mode = "n",
      lhs = "<leader>ca",
      rhs = vim.lsp.buf.code_action,
      opts = default_mapping_opts("Code action")
    })
  end
})








-- local function supported_mapping_which_key(client, method, mapping)
--   if client.supports_method(method) then
--     require("which-key").add(
--       {mapping.lhs,mapping.rhs,desc=mapping.desc}
--     )
--   end
-- end
--
-- vim.api.nvim_create_autocmd('LspAttach', {
--   callback = function(args)
--
--     require("which-key").add({"<leader>c",group="LSP Client"})
--     local client = vim.lsp.get_client_by_id(args.data.client_id)
--     -- Rename
--     supported_mapping_which_key(client, "textDocument/rename", {
--       lhs = "<leader>cr",
--       rhs = vim.lsp.buf.rename,
--       desc = "Refactor current"
--     })
--
--     -- Go to Definition
--     supported_mapping_which_key(client, "textDocument/definition", {
--       lhs = "<leader>cd",
--       rhs = vim.lsp.buf.definition,
--       desc = "Go to definition"
--     })
--
--     -- Hover Documentation
--     supported_mapping_which_key(client, "textDocument/hover", {
--       lhs = "<leader>ch",
--       rhs = vim.lsp.buf.hover,
--       desc = "Hover info"
--     })
--
--     -- Signature Help
--     supported_mapping_which_key(client, "textDocument/signatureHelp", {
--       lhs = "<leader>cs",
--       rhs = vim.lsp.buf.signature_help,
--       desc = "Signature info"
--     })
--
--     -- Go to Implementation
--     supported_mapping_which_key(client, "textDocument/implementation", {
--       lhs = "<leader>ci",
--       rhs = vim.lsp.buf.implementation,
--       desc = "Go to implementation"
--     })
--
--     -- Go to Type Definition
--     supported_mapping_which_key(client, "textDocument/typeDefinition", {
--       lhs = "<leader>ct",
--       rhs = vim.lsp.buf.type_definition,
--       desc = "Go to type definition"
--     })
--
--     -- Show References
--     supported_mapping_which_key(client, "textDocument/references", {
--       lhs = "<leader>cf",
--       rhs = vim.lsp.buf.references,
--       desc = "Uses of current"
--     })
--
--     -- Code Actions
--     supported_mapping_which_key(client, "textDocument/codeAction", {
--       lhs = "<leader>ca",
--       rhs = vim.lsp.buf.code_action,
--       desc = "Code action"
--     })
--   end
-- })
