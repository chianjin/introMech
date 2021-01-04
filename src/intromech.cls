\ProvidesClass{intromech}[Introduction to Mechanics]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption*{%
    \PassOptionsToClass{\CurrentOption}{ctexbook}
}
\ProcessOptions\relax
\LoadClass{ctexbook}

% 工具包
%\RequirePackage{calc}
\RequirePackage{ifthen}
%

% ----------------------------------------------------------
% 开本及版心设置
% ----------------------------------------------------------
% 大32开, textwidth=103mm
\RequirePackage[paperheight=203mm,paperwidth=140mm,top=27mm,bottom=20mm,left=21mm,right=16mm,footskip=10mm]{geometry}

% ----------------------------------------------------------
% PDF页、公式、图片、表格、单位
% ----------------------------------------------------------
% PDF单页
\RequirePackage{pdfpages}
% 数学公式
\RequirePackage[fleqn]{amsmath}
\setlength{\mathindent}{6em}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
% 公式按节编号
\numberwithin{equation}{section}
\newcounter{example}[section]
\newcommand{\example}{\refstepcounter{example}【例~\theexample】}
\newcommand{\solution}{\heiti 解~\normalfont}
\newcommand{\discussion}{\heiti 讨论~\normalfont}

% 中文字距调整
%\newlength{\tempccwd}
%\newcommand{\setziju}[1]{
%    \setlength{\tempccwd}{\ccwd}
%    \ziju{#1}
%}
%\newcommand{\normalccwd}{def}

% 修改行距，适应行内公式间距
\setlength{\lineskip}{3.5pt}
\setlength{\lineskiplimit}{3.5pt}

% 表格
\RequirePackage{booktabs}
\RequirePackage{makecell}
\newenvironment{tablex}[2][htbp]
{
    \setlength{\tabcolsep}{#2}
    \begin{table}[#1]
        \vspace{-0.5em}
    }
    {
        \vspace{-1.2em}
    \end{table}
}

% 图片
\RequirePackage{import}
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

% 图表绕排
\RequirePackage{wrapfig}

% 单位
\RequirePackage{siunitx}

% % 图表间距
% \setlength{\abovedisplayskip}{3pt}
% \setlength{\belowdisplayskip}{3pt}

% ----------------------------------------------------------
% 字体
% ----------------------------------------------------------
% 中文字体，使用CTeX内置方正字体设置
\ctexset{fontset=founder}
% 页码字体
\RequirePackage{fontspec}
\newfontface{\laksasans}{LeksaSans.otf}[
    BoldFont=LeksaSans-Bold.otf,
    ItalicFont=LeksaSans-Italic.otf,
    BoldItalicFont=LeksaSans-BoldItalic.otf
]
% 向量字体
\renewcommand{\vec}[1]{{\mathsf{#1}}}
%\newcommand{\vq}[1]{{\boldsymbol{\mathsf{#1}}}}
% 下划线
\RequirePackage{ulem}
% 强制间距
\newcommand{\hsp}{}

% ----------------------------------------------------------
% 版式
% ----------------------------------------------------------
\RequirePackage{fancyhdr}
% plain 版式，章标题页
\fancypagestyle{plain}{
    \fancyhf{}
    \fancyhead[RO,LE]{\zihao{5}\it\laksasans\thepage}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
}
% heading 版式，正文普通页
\fancypagestyle{heading}{
    \fancyhf{}
    \fancyhead[LO]{\zihao{6}\underline{力学概论}}
    \fancyhead[RE]{\zihao{6}\underline{\leftmark}}
    \fancyhead[RO,LE]{\zihao{5}\it\laksasans\thepage}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
}
% foreword 版式，前言、目录、序等页
\fancypagestyle{foreword}{
    \fancyhf{}
    \fancyfoot[RO,LE]{\zihao{5}\it\laksasans{\thepage}}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
}
%
%% 空白页取消页眉页脚
%\newcommand{\clearemptydoublepage}{%
%    \clearpage {\pagestyle{empty}
%    \origdoublepage}%
%}

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
\newcommand{\xchapter}[2][绪论]{
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

\newcounter{question}
\newcommand{\question}{\refstepcounter{question}\thequestion .}
\newcommand{\questions}{%
    \setcounter{question}{0}
    \addcontentsline{toc}{section}{思考题}
    ~\vspace{0.6em}
    \par{\heiti\centerline{思~~考~~题}}
}

\newcounter{exercise}
\newcommand{\exercise}{\refstepcounter{exercise}\theexercise .}
\newcommand{\exercises}{%
    \setcounter{exercise}{0}
    \addcontentsline{toc}{section}{习题}
    ~\vspace{0.6em}
    \par{\heiti\centerline{习~~~~~~题}}
}


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
\RequirePackage{endnotes}
\def\makeenmark{[\theenmark] }
\def\enotesize{\normalsize}
\renewcommand{\notesname}{\heiti 校注}
\newcommand{\proofnote}[2]{%
    #1\marginpar{$^{\endnote{#1：#2}}$}%
}

% 定理，证明，例题，解答
%\RequirePackage{amsthm}
%\newtheorem{theorem}{\indent 定理}[section]
%\newtheorem{lemma}[theorem]{\indent 引理}
%\newtheorem{proposition}[theorem]{\indent 命题}
%\newtheorem{corollary}[theorem]{\indent 推论}
%\newtheorem{definition}{\indent 定义}[section]
%\newtheorem{example}{\indent 例}[section]
%\newtheorem{remark}{\indent 注}[section]
%\newenvironment{solution}{\begin{proof}[\indent\textbf{解}]}{\end{proof}}
%\renewcommand{\proofname}{\indent\bf 证明}


% 作图
\RequirePackage{tikz}
\RequirePackage{tkz-euclide}

% 自定义命令

