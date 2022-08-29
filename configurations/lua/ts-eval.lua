
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


-- local current_buf = vim.api.nvim_get_current_buf()

local bufnr = -1
local buf_name = "TS Evaluator .. "

vim.api.nvim_create_autocmd("BufwritePost", {
    group = vim.api.nvim_create_augroup("TsEval",  { clear = true}),
    pattern = "*.eval.js",
    callback = function ()

      local file = vim.api.nvim_buf_get_name(0)
      if bufnr == -1 then

        -- create a new window  / split to the right
        vim.api.nvim_command('botright vnew')
        local start_win = vim.api.nvim_get_current_win()
        local buf = vim.api.nvim_create_buf(true, true)
        bufnr = buf
        vim.api.nvim_buf_set_name(buf, buf_name .. buf)
        vim.api.nvim_win_set_buf(start_win, buf)
      end

      -- print(bufnr)


      -- clear the screen
      vim.api.nvim_buf_set_lines(bufnr, 0, -1, false,  {""})

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
