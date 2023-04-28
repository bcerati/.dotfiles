require('lspconfig').yamlls.setup({
    cmd = { "yaml-language-server", "--stdio" },
    settings = {
        yaml = {
            schemas = {
                ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                kubernetes = '/*.yaml',
            },
            hover = false,
            validate = true,
            completion = true,
            customTags = {
                "!Ref",
                "!GetAtt",
                "!Fn",
                "!And",
                "!If",
                "!Not",
                "!Equals",
                "!Or",
                "!FindInMap sequence",
                "!Base64",
                "!Cidr",
                "!Sub",
                "!GetAZs",
                "!ImportValue",
                "!Select sequence",
                "!Split sequence",
                "!Join sequence",
            },
            format_enable = true,
            keyOrdering = false
        }
    }
})

require'lspconfig'.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = {"vim", "use"},
      },
    },
  },
})
