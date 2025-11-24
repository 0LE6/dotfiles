local M = {}

-- Commit staged files
function M.commit()
    local staged_files = vim.fn.systemlist("git diff --cached --name-only")
    if vim.tbl_isempty(staged_files) then
        print("⚠ No files staged for commit")
        return
    end

    local msg = vim.fn.input("Commit message: ")
    if msg ~= "" then
        vim.fn.system({ "git", "commit", "-m", msg })
        print("Commit done: " .. msg)
    else
        print("⚠ Commit cancelled: empty message")
    end
end

-- Push current branch
function M.push()
    local branch = vim.fn.trim(vim.fn.system("git rev-parse --abbrev-ref HEAD"))
    vim.fn.system({ "git", "push", "origin", branch })
    print("Pushed to branch: " .. branch)
end

-- Pull current branch
function M.pull()
    local branch = vim.fn.trim(vim.fn.system("git rev-parse --abbrev-ref HEAD"))
    vim.fn.system({ "git", "pull", "origin", branch })
    print("Pulled from branch: " .. branch)
end

-- Fetch
function M.fetch()
    vim.fn.system({ "git", "fetch" })
    print("Fetch completed")
end

return M

