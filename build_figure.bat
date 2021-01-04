
set DRAFT_FIGURE_PATH=draft\figure
set SRC_FIGURE_PATH=src\figure
set INKSCAPE="C:\Program Files\Inkscape\bin\inkscape"
set INKSCAPE_OPTIONS="--export-area-drawing --export-text-to-path --export-dpi=600 --export-type=eps"
set INKSCAPE_OPTIONS=--export-area-drawing --export-text-to-path --export-dpi=600 --export-type=pdf --export-filename=
REM "C:\Program Files\Inkscape\bin\inkscape" --export-area-drawing --export-text-to-path --export-dpi=600 --export-type=pdf

FOR /r %DRAFT_FIGURE_PATH% %%f in (*.*) DO %INKSCAPE% %INKSCAPE_OPTIONS%%SRC_FIGURE_PATH%\%%~nf.pdf %%f

