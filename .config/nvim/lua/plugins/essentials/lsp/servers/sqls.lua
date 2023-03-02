local M = {}

M.settings = {
  sqls = {
    connections = {
      -- {
      --   driver = 'postgresql',
      --   host = "localhost",
      --   port = 5432,
      --   user = "postgres",
      --   passwd = "postgres",
      --   dbName = "castor",
      --   proto = "tcp",
      -- },
      {
        driver = "postgresql",
        alias = "castor",
        dataSourceName = "host=localhost port=5432 user=postgres password=postgres dbname=castor",
        proto = "tcp",
      },
    },
  },
}


M.on_attach = function(client, bufnr)
  require('sqls').on_attach(client, bufnr)
  client.server_capabilities.documentFormattingProvider = false
end

return M
