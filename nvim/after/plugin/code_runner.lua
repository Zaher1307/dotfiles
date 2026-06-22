require('code_runner').setup {
    mode = 'term',
    focus = true,
    term = {
        size = 11
    },
    filetype = {
        go = 'go run $fileName',
        javascript = 'node $fileName',
        rust = 'rustc $fileName && ./$fileNameWithoutExt && rm $fileNameWithoutExt',
        c = 'gcc $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt && rm $fileNameWithoutExt',
        cpp = 'g++ $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt && rm $fileNameWithoutExt',
        python = 'python $fileName',
        java = 'javac $fileName && java test && rm test.class',
    },

    vim.keymap.set('n', '<F4>', ':w<CR>:RunCode<CR>i', { noremap = true, silent = true }),
    vim.keymap.set('n', '<F16>', ':RunClose<CR>', { noremap = true, silent = true }),
}
