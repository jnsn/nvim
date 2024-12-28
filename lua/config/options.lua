vim.opt.conceallevel = 0

if jit.os == "Windows" then
  if vim.fn.executable("pwsh") then
    LazyVim.terminal.setup("pwsh")
  end
end
