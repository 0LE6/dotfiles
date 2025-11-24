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
        print("Commit done → " .. msg)
    else
        print("⚠ Commit cancelled: empty message")
    end
end

-- Undo last commit (soft reset, keep changes staged)
function M.undo_last_commit()
    -- Get last commit message
    local last_commit_msg = vim.fn.systemlist(
        { "git", "log", "-1", "--pretty=%B" }
    )
    if #last_commit_msg == 0 then
        print("⚠ No commits found to undo")
        return
    end

    print("Last commit message:\n" .. table.concat(last_commit_msg, "\n"))

    -- Confirm action
    local confirm = vim.fn.input("Undo last commit? [y/N]: ")
    if confirm:lower() ~= "y" then
        print("⚠ Undo cancelled")
        return
    end

    -- Perform soft reset
    local result = vim.fn.systemlist({ "git", "reset", "--soft", "HEAD~1" })
    local code = vim.v.shell_error

    if code == 0 then
        print("↩ Last commit undone, changes are staged")
    else
        print("⚠ Failed to undo last commit:")
        print(table.concat(result, "\n"))
    end
end

-- Push current branch
function M.push()
    local branch = vim.fn.trim(vim.fn.system("git rev-parse --abbrev-ref HEAD"))
    vim.fn.system({ "git", "push", "origin", branch })
    print("Pushed to branch →  " .. branch)
end

-- Pull current branch
function M.pull()
    local branch = vim.fn.trim(vim.fn.system("git rev-parse --abbrev-ref HEAD"))
    vim.fn.system({ "git", "pull", "origin", branch })
    print("Pulled from branch →  " .. branch)
end

-- Fetch
function M.fetch()
    vim.fn.system({ "git", "fetch" })
    print("Fetch completed!")
end

return M

