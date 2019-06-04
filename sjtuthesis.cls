%%
%% This is file `sjtuthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% sjtuthesis.dtx  (with options: `class')
%% 
%% Copyright (C) 2009-2017 by weijianwen <weijianwen@gmail.com>
%%           (C) 2018-2019 by SJTUG
%% 
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3c
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%     https://www.latex-project.org/lppl.txt
%% and version 1.3c or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%% 
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sjtuthesis}
  [2018/01/11 1.0.0rc Shanghai Jiao Tong University Thesis Template]
\hyphenation{SJTU-Thesis}
\def\sjtuthesis{SJTUThesis}
\def\version{1.0.0rc}
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
  family=sjtu,
  prefix=sjtu@,
  setkeys=\kvsetkeys}
\DeclareStringOption[doctor]{degree}[doctor]
\DeclareStringOption[chinese]{language}[chinese]
\DeclareBoolOption{review}
\DeclareStringOption[5]{zihao}[5]
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessKeyvalOptions*
\newcommand\sjtu@validate@key[1]{%
  \@ifundefined{sjtu@\csname sjtu@#1\endcsname true}{%
    \ClassError{sjtuthesis}{Invalid value '\csname sjtu@#1\endcsname'}{}%
  }{%
    \csname sjtu@\csname sjtu@#1\endcsname true\endcsname
  }%
}
\newif\ifsjtu@course
\newif\ifsjtu@bachelor
\newif\ifsjtu@master
\newif\ifsjtu@doctor
\sjtu@validate@key{degree}
\ifsjtu@course\sjtu@bachelortrue\fi
\ifsjtu@doctor\sjtu@mastertrue\fi
\newif\ifsjtu@chinese
\newif\ifsjtu@english
\sjtu@validate@key{language}
\ifsjtu@english
  \PassOptionsToClass{scheme=plain}{ctexbook}
\fi
\PassOptionsToPackage{no-math}{fontspec}
\LoadClass[a4paper,zihao=\sjtu@zihao,linespread=1.3,UTF8]{ctexbook}
\sjtu@mastertrue
\ifsjtu@bachelor
  \AtEndOfClass{\input{sjtuthesis-bachelor.ltx}}
\else
  \ifsjtu@master
    \AtEndOfClass{\input{sjtuthesis-graduate.ltx}}
  \fi
