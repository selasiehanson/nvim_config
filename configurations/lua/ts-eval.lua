local bufnr = 12
-- TOOD
-- create a random buffer and give it a name.
-- get the buffer number and use that throughout
-- if the buffer is deleted , just create another one
--
--
--
-- Features
-- running a c, c++ test suites,
-- building a simple tool like run js

vim.api.nvim_create_autocmd("BufwritePost", {
    group = vim.api.nvim_create_augroup("TsEval",  { clear = true}),
    pattern = "*.eval.js",
    callback = function ()
      vim.api.nvim_buf_set_lines(bufnr, 0, -1, false,  {"out of file:"})
      local file = vim.api.nvim_buf_get_name(0)
      vim.fn.jobstart({"node", file}, {
          stdout_buffered  = true,

          on_stdout = function (_, data)

            if data then
              vim.api.nvim_buf_set_lines(bufnr, -1, -1, false,  data)
            end

          end,

          on_stderr = function (_, data)
            if data then
              vim.api.nvim_buf_set_lines(bufnr, -1, -1, false,  data)
            end
          end
        })
    end
  })
