set shiftwidth=2 
set tabstop=2
"set softtabstop=1 
"set expandtab 
"set shiftwidth=4 
"set smarttab "set tab size
"set autoindent
"set smartindent
" `F5' runs `make'
setlocal spell spelllang=en_us "spell checking
set spellfile=~/.vim/spell/mylatex.dic.add "dictionary for spell check for tex files
"nnoremap <silent> <F4> :w<CR>:make<CR>:cw<CR>
" `Shift-F5' runs `make clean'
""""""""
function! GetEnvName(EnvArg) "gets theName of the environement
		let lastChar=a:EnvArg[len(a:EnvArg)-2:len(a:EnvArg)-1]
		if lastChar == "st"
				let firstChars=a:EnvArg[0:len(a:EnvArg)-3]
		else
				let firstChars=a:EnvArg[0:len(a:EnvArg)-1]
		endif
		if firstChars == "al"
				let EnvName = firstChars."ign"
		elseif firstChars == "alg"
				let EnvName = firstChars."orithm"
		elseif firstChars == "cen"
				let EnvName = firstChars."ter"
		elseif firstChars == "enum"
				let EnvName = firstChars."erate"
		elseif firstChars =="eq"
				let EnvName = firstChars."uation"
		elseif firstChars =="exam"
				let EnvName = firstChars."ple"
		elseif firstChars == "fig"
				let EnvName = firstChars."ure"
		elseif firstChars == "item"
				let EnvName = firstChars."ize"
		elseif firstChars == "lem"
				let EnvName = firstChars."ma"
		elseif firstChars == "proo"
				let EnvName = firstChars."f"
		elseif firstChars == "prop"
				let EnvName = firstChars."osition"
		elseif firstChars == "rem"
				let EnvName = firstChars."ark"
		elseif firstChars == "tab"
				let EnvName = firstChars."le"
		elseif firstChars == "theo"
				let EnvName = firstChars."rem"
		elseif firstChars == "tikz"
				let EnvName = firstChars."picture"
		else
				let EnvName = firstChars
		endif
		if lastChar == "st"
				let EnvName=EnvName."*"
		endif
		return EnvName
endfunction
"""""""""""""""""""""""""""""""""""""""""""
"function! CreateEnv(EnvArg) "create the environment
"let EnvName=GetEnvName(a:EnvArg) 	
"    execute ":normal i\\begin{" . EnvName . "}\n\\end{" . EnvName . "}"
"    execute ":normal O"
"endfunction
"com! -range -nargs=1 Env call CreateEnv("<args>")
"""""""""""""""""""""""""""""""""""""""""""
:command! -range   Al      call ReplaceBlock("al")              "align
:command! -range   Alg     call ReplaceBlock("alg")             "algorithm
:command! -range   Alst    call ReplaceBlock("alst")            "align*
:command! -range   Cap     call AddCaption()                    "caption
:command! -range   Cen     call ReplaceBlock("cen")             "center*
:command! -range   Enum    call ReplaceBlock("enum")            "enumerate*
:command! -range   Eq      call ReplaceBlock("eq")              "equation*
:command! -range   Eqst    call ReplaceBlock("eqst")            "equation*
:command! -range   Exam    call ReplaceBlock("example")         "example
:command! -range   Fig     call ReplaceBlock("fig")             "figure*
:command! -range   Figst   call ReplaceBlock("figst")           "figure*
:command! -range   Item    call ReplaceBlock("item")            "itemize
:command! -range   Lab     call AddLabel("")                    "label
:command! -range   Lem     call ReplaceBlock("lem")             "lemma
:command! -range   Proo    call ReplaceBlock("proo")            "proof
:command! -range   Prop    call ReplaceBlock("prop")            "proposition
:command! -range   Rem     call ReplaceBlock("rem")             "remark
:command! -range   Subeq   call AddSubEqEnv()                   "subeqation
:command! -nargs=1 Subfig  call s:AddSubFigEnv(<f-args>)        "subfigure
:command! -range   Theo    call ReplaceBlock("theo")            "thoerem
:command! -range   Tikz    call ReplaceBlock("tikz")            "tikzpicture
:command! -range   Tkz     call ReplaceBlock("tikz")            "tikzpicture
:command! -range   Tab     call ReplaceBlock("tab")             "table

""""""""""""""""""""""""" Add Begin
function! AddBegin(EnvArg)
		execute ":normal o\\begin{".a:EnvArg."}"
endfunction
""""""""""""""""""""""""" Add End
function! AddEnd(EnvArg)
		execute ":normal o\\end{".a:EnvArg."}"
endfunction
""""""""""""""""""""""""" Add insertfig
function! AddInsertFig(SizeArg)
		let firstChar=a:SizeArg[0]
		if firstChar =="s"
    	execute ":normal o\\insertfig[\\".a:SizeArg."]{}"
		else
    	execute ":normal o\\insertfig[".a:SizeArg."]{}"
		endif
