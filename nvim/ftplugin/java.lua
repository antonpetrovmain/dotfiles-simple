local config = {
  cmd = { os.getenv 'HOME' .. '/.local/bin/jdtls' },
  root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
  init_options = {
    bundles = {
      vim.fn.glob(os.getenv 'HOME' .. '/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar', 1),
    },
  },
}
require('jdtls').start_or_attach(config)
