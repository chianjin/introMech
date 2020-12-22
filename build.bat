@rem ------------------------------------------------
@echo on
@rem ------------------------------------------------
@rem ->> Source and dist file names
@rem ------------------------------------------------
set PDFFileName=Á¦Ñ§¸ÅÂÛ
set TeXFileName=introMech
@rem ------------------------------------------------
@rem ->> TeX compiler
@rem ------------------------------------------------
set Compiler=xelatex
@rem ------------------------------------------------
@rem ->> Build directory
@rem ------------------------------------------------
set BuildPath=build
set SourcePath=src
if not exist %BuildPath% (
md %BuildPath%
)
@rem ------------------------------------------------
@rem ->> Build textual content
@rem ------------------------------------------------
@rem %Compiler% -synctex=1 -interaction=nonstopmode -output-directory=%BuildPath% .\%SourcePath\%TeXFileName%
cd src
%Compiler% -synctex=1 -output-directory=..\%BuildPath% %TeXFileName%.tex
cd ..
@rem ------------------------------------------------
@rem ->> Rename output PDF filename
@rem ------------------------------------------------
if exist %PDFFileName%.pdf (
del %PDFFileName%.pdf
)
if exist %BuildPath%\%TeXFileName%.pdf (
copy %BuildPath%\%TeXFileName%.pdf %PDFFileName%.pdf
)
@rem ------------------------------------------------
@rem ->> View compiled file
@rem ------------------------------------------------
@rem if exist .\%BuildPath%\%PDFFileName%.pdf (
@rem start  " " /max .\%BuildPath%\%PDFFileName%.pdf
@rem )
echo ------------------------------------------------
echo %Compiler% %TeXFileName%.tex finished...
echo ------------------------------------------------
