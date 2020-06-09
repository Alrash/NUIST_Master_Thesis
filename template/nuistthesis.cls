% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nuistthesis}[2019/11/02 beta NUIST Thesis Template]

% 载入预定义宏模板类，指定小四系统
\LoadClass[a4paper, twoside, openany, zihao = -4, heading = true]{ctexbook}

% 设置页面大小
\RequirePackage[a4paper]{geometry}
\geometry{
    top = 2.5cm,
    bottom = 2.5cm,
    left = 2.5cm,
    right = 2.5cm,
    headheight=1.5cm,            % 页眉所占高度
    footskip=1cm                 % 页脚所占高度
}

% 设置默认字体
\RequirePackage{xeCJK}
\RequirePackage{times}
\setCJKmainfont[AutoFakeBold = 2, AutoFakeSlant=true]{SimSun}    % 设置默认中文字体
\setmainfont{Times New Roman}                                    % 设置默认英文字体
\setCJKfamilyfont{song}{SimSun}
\setCJKfamilyfont{hei}{SimHei}
\setCJKfamilyfont{kai}{KaiTi_GB2312}
\setCJKfamilyfont{fang}{FangSong_GB2312}

% \newcommand{\songti}{\CJKfamily{song}}
% \newcommand{\heiti}{\CJKfamily{hei}}
% \newcommand{\kaiti}{\CJKfamily{kai}}
% \newcommand{\fangsong}{\CJKfamily{fang}}

% 设置1.5倍行间距
\linespread{1.5}
% 每个自然段之间增加10%的空行
\setlength{\parskip}{0.1\baselineskip}

\RequirePackage{xcolor}
% 设置超链接颜色为黑色
% URL颜色依旧为红色，若想改变颜色，设置urlcolor=black
\RequirePackage[colorlinks, linkcolor = black, anchorcolor = black, citecolor = black, bookmarksopen = true, ,bookmarksdepth = 4]{hyperref}

% 设置标题格式
\ctexset {
    contentsname = 目\quad 录,
    listfigurename = 插图索引,
    listtablename = 表格索引,
    bibname = 参考文献,
    chapter = {
        format = {\centering \zihao{3} \heiti},
        pagestyle = fancy,
        name = {第, 章},
        number = \chinese{chapter}, % \arabic
        beforeskip = -20pt,
        afterskip = 10pt,
    },
    section = {
        format = {\zihao{4} \songti \bf},
        name = {},
        number = \thesection,
        aftername = \hspace{0.5em},
        beforeskip = 1em,
        afterskip = 0.5em,
    },
    subsection = {
        format = {\zihao{-4} \songti},
        name = {},
        number = \thesubsection,
        aftername = \hspace{0.5em},
        beforeskip = 0.4em,
        afterskip = 0.2em,
    },
    subsubsection = {
        format = {\zihao{-4} \songti \it},
        name ={},
        number = \Alph{subsubsection},
        aftername = {.\hspace{0.5em}},
        beforeskip = 0.1em,
        afterskip = 0.1em,
    },
    appendix = {
        name = {附\quad 录},
    }
}

% 修正正文中ref{subsubsection}
% 格式化形式为thesubsection-thesubsubsection
\renewcommand\p@subsubsection{\thesubsection-}
% 用于提取subsubsection子节号 -- 慎用
\def\@firstoftwo@second#1#2#3#4#5{%
  \def\temp##1-##2\@nil{##2}%
   \temp#1\@nil}
\newcommand\subsecref[1]{%
   \expandafter\@setref\csname r@#1\endcsname\@firstoftwo@second{#1}%
}


% 设置页眉页脚
\RequirePackage{fancyhdr}
\pagestyle{fancy}                     	                  % 使用fancy页面风格
\fancyhf{}                    	                          % 清空原有页眉页脚
\fancyhead[CO]{\zihao{-5}\leftmark}	                      % 奇数页章节标题
\fancyhead[CE]{\zihao{-5}南京信息工程大学硕士学位论文}	      % 偶数页页眉
\fancyfoot[CO, CE]{\thepage}                      	      % 页码居中
\pagenumbering{arabic}                     	              % 页码使用阿拉伯数字

