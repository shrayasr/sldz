echo "Hello!"

command! Sldz call s:Sldz()

function! s:Sldz()

  let s:filename=expand("%:p")

  let s:lines=getline(1,'$')
  let s:joinedlines=join(s:lines,"\n")
  let s:pages=split(s:joinedlines,"===")

  bdelete!

  let s:max_pages=len(s:pages) - 1
  let s:current_page=0
  while s:current_page <= s:max_pages

    call append(0, split(s:pages[s:current_page],"\n"))
    enew
    let s:current_page += 1

  endwhile

  bdelete!
  nnoremap [ :bprev<cr>
  nnoremap ] :bnext<cr>
  nnoremap Q :qall!<cr>

  execute ":buffer2"

endfunction
