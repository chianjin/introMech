\ProvidesClass{intromech}[Introduction to Mechanics]
\NeedsTeXFormat{LaTeX2e}

\ProcessOptions\relax
\LoadClass[openany,fontset=none]{ctexbook}

% ----------------------------------------------------------
% 字体
% ----------------------------------------------------------
% 英文字体
\setmainfont[
    BoldFont=XITS-Bold.otf,
    ItalicFont=XITS-Italic.otf,
    BoldItalicFont=XITS-BoldItalic.otf
    ]{XITS-Regular.otf}

% 中文字体，使用CTeX内置方正字体设置
% 中文字体，使用方正书宋、黑体、楷体、仿宋四种免费字体，采用思源字体作为书宋和黑体粗体
\setCJKmainfont[
    BoldFont=Source Han Serif SC Bold,
    ItalicFont=FZKai-Z03
    ]{FZShuSong-Z01}
\setCJKsansfont[
    BoldFont=Source Han Sans SC Bold
    ]{FZHei-B01}
\setCJKmonofont{FZFangSong-Z02}

\setCJKfamilyfont{zhsong}{FZShuSong-Z01}
\setCJKfamilyfont{zhxbs}{Source Han Serif SC Bold}
\setCJKfamilyfont{zhdbs}{Source Han Serif SC Heavy}
\setCJKfamilyfont{zhhei}{FZHei-B01}
\setCJKfamilyfont{zhdh}{Source Han Sans SC Bold}
\setCJKfamilyfont{zhfs}{FZFangSong-Z02}
\setCJKfamilyfont{zhkai}{FZKai-Z03}

\newcommand{\songti}{\CJKfamily{zhsong}}
\newcommand{\xbsong}{\CJKfamily{zhxbs}}
\newcommand{\dbsong}{\CJKfamily{zhdbs}}
\newcommand{\heiti}{\CJKfamily{zhhei}}
\newcommand{\dahei}{\CJKfamily{zhdh}}
\newcommand{\fangsong}{\CJKfamily{zhfs}}
\newcommand{\kaishu}{\CJKfamily{zhkai}}

% ----------------------------------------------------------
% 排版格式
% ----------------------------------------------------------

% 版心：大32开, textwidth=103mm
\RequirePackage[
    paperheight=203mm,
    paperwidth=140mm,
    top=27mm,
    bottom=20mm,
    left=21mm,
    right=16mm,
    footskip=10mm
    ]{geometry}

% 修改行距，适应行内公式间距
\setlength{\lineskip}{3.5pt}
\setlength{\lineskiplimit}{3.5pt}

% ----------------------------------------------------------
% 版式
% TODO: 页码格式
% ----------------------------------------------------------
\RequirePackage{fancyhdr}

% plain 版式，章标题页
\fancypagestyle{plain}{
    \fancyhf{}
    \fancyhead[RO,LE]{\zihao{-5}\thepage}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
}
% heading 版式，正文普通页
\fancypagestyle{heading}{
    \fancyhf{}
    \fancyhead[LO]{\zihao{6}\underline{力学概论}}
    \fancyhead[RE]{\zihao{6}\underline{\leftmark}}
    \fancyhead[RO,LE]{\zihao{-5}\thepage}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
}
% foreword 版式，前言、目录、序等页
\fancypagestyle{foreword}{
    \fancyhf{}
    \fancyfoot[RO,LE]{\zihao{-5}\thepage}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
}