\fancypagestyle{plain}{
    \fancyhf{}
    \fancyhead{}
    \fancyfoot[CO, CE]{\Roman{\thepage}}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
}

% 设置参考文献间距
\RequirePackage[numbers, sort, compress]{natbib}
\setlength{\bibsep}{0.5em}

% 设置图表
\RequirePackage{booktabs}
\RequirePackage{caption}
\DeclareCaptionFont{capFont}{\zihao{5}\songti}
\DeclareCaptionLabelSeparator{newlabelsep}{~~}
\newcommand{\ftfonts}{\zihao{-5}}                         % 定义图表内容文字大小
% 修正float体三种边距
\setlength{\floatsep}{0.8em plus 0.2em minus 0.3em}
\setlength{\textfloatsep}{0.6em plus 0.1em minus 0.4em}
\setlength{\intextsep}{0.6em}
% 修正caption间距及字体大小
\captionsetup{belowskip = 0bp, aboveskip = 0bp, font = {capFont},  labelsep = {newlabelsep}, figurename = 图, tablename = 表}
\captionsetup[figure]{position = bottom, aboveskip = 2pt}
\captionsetup[table]{position = top, aboveskip = 4pt}

% 设置公式环境
% thanks from https://github.com/alwintsui/scutthesis/blob/master/scutthesis.cls
\RequirePackage{bm}                                       % 数学符号粗体
\RequirePackage{amsmath,amsthm,mathrsfs} 
% 允许公式换页显示,否则大型推导公式都在一页内，
% 一页显示不下放到第二页，导致很大的空白空间，不好看
\allowdisplaybreaks[4]

\newtheoremstyle{definition}% name
  {0pt}%      Space above, empty = `usual value'
  {0pt}%      Space below
  {}% Body font \itshape
  {\parindent}%         Indent amount (empty = no indent, \parindent = para indent)
  {\bfseries}% Thm head font
  {:}%        Punctuation after thm head
  {0.5em}% Space after thm head: \newline = linebreak
  {}%         Thm head spec
\theoremstyle{definition}
\newtheorem{definition}{定义~}[chapter]
\newtheorem{example}{例~}[chapter]
\newtheorem{remark}{说明~}[chapter]

\newtheoremstyle{plain}% name
  {0pt}%      Space above, empty = `usual value'
  {0pt}%      Space below
  {\itshape}% Body font \itshape
  {\parindent}%         Indent amount (empty = no indent, \parindent = para indent)
  {\bfseries}% Thm head font
  {:}%        Punctuation after thm head
  {0.5em}% Space after thm head: \newline = linebreak
  {}%         Thm head spec
\theoremstyle{plain}
\newtheorem{proposition}{命题~}[chapter]
\newtheorem{lemma}{引理~}[chapter]
\newtheorem{theorem}{定理~}[chapter]
\newtheorem{axiom}{公理~}[chapter]
\newtheorem{corollary}{ 推论~}[chapter]
\newtheorem{case}{情形~}[chapter]
\newtheorem{conjecture}{猜想~}[chapter]
\newtheorem{property}{性质~}[chapter]

\renewenvironment{proof}{\vskip 1pt\indent \itshape 证明:~\normalfont}{\hfill$\square$\vskip 0.01\baselineskip} %$\blacksquare$

% 修正公式周围的空行
% 修改公式标号
\renewcommand{\theequation}{\thechapter-\arabic{equation}}

%修正公式显示（分数，\sum）
\everymath{\displaystyle}


