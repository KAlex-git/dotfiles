""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" TODO easymotion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	"" // отключаем зависимость от регистра
	   let g:EasyMotion_smartcase = 1
	"" // отключаем тень (в момент выбора цели весь текст помечается как комментарий)
	   let g:EasyMotion_do_shade = 0
	"" // какой группой подсвечивать цели
	   hi link EasyMotionTarget Search
	"" find symbol - переместиться к любому символу в файле
	   nmap fs <Plug>(easymotion-s)
	"" find line - переместиться к любому символу в строке
	   nmap fl <Plug>(easymotion-sl)
	 ""hi EasyMotionTarget2First ctermfg=202 ctermbg=None cterm=None
	 ""hi EasyMotionTarget2Second ctermfg=202 ctermbg=None cterm=None
	  hi EasyMotionTarget ctermbg=none ctermfg=green
          hi EasyMotionShade  ctermbg=none ctermfg=blue
          hi EasyMotionTarget2First ctermbg=none ctermfg=red
          hi EasyMotionTarget2Second ctermbg=none ctermfg=lightred
          hi EasyMotionMoveHL ctermbg=green ctermfg=black
          hi EasyMotionIncSearch ctermbg=green ctermfg=black
""" test
"map <leader><leader>. <Plug>(easymotion-repeat)
"map <leader><leader>f <Plug>(easymotion-overwin-f)
"map <leader><leader>j <Plug>(easymotion-overwin-line)
"map <leader><leader>k <Plug>(easymotion-overwin-line)
"map <leader><leader>w <Plug>(easymotion-overwin-w)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
	"" // gU {motion} - для преобрaзования фрагмента текста в верхний регистр
	"" // gUgn (gn) - Если курсор назодится в пределах совпадения, тогда
	"" //	команда 'gn' будет текущее совпадения
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