% ----------------------------------------------------------
% 标题格式
% ----------------------------------------------------------
% 章节标题设置
\ctexset{
    chapter={
        name={第,章},
        nameformat=\zihao{4}\fangsong,
        aftername=\vspace{4.2mm}\break,
        titleformat+=\zihao{-3},
        beforeskip=1mm,
        afterskip=6.5mm,
},
    section={
        %number={\arabic{chapter}$\cdot$\arabic{section}},
        format=\zihao{4}\kaishu,
        afterskip=3mm,
        beforeskip=3mm,
}
}
% 绪论标题
\newcommand{\chapterx}[2][绪论]{
    \ctexset{
        chapter={
            number={#1},
            name={},
        }
    }
    \chapter{#2}
    \ctexset{
        chapter={
            number={\chinese{chapter}},
            name={第,章},
        }
    }
    \addtocounter{chapter}{-1}
}

% 思考题，按节处理
\newcounter{question}
\newcommand{\question}{\refstepcounter{question}\par\thequestion .}
\newenvironment{questions}{
    \setcounter{question}{0}
    \addcontentsline{toc}{section}{思考题}
    \begin{center}\heiti\vspace{-0.6em} 思~~考~~题\vspace{-1.56em}\end{center}
    ~\vspace{-0.56em}\fangsong
    }
    {\normalfont}

% 习题，按节处理
\newcounter{exercise}
\newcommand{\exercise}{\refstepcounter{exercise}\par\theexercise .}
\newenvironment{exercises}{%
    \setcounter{exercise}{0}
    \addcontentsline{toc}{section}{习题}
    \begin{center}\heiti\vspace{-0.56em} 习~~~~~~题 \vspace{-0.56em}\end{center}
    \fangsong
    }
    {\normalfont}
% ----------------------------------------------------------
% 排版元素
% ----------------------------------------------------------
% PDF单页
\RequirePackage{pdfpages}

% 数学公式
\RequirePackage[fleqn]{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{yhmath}
\RequirePackage{unicode-math}
\setmathfont[
    BoldFont=XITSMath-Bold.otf,
    StylisticSet=8 % 直立积分符号
    ]{XITSMath-Regular.otf}
\setlength{\mathindent}{6em} % 数学公式左缩进 6em

% 公式按节编号
\numberwithin{equation}{section}

% 向量字体
\renewcommand{\vec}[1]{{\symbfsf {#1}}}

% 数学模式连字符
\mathchardef\mathdash="2D

% 例、解、讨论
\newcounter{example}[section]
\newcommand{\example}{\refstepcounter{example}【例~\theexample】}
\newcommand{\solution}{\heiti 解~\normalfont}
\newcommand{\discussion}{\heiti 讨论~\normalfont}

% 旧式正切余切函数名 tan cot tanh coth arctan arccot
\newcommand{\tg}{\operatorname{tg}}
\newcommand{\ctg}{\operatorname{ctg}}
\newcommand{\tgh}{\operatorname{tgh}}
\newcommand{\ctgh}{\operatorname{ctgh}}
\newcommand{\arctg}{\operatorname{arctg}}
\newcommand{\arcctg}{\operatorname{arcctg}}
% 求导符号
\newcommand{\dif}{\mathop{}\!\symrm{d}}

% 表格
\RequirePackage{array}
\RequirePackage{booktabs}
\RequirePackage{makecell}
\RequirePackage{tabularx}
\renewcommand{\tabularxcolumn}[1]{m{#1}}
\newcolumntype{C}{>{\centering\arraybackslash}X}
%\newcolumntype{L}{>{\centering\arraybackslash}X}
\newcolumntype{R}{>{\raggedleft\arraybackslash}X}
\newenvironment{tablex}[1][htbp]
{
    \begin{table}[#1]
        \vspace{-0.5em}
}
{
        \vspace{-1.2em}
    \end{table}
}

% 图片
%\RequirePackage{import}
\RequirePackage{graphicx}
\RequirePackage{subfigure}
\newenvironment{figurex}[1][htbp]
{
    \begin{figure}[#1]
    \vspace{-0.5em}
}
{
    \vspace{-1.2em}
    \end{figure}
}

% 图表标题
\RequirePackage{caption}
\DeclareCaptionFormat{table}{\heiti\zihao{-5}#1#2#3}
\captionsetup[table]{%
    position=above,
    format=table,
    skip=0.1em,
    labelsep=space
}
\captionsetup[figure]{%
    position=below,
    format=hang,
    font=small,
    skip=0.1em,
    labelsep=space
}

% 作图
\RequirePackage{tikz}
\RequirePackage{tkz-euclide}

% 图表绕排
\RequirePackage{wrapfig}

% 单位
\RequirePackage{siunitx}

% 下划线
\RequirePackage{ulem}

% ----------------------------------------------------------
% 注释
% ----------------------------------------------------------
% 星号脚注
\newcommand\sbfootnote[1]{%
    \begingroup
    \renewcommand\thefootnote{\fnsymbol{footnote}}
    \footnote{#1}%
    %\addtocounter{footnote}{-1}%
    \endgroup
}

% 无符号校注
\newcommand\blfootnote[1]{%
    \begingroup
    \renewcommand\thefootnote{}\footnote{#1}%
    \addtocounter{footnote}{-1}%
    \endgroup
}

% 校注
% TODO: 尾注页码
\RequirePackage{marginnote}
\RequirePackage{endnotes}
\RequirePackage{xparse}
\def\makeenmark{[\,\theenmark\,]~}
\def\enotesize{\normalsize}
\renewcommand{\notesname}{\heiti 重排校注}
\NewDocumentCommand{\erratanote}{mmoo}{%
    #1\marginnote{$^{\endnotemark}$}
    \IfNoValueT{#4}{\label{err:\theenmark}}
    %\edef\addnotetext\IfValueT{#3}{#3}
    \addtoendnotes{\par\makeenmark\hspace{0.5em}%
        #1：原文“#2”。\IfValueT{#3}{#3} (%
            \IfNoValueTF{#4}
                {\noexpand\pageref{err:\theenmark}}
                {\pageref{#4}}%
            页%
        )%
    }%
}

% ----------------------------------------------------------
% 自定义命令
% ----------------------------------------------------------
\newcommand{\hsp}{}
\newcommand{\lhbrak}{〔}
\newcommand{\rhbrak}{〕}
\newcommand{\mlhbrak}{\lbrbrak}
\newcommand{\mrhbrak}{\rbrbrak}