% 设置目录
% \RequirePackage[normal]{subfigure}
\RequirePackage{subfig}
\RequirePackage[subfigure, titles]{tocloft}
% \RequirePackage{titletoc}
\renewcommand{\cftchapleader}{\cftdotfill{\cftchapdotsep}}
\renewcommand{\cftchapdotsep}{\cftdotsep}
\setcounter{tocdepth}{2}                       % 目录的深度，2 表示到 subsection
\setcounter{secnumdepth}{3}                    % 到subsubsection显示节号

% 提供subfigure
\let\subfigure\subfloat

% 目录图表
\newlength\tablelen
\settowidth\tablelen{表}
\addtolength\cfttabnumwidth{\tablelen}
\renewcommand\cfttabpresnum{表}

\newlength\figurelen
\settowidth\figurelen{图}
\addtolength\cftfignumwidth{\figurelen}
\renewcommand\cftfigpresnum{图}

\RequirePackage{afterpage}
\RequirePackage{xkeyval}

% 部分额外command
\providecommand{\charspace}{\hspace{1em}}
\providecommand{\delimitercn}{，}
\providecommand{\delimiteren}{,~}
\providecommand{\addreferencetoctl}{
    \clearpage
    \phantomsection
    \addcontentsline{toc}{chapter}{参考文献}
}

\providecommand{\appendixtoc} {
    \addtocontents{toc}{\protect\setcounter{tocdepth}{0}}
}

\providecommand{\appendixchapter}{
    \chapter*{附{\quad}录\markboth{附{\quad}录}{}}
    \addcontentsline{toc}{chapter}{附{\quad}录}
}

\providecommand{\appendixrenewenv}{
    \renewcommand{\thesection}{\arabic{section}}
    \renewcommand{\theequation}{A-\arabic{equation}}
    \renewcommand\p@section{附录-}
}

