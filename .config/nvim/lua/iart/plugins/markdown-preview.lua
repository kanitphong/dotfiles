return {
  'iamcco/markdown-preview.nvim',
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  ft = { 'markdown' },
  build = function()
    vim.fn['mkdp#util#install']()
  end,
  config = function()
    vim.g.mkdp_auto_start = 1
    vim.g.mkdp_auto_close = 1
    vim.g.mkdp_refresh_slow = 0
    vim.g.mkdp_command_for_global = 0
    vim.g.mkdp_open_to_the_world = 0
    vim.g.mkdp_open_ip = ''
    vim.g.mkdp_browser = ''
    vim.g.mkdp_echo_preview_url = 0
    vim.g.mkdp_browserfunc = ''
    vim.g.mkdp_markdown_css = ''
    vim.g.mkdp_highlight_css = ''
    vim.g.mkdp_port = '8080'
    vim.g.mkdp_page_title = '「${name}」'
    vim.g.mkdp_filetypes = { 'markdown' }
    vim.api.nvim_set_keymap('n', '<leader>mm', '<Cmd>MarkdownPreviewToggle<CR>', { noremap = true, silent = true })
  end,
}