\fi
\def\sjtu@def@term#1{%
\define@key{sjtu}{#1}{\csname #1\endcsname{##1}}
\expandafter\gdef\csname #1\endcsname##1{%
  \expandafter\gdef\csname sjtu@#1\endcsname{##1}}
\csname #1\endcsname{}}
\sjtu@def@term{title}
\sjtu@def@term{englishtitle}
\sjtu@def@term{keywords}
\sjtu@def@term{englishkeywords}
\sjtu@def@term{author}
\sjtu@def@term{supervisor}
\sjtu@def@term{assisupervisor}
\sjtu@def@term{englishauthor}
\sjtu@def@term{englishsupervisor}
\sjtu@def@term{englishassisupervisor}
\sjtu@def@term{studentid}
\sjtu@def@term{degreeapplied}{}
\sjtu@def@term{englishdegreeapplied}{}
\sjtu@def@term{department}
\sjtu@def@term{englishdepartment}
\sjtu@def@term{major}
\sjtu@def@term{englishmajor}
\sjtu@def@term{coursename}
\sjtu@def@term{englishcoursename}
\sjtu@def@term{date}
\sjtu@def@term{englishdate}
\def\sjtusetup{\kvsetkeys{sjtu}}
\def\sjtu@empty{}
\def\sjtu@school@chi{上海交通大学}
\def\sjtu@school@eng{Shanghai Jiao Tong University}
\def\sjtu@original@chi{学位论文原创性声明}
\def\sjtu@authorization@chi{学位论文版权使用授权书}
\def\sjtu@originality{%
  本人郑重声明：所呈交的学位论文《\sjtu@title》，是本人在导师的指导
  下，独立进行研究工作所取得的成果。除文中已经注明引用的内容外，本论
  文不包含任何其他个人或集体已经发表或撰写过的作品成果。对本文的研究
  做出重要贡献的个人和集体，均已在文中以明确方式标明。本人完全意识到
  本声明的法律结果由本人承担。}
\def\sjtu@authorization{%
  本学位论文作者完全了解学校有关保留、使用学位论文的规定，同意学校保
  留并向国家有关部门或机构送交论文的复印件和电子版，允许论文被查阅和
  借阅。本人授权上海交通大学可以将本学位论文的全部或部分内容编入有关
  数据库进行检索，可以采用影印、缩印或扫描等复制手段保存和汇编本学位
  论文。}
\def\sjtu@abstract@chi{摘要}
\def\sjtu@abstract@eng{Abstract}
\def\sjtu@keywords@chi{关键词：}
\def\sjtu@keywords@eng{Key words:~}
\ifsjtu@english
  \def\sjtu@titlepage{Title Page}
  \let\sjtu@abstract\sjtu@abstract@eng
  \def\sjtu@figurename{Figure}
  \def\sjtu@listfigurename{List of Figures}
  \def\sjtu@tablename{Table}
  \def\sjtu@listtablename{List of Tables}
\else
  \def\sjtu@titlepage{扉页}
  \let\sjtu@abstract\sjtu@abstract@chi
  \def\sjtu@figurename{图}
  \def\sjtu@listfigurename{插图索引}
  \def\sjtu@tablename{表}
  \def\sjtu@listtablename{表格索引}
\fi
\RequirePackage{xparse}
\RequirePackage{etoolbox}
\patchcmd\cleardoublepage
  {\newpage}{\thispagestyle{empty}\newpage}
  {}{}
\patchcmd\chapter
  {\thispagestyle{\CTEX@chapter@pagestyle}}{}
  {}{}
\patchcmd\@chapter
  {\if@twocolumn}
  {\addtocontents{loa}{\protect\addvspace{10\p@}}%
   \if@twocolumn}
  {}{}
\patchcmd\tableofcontents
  {\chapter}
  {\cleardoublepage%
   \pdfbookmark[0]{\contentsname}{toc}%
   \chapter}
  {}{}
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{pageslts}
\AtBeginDocument{%
  \pagenumbering{Alph}%
  \pagestyle{empty}%
}
\RequirePackage[titles]{tocloft}
\setcounter{secnumdepth}{4}
\setcounter{tocdepth}{2}
\ctexset{%
  autoindent     = true,
  chapter={%
    format       = \zihao{3}\bfseries\heiti\centering,
    nameformat   = {},
    titleformat  = {},
    aftername    = \quad,
    afterindent  = true,
    beforeskip   = {15\p@},
    afterskip    = {12\p@},
  },
  section={%
    format       = \zihao{4}\bfseries\heiti,
    afterindent  = true,
    afterskip    = {1.0ex \@plus .2ex},
  },
  subsection={%
    format       = \zihao{-4}\bfseries\heiti,
    afterindent  = true,
    afterskip    = {1.0ex \@plus .2ex},
  },
  subsubsection={%
    format       = \normalsize\normalfont,
    afterindent  = true,
    afterskip    = {1.0ex \@plus .2ex},
  },
  paragraph/afterindent    = true,
  subparagraph/afterindent = true,
}
\RequirePackage[defaultsups]{newtxtext}
\RequirePackage{newtxmath}
\RequirePackage[opentype]{sourcecodepro}
\RequirePackage{anyfontsize}
\RequirePackage{array}
\RequirePackage{threeparttable}
\RequirePackage{dcolumn}
\RequirePackage{multirow}
\RequirePackage{booktabs}
\RequirePackage{graphicx}
\graphicspath{{fig/}{figure/}{figures/}{logo/}{logos/}{graph/}{graphs}}
\DeclareGraphicsExtensions{.pdf,.eps,.png,.jpg,.jpeg}
\RequirePackage{pdfpages}
\newcommand\sjtu@authorization@cont{%
  \par\hspace{8em}
  {\heiti 保　密} $\Box$，在 \uline{\hspace{2em}}
  年解密后适用本授权书。\par
  本学位论文属于：
  \par\hspace{8em}
  {\heiti 不保密} $\Box$。
  \vskip 1ex
  （请在以上方框内打钩）
}
\newcommand\sjtu@signbox[1]{%
  \parbox{.45\textwidth}{%
    #1 签名： \vskip 4em%
    日期： \hspace{\stretch{3}} 年%
    \hspace{\stretch{2}} 月 \hspace{\stretch{2}} 日%
  }
}
\NewDocumentCommand{\makeDeclareOriginal}{o}{%
  \ifsjtu@review\relax\else%
    \IfNoValueTF{#1}{%
      \cleardoublepage
      \thispagestyle{empty}
      \chapter*{\zihao{-2}\sjtu@school@chi \\%
                \sjtu@original@chi}
      {%
        \zihao{4}
        \sjtu@originality
        \vskip16ex
        \noindent
        \begin{minipage}{\textwidth}
          \hfill
          \sjtu@signbox{学位论文作者}
        \end{minipage}
      }
    }{\includepdf[pagecommand={\thispagestyle{empty}}]{#1}}
  \fi
}
\NewDocumentCommand{\makeDeclareAuthorization}{o}{%
  \ifsjtu@review\relax\else%
    \IfNoValueTF{#1}{%
      \cleardoublepage
      \thispagestyle{empty}
      \chapter*{\zihao{-2}\sjtu@school@chi \\%
                \sjtu@authorization@chi}
      {%
        \zihao{4}
        \sjtu@authorization
        \vskip1ex
        \sjtu@authorization@cont
        \vskip16ex
        \noindent
        \begin{minipage}{\textwidth}
          \sjtu@signbox{学位论文作者}
          \hfill
          \sjtu@signbox{指导教师}
        \end{minipage}
      }
    }{\includepdf[pagecommand={\thispagestyle{empty}}]{#1}}
  \fi
}
\RequirePackage{hyperref}
\hypersetup{
  linktoc            = all,
  bookmarksnumbered  = true,
  bookmarksopen      = true,
  bookmarksopenlevel = 1,
  unicode            = true,
  psdextra           = true,
  breaklinks         = true,
  plainpages         = false,
  hidelinks,
}
\pdfstringdefDisableCommands{%
  \let\\\@empty
  \let\hspace\@gobble
}
\ifsjtu@review
  \AtBeginDocument{
    \sjtusetup{
      author={},
      supervisor={},
      assisupervisor={},
      cosupervisor={},
      englishauthor={},
      englishsupervisor={},
      englishassisupervisor={},
      englishcosupervisor={},
      studentid={}
    }
  }
\fi
\endinput
%%
%% End of file `sjtuthesis.cls'.