endfunction
""""""""""""""""""""""""" Add label
function! AddLabel(EnvArg)
		let lastChar=a:EnvArg[len(a:EnvArg)-1]
		if lastChar != "s"
				if a:EnvArg=="al"
						execute ":normal o\\label{eq:}"
				else
						execute ":normal o\\label{".a:EnvArg.":}"
				endif
		endif
endfunction
""""""""""""""""""""""""" Add Caption
function! AddCaption()
		execute ":normal o\\caption{}"
endfunction
""""""""""""""""""""""""" Add Sub-Figure
function! s:AddSubFigEnv(NumFig)
			  call	AddBegin("figure")
				call AddBegin("center")
				if a:NumFig<=1
					call AddInsertFig(1)	
				else
					execute ":normal o\\def\\framesize@subfig{0.48}"
					execute ":normal o\\def\\subfigsize@local{0.75}"
					for idx in range(1,a:NumFig)
							execute ":normal o%%%%%%%%%%%%%%%%%%%%%%%%% subfigure " .idx. ""
							call AddBegin("subfigure")
							execute ":normal a{\\framesize@subfig\\textwidth}"
							call AddBegin("center")
							call AddInsertFig("subfigsize@local")	
							call AddCaption()
							call AddLabel("fig")
							call AddEnd("center")
							call AddEnd("subfigure")
							execute ":normal o%%%%%%%%%%%%%%%%%%%%%%%%%"
							if idx < a:NumFig
								execute ":normal o\\vspace{0.5cm}"
							end
					endfor
				endif
				call AddCaption()
				call AddLabel("fig")
				call AddEnd("center")
				call AddEnd("figure")
endfunction
""""""""""""""""""""""""" Add Figure
function! AddFigEnv(EnvArg)
		let lastChar=a:EnvArg[len(a:EnvArg)-1]
		if lastChar != "s"
				"execute ":normal o\\begin{figure}"
				call AddBegin("figure")
		endif
		call AddBegin("center")
"6		call AddInsertFig("figsize")	
		call AddInsertFig(1)	
		if lastChar != "s"
		    call AddCaption()
				call AddLabel("fig")
				call AddEnd("center")
				call AddEnd("figure")
		else
				call AddEnd("center")
		endif
endfunction
""""""""""""""""""""""""" Add Sub-Equation
function! AddSubEqEnv()
			  call	AddBegin("subequations")
				call AddLabel("eq")
				call AddEquationFamilyEnv("align")
				call AddEnd("subequations")
endfunction
""""""""""""""""""""""""" Add Family of Equation or Align
function! AddEquationFamilyEnv(EnvArg)
		let EnvName=GetEnvName(a:EnvArg) 	
		let lastChar=a:EnvArg[len(a:EnvArg)-1]
				"execute ":normal o\\begin{".EnvName."}"
				call AddBegin(EnvName)
		if lastChar != "s"
				call AddLabel("eq")
				endif
				call AddEnd(EnvName)
				execute ":normal O"
endfunction
"""""""""""""""""""""""""""""""""
function! ReplaceBlock(EnvArg) range
		let EnvName=GetEnvName(a:EnvArg) 	
		let Firstline=line("'<") 
		let Lastline=line("'>")
		if Firstline==Lastline
				let Firstline=Firstline
				let Lastline=Firstline+1
				if (a:EnvArg == "fig" || a:EnvArg=="figs")
						call AddFigEnv(a:EnvArg)
				elseif (a:EnvArg == "eq" || a:EnvArg=="eqs"|| a:EnvArg=="al"|| a:EnvArg=="als")
						call AddEquationFamilyEnv(a:EnvArg)
				else
						call AddBegin(EnvName)
						call AddEnd(EnvName)
					  execute ":normal O"
				endif
		else
				execute (Firstline) . ':d'
				execute (Firstline-1) . ":call AddBegin(EnvName)"
				execute ":normal" .Lastline."G"
				call AddEnd(EnvName) 
				execute (Lastline) . ':d'
		endif
endfunction
:command! -range -nargs=1 Env call ReplaceBlock("<args>")

":command! Cap execute 's/\<./\u&/g'

"comment lines in visual and normal mode with CTRL-r and uncomment with CTRL-t
:vmap <silent> <F3> :s/^/%/g<s-enter>
:nmap <silent> <F3> ^i%<esc>
:vmap <silent> <F4> :s/%//g<s-enter>
:nmap <silent> <F4> ^x<esc>
  
 
" Wildignore
set wildignore+=*.pdf,*.bbl,*.aux,*.log,*.code.tex,*.fls,*.acn,*fdb_lataxml,*.ist,*.thm
set wildignore+=*.ilg,*.blg,*.idx,*.ind
