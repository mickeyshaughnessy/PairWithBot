syntax on

function! ChatGPTComplete()
    " Modify the following line to call your assistant with the current line as input
    let current_line = shellescape(getline('.'))
    let output = system('python my_completion_script.py ' . current_line)

    " Check if the output is empty or the script encountered an error
    if !empty(output) && v:shell_error == 0
        " Insert the assistant's output at the cursor position
        let save_cursor_pos = getcurpos()
        call setline('.', getline('.') . output)
        call setpos('.', save_cursor_pos)
    endif
endfunction

" Bind the Tab key to trigger the ChatGPTComplete function
inoremap <Tab> <C-o>:call ChatGPTComplete()<CR>
