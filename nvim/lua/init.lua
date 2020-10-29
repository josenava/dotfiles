local ok, _ = pcall(function() require('lsp') end)

if not ok then
    print("Not ok")
else
    print("hey")
end
