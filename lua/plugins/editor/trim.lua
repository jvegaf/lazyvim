return {
  'cappyzawa/trim.nvim',
  event = 'BufWrite',
  opts = {
    trim_on_write = true,
    trim_trailing = true,
    trim_last_line = false,
    trim_first_line = false,
    -- ft_blocklist = { "markdown", "text", "org", "tex", "asciidoc", "rst" },
    -- patterns = {[[%s/\(\n\n\)\n\+/\1/]]}, -- Only one consecutive bl
  },
}