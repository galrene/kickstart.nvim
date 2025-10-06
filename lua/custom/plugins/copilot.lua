return {
  'github/copilot.vim',
  lazy = false,
  config = function()
    vim.g.copilot_no_tab_map = true
    vim.g.copilot_assume_mapped = true
    vim.cmd 'Copilot disable' -- Start with Copilot disabled

    vim.api.nvim_create_user_command('CopilotToggle', function()
      local enabled = vim.g.copilot_enabled or false
      if enabled then
        vim.cmd 'Copilot disable'
        vim.g.copilot_enabled = false
        print 'GitHub Copilot disabled'
      else
        vim.cmd 'Copilot enable'
        vim.g.copilot_enabled = true
        print 'GitHub Copilot enabled'
      end
    end, {})

    vim.keymap.set('n', '<C-A-;>', ':CopilotToggle<CR>', { noremap = true, silent = true })
    vim.keymap.set('i', '<C-;>', 'copilot#Accept("\\<CR>")', {
      expr = true,
      replace_keycodes = false,
      noremap = true,
      silent = true,
    })
  end,
}
