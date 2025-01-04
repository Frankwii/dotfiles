local M={}

M.python= function ()
      -- Check if a virtual environment is currently activated
    local venv_path = os.getenv("VIRTUAL_ENV")
    if venv_path then
        return venv_path .. "/bin/python"
    end

    -- Check for a project-specific virtual environment (.venv)
    local cwd = vim.fn.getcwd()
    local project_venv = cwd .. "/.venv/bin/python"
    if vim.fn.executable(project_venv) == 1 then
        return project_venv
    end

    -- Fallback to the system-wide Python
    return "python"
end

return M
