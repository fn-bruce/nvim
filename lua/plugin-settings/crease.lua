-- crease
vim.api.nvim_exec([[
set fillchars=fold:\ 

function! CreaseIndent() abort
  let fs = nextnonblank(v:foldstart)
  let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
  let foldLevelStr = repeat(' ', match(line,'\S'))
  return foldLevelStr
endfunction

function! FoldTxt() abort
  return trim(substitute(getline(v:foldstart),'\V\C'.join(split(&commentstring, '%s'), '\|') . '\|'.join(split(&foldmarker, ','), '\d\?\|') . '\|'.join(g:foldtext_stop_words, '\|') . '\|','','g'))
endfunction

let g:foldtext_stop_words = ['\^function','!','abort']

let g:crease_foldtext = { 'default': '%{CreaseIndent()}%{FoldTxt()} %= %l lines %f%f%f%f' }
]], true)

-- delimitmate
vim.g.delimitMate_excluded_regions = "Comment,String"

-- matchup
vim.g.loaded_matchit = 1