% 章节末成果部分
% ==== 默认可选参数 ====
\define@key{chapterlistmaterial}{vspace}{\def\clm@vspace{#1}}
\define@key{chapterlistmaterial}{title}{\def\clm@title{#1}}
\setkeys{chapterlistmaterial}{vspace = 1em, title = 本章部分内容出自以下论文}

\providecommand{\material}[2][]{
    \setkeys{chapterlistmaterial}{#1}
        
    \vspace{\clm@vspace plus 0.5em minus 1em}
    \noindent \clm@title：
        
    #2
}


% % 封面、目录、摘要等
\RequirePackage{graphicx}
\RequirePackage[absolute]{textpos}   % textblock
\RequirePackage{array}               % tabular
\RequirePackage{boldline}            % \hlineB{num} \clineB{c1-c2}{num}
\RequirePackage{amssymb}
\RequirePackage{emptypage}

% 封面题目使用
\IfFileExists{STZhongsong.ttf}{%
    \newCJKfontfamily\Zhongsong{STZhongsong.ttf}[AutoFakeBold=4] % 使用华文中宋 ttf 文件
    \newCJKfontfamily\ZhongsongNormal{STZhongsong.ttf}[AutoFakeBold=false] % 普通粗细的华文中宋
}{%
    \newCJKfontfamily\Zhongsong{STZhongsong}[AutoFakeBold=4] % 使用系统华文中宋
    \newCJKfontfamily\ZhongsongNormal{STZhongsong}[AutoFakeBold=false] % 普通粗细的华文中宋
}

\define@cmdkeys{nuistthesis}[nuistthesis@]{title, titleen, mentor, comentor, number, year, umonth, month, day, keywordscn, keywordsen, major, degree, institute, research, name}[none]
\define@key{nuistthesis}{title}[你的中文标题]{\gdef\nuistthesis@title{#1}}
\define@key{nuistthesis}{titleen}[your English title]{\gdef\nuistthesis@titleen{#1}}
\define@key{nuistthesis}{name}[姓名]{\gdef\nuistthesis@name{#1}}
\define@key{nuistthesis}{mentor}[导师姓名]{\gdef\nuistthesis@mentor{#1}}
\define@key{nuistthesis}{comentor}[合作导师]{\gdef\nuistthesis@comentor{#1}}
\define@key{nuistthesis}{number}[00000000000]{\gdef\nuistthesis@number{#1}}
\define@key{nuistthesis}{degree}[学位类别]{\gdef\nuistthesis@degree{#1}}
\define@key{nuistthesis}{major}[专业名称]{\gdef\nuistthesis@major{#1}}
\define@key{nuistthesis}{research}[研究方向]{\gdef\nuistthesis@research{#1}}
\define@key{nuistthesis}{institute}[学院名称]{\gdef\nuistthesis@institute{#1}}
\define@key{nuistthesis}{keywordscn}[中文关键词]{\gdef\nuistthesis@keywordscn{#1}}
\define@key{nuistthesis}{keywordsen}[keywords]{\gdef\nuistthesis@keywordsen{#1}}
\define@key{nuistthesis}{year}[2020]{\gdef\nuistthesis@year{#1}}
\define@key{nuistthesis}{umonth}[1]{\gdef\nuistthesis@umonth{#1}}
\define@key{nuistthesis}{month}[1]{\gdef\nuistthesis@month{#1}}
\define@key{nuistthesis}{day}[29]{\gdef\nuistthesis@day{#1}}

% \comentor 显示合作导师行
\newif\ifnuistthesisowncomentor\nuistthesisowncomentorfalse
\newcommand{\nuistthesis@owncomentor}{}
\providecommand{\comentor}[1]{\nuistthesisowncomentortrue\renewcommand{\nuistthesis@owncomentor}{#1}}

% \printer 打印版本
\newif\ifnuistthesisprinter\nuistthesisprinterfalse
\newcommand{\nuistthesis@printer}{}
\providecommand{\printer}[1]{\nuistthesisprintertrue\renewcommand{\nuistthesis@printer}{#1}}

% \blindtrial 盲审
\newif\ifnuistthesisblindtrial\nuistthesisblindtrialfalse
\newcommand{\nuistthesis@blindtrial}{}
\providecommand{\blindtrial}[1]{\nuistthesisblindtrialtrue\renewcommand{\nuistthesis@blindtrial}{#1}}

% \btstype 盲审封面2
\newif\ifnuistthesisbtstyle\nuistthesisbtstylefalse
\newcommand{\nuistthesis@btstyle}{}
\providecommand{\btstyle}[1]{\nuistthesisbtstyletrue\renewcommand{\nuistthesis@btstyle}{#1}}

% 封面背景色
\definecolor{NuistCoverGreen}{rgb}{0.804, 0.914, 0.812}
% \coverbcolor 启用封面背景色
\newif\ifnuistthesiscoverbcolor\nuistthesiscoverbcolorfalse
\newcommand{\nuistthesis@coverbcolor}{}
\providecommand{\coverbcolor}[1]{\nuistthesiscoverbcolortrue\renewcommand{\nuistthesis@coverbcolor}{#1}}

% 摘要显示在目录
\newif\ifnuistthesisabstracttocontents\nuistthesisabstracttocontentsfalse
\newcommand{\nuistthesis@abstracttocontents}{}
\providecommand{\abstracttocontents}[1]{\nuistthesisabstracttocontentstrue\renewcommand{\nuistthesis@abstracttocontents}{#1}}

% 摘要显示在目录
\newif\ifnuistthesiscontentsappend\nuistthesiscontentsappendfalse
\newcommand{\nuistthesis@contentsappend}{}
\providecommand{\contentsappend}[1]{\nuistthesiscontentsappendtrue\renewcommand{\nuistthesis@contentsappend}{#1}}

% 致谢环境
\providecommand{\thankschapter}[1]{
    \ifnuistthesisblindtrial
        \zihao{-4}
    \else
        \chapter{致{\quad}谢}
                
        #1{}
    \fi
        
}

\setkeys{nuistthesis}{
    title = 论文中文题目,
    titleen = Your English Title,
    name = 姓名,
    mentor = 你的导师,
    comentor = 合作导师,
    degree = 学位,
    major = 专业名称,
    research = 研究方向,
    institute= 学院名称,
    keywordscn = 关键词（可用\backslash delimitercn分割，注意误空格）,
    keywordsen = keywords (split by \backslash delimiteren\, and do not input space),
    number = 00000000000,
    year = 2020,
    umonth = 1,                                % 封面底部时间
    month = 1,                                 % 盲审完成时间
    day = 29,                                  % 盲审完成时间
}

\providecommand{\nuistthesisset}[1]{\setkeys{nuistthesis}{#1}}

\RequirePackage{pagecolor}
\RequirePackage{multicol}
\providecommand{\includefrontmatter}{
    \setlength{\TPHorizModule}{1cm}  % textblock horiz length reference
    \setlength{\TPVertModule}{1cm}   % textblock verti length reference

    % 封面
    \frontmatter
        
    \afterpage{
        \newgeometry{top = 2.2cm, bottom = 2.2cm, left = 2cm, right = 2cm}
        \linespread{1.5}
    
        \pagestyle{empty}                            % 封面页面样式
        \ifnuistthesiscoverbcolor
            \pagecolor{NuistCoverGreen}
        \fi
                
        % 封面正体 
        \ifnuistthesisblindtrial
            % 盲审论文封面
            \begin{titlepage}
                % 封面头
                \ifnuistthesisbtstyle
                    \begin{multicols}{2}
                        \begin{flushleft}
                            \zihao{-4}{分\hspace{0.5em}类\hspace{0.5em}号：\underline{\hbox to 30mm{}}} \par
                            \zihao{-4}{盲审编号：\underline{\hbox to 30mm{}}}
                        \end{flushleft}
            
                        \begin{flushright}
                            \zihao{-4}{UDC：\underline{\hbox to 30mm{}}} \par
                            \zihao{-4}{密级：\underline{\hbox to 30mm{}}}
                        \end{flushright}
                    \end{multicols}
                \else
                    \zihao{5}{~}
                \fi
                
                \begin{center}
                    \zihao{5}{~}
            
                    % NUIST
                    \includegraphics{logo/nuist}
                    
                    % 黑体35号“硕士学位论文”
                    \ifnuistthesisbtstyle                    
                        \linespread{1}
                        \zihao{-0}{\heiti{硕士学位论文}}
                    \else
                        \linespread{1}
                        \zihao{5}{~}
                        
                        \zihao{5}{~}
                        
                        \zihao{-0}{\heiti{硕士研究生学位论文}}
                        
                        \zihao{5}{~}                        
                    \fi
                
                    \zihao{5}{~}
        
                    % logo
                    \includegraphics[width = 3.46cm, height = 3.46cm]{logo/nuist_logo}
            
                    \zihao{5}{~}
                    
                    \zihao{5}{~}
            
                    % 中文标题
                    \linespread{1.5}    
                    \ZhongsongNormal{\zihao{-2}{\nuistthesis@title}}
            
                    % 英文标题
                    \setlength{\baselineskip}{25pt} 
                    \zihao{3}{\bfseries \nuistthesis@titleen}
                    
                    \linespread{1}
                    \begin{textblock}{13.2}(3, 18.5)
                        \songti \zihao{-3}
                        \begin{tabular}{>{\raggedleft\arraybackslash}p{3.8cm}>{\centering\arraybackslash}p{7.5cm}}                    
                            学\hspace{0.34em}位\hspace{0.33em}类\hspace{0.34em}别：   & \nuistthesis@degree \\ \clineB{2-2}{2} \specialrule{0em}{1.2em}{0pt}                    
                            学\hspace{0.34em}科\hspace{0.33em}专\hspace{0.34em}业：   & \nuistthesis@major \\ \clineB{2-2}{2} \specialrule{0em}{1.2em}{0pt}
                    
                            研\hspace{0.34em}究\hspace{0.33em}方\hspace{0.34em}向：   & \nuistthesis@research \\ \clineB{2-2}{2} \specialrule{0em}{1.2em}{0pt}
                    
                            完\hspace{0.34em}成\hspace{0.33em}时\hspace{0.34em}间：   & \nuistthesis@year ~年 \nuistthesis@month ~月 \nuistthesis@day ~日 \\ \clineB{2-2}{2} \specialrule{0em}{1.2em}{0pt}
                        \end{tabular}
                    \end{textblock}
            
                    % 日期部分
                    \vspace*{\fill}                                % 空白填充
                    \songti{\zihao{-2}{\zhdigits{\nuistthesis@year}~年~\zhdigits{\nuistthesis@umonth}~月}} \\
                    \zihao{5}{~} \\                                % 底部空格
                    
                \end{center}
            
            \end{titlepage}
        \else
            % 正常论文封面    
            \begin{titlepage}
                % 封面头
                \begin{multicols}{2}
                    \begin{flushleft}
                        \zihao{-4}{分类号：\underline{\hbox to 30mm{}}} \par
                        \zihao{-4}{密\hspace{1em}级：\underline{\hbox to 30mm{}}}
                    \end{flushleft}
            
                    \begin{flushright}
                        \zihao{-4}{单位代码：\underline{\hbox to 9mm{} 10300 \hbox to 9mm{}}} \par
                        \zihao{-4}{学\hspace{2em}号： \underline{~~~ \nuistthesis@number ~~~}}
                    \end{flushright}
                \end{multicols}

                \begin{center}
                    ~\\
            
                    % NUIST
                    \includegraphics{logo/nuist}
                
                    % 黑体35号“硕士学位论文”
                    \linespread{1}
                    \zihao{-0}{\heiti{硕士研究生学位论文}}
                
                    \zihao{5}{~} \\
                    \zihao{5}{~}
        
                    % logo
                    \includegraphics[width = 3.46cm, height = 3.46cm]{logo/nuist_logo}
            
                    \zihao{5}{~} \\
                    \zihao{5}{~}
            
                    % 中文标题
                    \linespread{1.5}    
                    \ZhongsongNormal{\zihao{-2}{\nuistthesis@title}}
            
                    % 英文标题
                    \setlength{\baselineskip}{25pt} 
                    \zihao{3}{\bfseries \nuistthesis@titleen}
            
                    \linespread{1}
                    \begin{textblock}{13.2}(3, 17.4)
                        \songti \zihao{-3}
                        \begin{tabular}{>{\raggedleft\arraybackslash}p{3.8cm}>{\centering\arraybackslash}p{7.5cm}}
                            申请人姓名：  & \nuistthesis@name \\ \clineB{2-2}{2} \specialrule{0em}{1.2em}{0pt}
                    
                            指\hspace{0.34em}导\hspace{0.33em}教\hspace{0.34em}师：   & \nuistthesis@mentor \\ \clineB{2-2}{2} \specialrule{0em}{1.2em}{0pt}
                    
                            \ifnuistthesisowncomentor
                                合\hspace{0.34em}作\hspace{0.33em}导\hspace{0.34em}师：   & \nuistthesis@comentor \\ \clineB{2-2}{2} \specialrule{0em}{1.2em}{0pt}
                            \fi
                    
                            专\hspace{0.34em}业\hspace{0.33em}名\hspace{0.34em}称：   & \nuistthesis@major \\ \clineB{2-2}{2} \specialrule{0em}{1.2em}{0pt}
                    
                            研\hspace{0.34em}究\hspace{0.33em}方\hspace{0.34em}向：   & \nuistthesis@research \\ \clineB{2-2}{2} \specialrule{0em}{1.2em}{0pt}
                    
                            所\hspace{0.34em}在\hspace{0.33em}学\hspace{0.34em}院：   & \nuistthesis@institute \\ \clineB{2-2}{2} \specialrule{0em}{1.2em}{0pt}
                        \end{tabular}
                    \end{textblock}
            
            
                    % 日期部分
                    \vspace*{\fill}                                % 空白填充
                    \songti{\zihao{-2}{\zhdigits{\nuistthesis@year}~年~\zhdigits{\nuistthesis@umonth}~月}} \\
                    \zihao{5}{~} \\                                % 底部空格
        
                \end{center}
            
            \end{titlepage}
        \fi
        
        \ifnuistthesiscoverbcolor
            \afterpage{\nopagecolor}
        \fi
    
        \ifnuistthesisprinter
            \cleardoublepage
        \else
            \clearpage
        \fi
    
        % 独立性声明与授权说明
        \linespread{2}
        
        \zihao{-4}{~}      

        % 独立性声明
        \begin{center}    
            \songti{\bf{\zihao{-2}{独立性声明}}}
        \end{center}
        
        \songti{\zihao{-4}{本人声明所呈交的论文是我个人在导师指导下进行的研究工作及取得的研究成果。本论文除了文中特别加以标注和致谢的内容外，不包含其他人或其他机构已经发表或撰写过的研究成果，也不包含为获得南京信息工程大学或其他教育机构的学位或证书而使用过的材料。其他同志对本研究所做的贡献均已在论文中作了声明并表示谢意。}}
            
        \zihao{-4}{~}
        
        \zihao{-4}{学位论文作者签名：\underline{\hbox to 30mm{}} \hspace{4em} 签字日期：\underline{\hbox to 30mm{}}}
        
        \zihao{-4}{~}
        
        % 授权
        \begin{center}    
            \songti{\bf{\zihao{-2}{关于论文使用授权的说明}}}
        \end{center}
        
        \songti{\zihao{-4}{南京信息工程大学、国家图书馆、中国学术期刊（光盘版）杂志社、中国科学技术信息研究所的《中国学位论文全文数据库》有权保留本人所送交学位论文的复印件和电子文档，可以采用影印、缩印或其他复制手段保存论文，并通过网络向社会提供信息服务。本人电子文档的内容和纸质论文的内容相一致。除在保密期内的保密论文外，允许论文被查阅和借阅，可以公布（包括刊登）论文的全部或部分内容。论文的公布（包括刊登）授权南京信息工程大学研究生院办理。}}
        
        \zihao{-4}{$\openbox$公开 \hspace{2em} $\openbox$保密（\underline{\hbox to 12mm{}}年\underline{\hbox to 12mm{}}月）~(保密的学位论文在解密后应遵守此协议)}
        
        \zihao{-4}{~}
        
        \zihao{-4}{学位论文作者签名：\underline{\hbox to 30mm{}} \hspace{4em} 签字日期：\underline{\hbox to 30mm{}}}
               
        \zihao{-4}{\hspace{2em}指导教师签名：\underline{\hbox to 30mm{}} \hspace{4em} 签字日期：\underline{\hbox to 30mm{}}}
       
        \ifnuistthesisprinter
            \cleardoublepage
        \else
            \clearpage
        \fi
    
        \restoregeometry
    }
}

\RequirePackage{bookmark}
\RequirePackage{lipsum}
% 摘要
\providecommand{\abstract}[2]{
    \clearpage
    
    \afterpage{
    
        \setcounter{page}{1}
    
        % 定义页眉格式格式
        \pagestyle{plain}
        \fancyhf{}            	                          % 清空原有页眉页脚
        \fancyhead{}                                      % 页眉
        \renewcommand{\headrulewidth}{0pt}                % 页眉线
        \fancyfoot[CO, CE]{\thepage}             	      % 页码居中
        \pagenumbering{Roman}                     	      % 页码使用大写罗马数字
        
        % 标题
        \begin{center}
            \heiti{\zihao{-3}{摘\quad{}要}}
            \ifnuistthesisabstracttocontents
                \addcontentsline{toc}{chapter}{摘\quad{}要}
            \else
                \hypertarget{hereAbstractCN}{}
                \bookmark[dest = hereAbstractCN, level = 1]{摘\quad{}要}
            \fi
        \end{center}
        
        % 中文摘要正文内容
        #1{}
        
        % 关键字部分
        \begin{list}{\songti{关键词：}}{
            \edef\fix{\labelsep=\the\labelsep}
            \settowidth\leftmargin{\songti{关键词：}} 
            \itemindent=-\leftmargin 
            \labelsep=0pt \labelwidth=0pt} 
         \item\fix 
         \begin{enumerate}[topsep = 1em minus 0.5em, leftmargin = 0pt, label = {}]
             \item \nuistthesis@keywordscn
         \end{enumerate}
         \end{list}
        
        \clearpage
                
        % 标题
        \begin{center}
            \bfseries{\zihao{-3}{Abstract}}
            \ifnuistthesisabstracttocontents
                \addcontentsline{toc}{chapter}{Abstract}
            \else
                \hypertarget{hereAbstractEN}{}
                \bookmark[dest = hereAbstractEN, level = 1]{Abstract}
            \fi
        \end{center}
        
        % 英文摘要正文内容
        #2{}
        
        % 关键字部分
        \begin{list}{{\bfseries Keywords:}}{
            \edef\fix{\labelsep=\the\labelsep}
            \settowidth\leftmargin{{\bfseries Keywords:}} 
            \itemindent=-\leftmargin 
            \labelsep=0pt \labelwidth=0pt} 
         \item\fix 
         \begin{enumerate}[topsep = 1em minus 0.5em, leftmargin = 0.5em, label = {}]
             \item \nuistthesis@keywordsen
         \end{enumerate}
         \end{list}
                
        \ifnuistthesisprinter
            \cleardoublepage
        \else
            \clearpage
        \fi
        \restoregeometry
    }
}


\providecommand{\includelistpage}{
    \clearpage
    
    \afterpage{    
        \setcounter{page}{1}
    
        % 定义页眉格式格式
        \pagestyle{plain}
        \fancyhf{}            	                          % 清空原有页眉页脚
        \fancyhead{}                                      % 页眉
        \renewcommand{\headrulewidth}{0pt}                % 页眉线
        \fancyfoot[CO, CE]{\thepage}             	      % 页码居中
        \pagenumbering{Roman}                     	      % 页码使用大写罗马数字
        
        % 目录
        \hypertarget{hereContents}{}
        \bookmark[dest = hereContents, level = 1]{目{\quad}录}
        \tocloftpagestyle{fancy}
        \tableofcontents
        \clearpage
                
        % 插图索引
        \clearpage
        % \hypertarget{hereFigures}{}
        % \bookmark[dest = hereFigures, level = 1]{插图索引}
        \listoffigures
        \clearpage
        
        % 表格索引    
        \clearpage
        % \hypertarget{hereTables}{}
        % \bookmark[dest = hereTables, level = 1]{表格索引}
        \listoftables
        
        % 追加部分
        \ifnuistthesiscontentsappend
            \clearpage
            \input{contentsappend}
            \clearpage        
        \fi
        
        \ifnuistthesisprinter
            \cleardoublepage
        \else
            \clearpage
        \fi
        \restoregeometry
    }
}

% 重定义mainmatter
\def\mainmatter{%
	\ifnuistthesisprinter
		\cleardoublepage
	\else
		\clearpage
	\fi
	\@mainmattertrue
	\pagenumbering{arabic}
}


\def\backmatter{
	\clearpage
	\@mainmatterfalse
    \addtocontents{toc}{\protect\setcounter{tocdepth}{2}}
}

\providecommand{\mainmatterstart}{
    % 开始正文
    \mainmatter
}