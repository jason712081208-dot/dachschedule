\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dachschedule}[2026/02/23 Dachschedule]

\LoadClass[a4paper, 12pt]{article}

\RequirePackage[table]{xcolor}
\RequirePackage[margin=0pt, top=5mm]{geometry}
\RequirePackage[no-math]{fontspec}
\RequirePackage[AutoFallBack=true]{xeCJK}
\RequirePackage{tikz}
\RequirePackage{ifthen}
\RequirePackage{calc}
\RequirePackage{graphicx}
\setmainfont{./font/YujiMai-Regular.ttf}
\setCJKmainfont[AutoFakeBold={3.17}]{./font/YujiMai-Regular.ttf}
\setCJKfamilyfont{vertfont}[RawFeature={vertical}]{./font/YujiMai-Regular.ttf}
\setCJKfallbackfamilyfont{vertfont}[RawFeature={vertical}]{./font/Iansui-Regular.ttf}
\pagenumbering{gobble}
\newlength{\cellwidth}
\setlength{\cellwidth}{25mm}
\newlength{\halfcellwidth}
\setlength{\halfcellwidth}{\cellwidth/2}
\newlength{\cellheight}
\setlength{\cellheight}{22mm}
\newlength{\halfcellheight}
\setlength{\halfcellheight}{\cellheight/2}
\newlength{\celltoppadding}
\setlength{\celltoppadding}{3mm}
\newlength{\cellbottompadding}
\setlength{\cellbottompadding}{3mm}
\newlength{\rulewidth}
\setlength{\rulewidth}{3mm}
\newlength{\totalwidth}
\setlength{\totalwidth}{\cellwidth+\rulewidth}
\newlength{\totalheight}
\setlength{\totalheight}{\cellheight+\rulewidth}
\newlength{\headmargin}
\setlength{\headmargin}{10mm}
\newlength{\positionmargin}
\setlength{\positionmargin}{2mm}
\newlength{\fourdogwidth}
\setlength{\fourdogwidth}{0.9\cellwidth}
\newlength{\threedogwidth}
\setlength{\threedogwidth}{\totalwidth}
\newlength{\threedogoffset}
\setlength{\threedogoffset}{0.1\cellwidth}
\newlength{\twodogwidth}
\setlength{\twodogwidth}{\totalwidth+\rulewidth}
\newlength{\twodogoffset}
\setlength{\twodogoffset}{0pt}
\newlength{\onedogwidth}
\setlength{\onedogwidth}{\totalwidth}
\newlength{\onedogoffset}
\setlength{\onedogoffset}{0.2\cellheight}
\definecolor{col-bkg}{HTML}{fff4d8}
% \definecolor{col-cor}{HTML}{e6cfb7}
\definecolor{col-cor}{HTML}{d6c4ab}
\definecolor{col-hed}{HTML}{f6f3f0}
\definecolor{col-def}{HTML}{d6c4ab}
\definecolor{col-tex}{HTML}{c59663}
\pagecolor{col-bkg}
\newcommand*\CJKmovesymbol[1]{\raise.35em\hbox{#1}}
\newcommand*\CJKmove{\punctstyle{plain}% do not modify the spacing between punctuations
  \let\CJKsymbol\CJKmovesymbol
  \let\CJKpunctsymbol\CJKsymbol}
\newcommand{\course}[5]{%<weekday>, <start>, <end>, <name>, <place>
    \pgfmathtruncatemacro{\diff}{#3-#2}
    \ifthenelse{\diff = 3}{\fourdog{#1}{#2}{#3}{#4}{#5}}{}
    \ifthenelse{\diff = 2}{\threedog{#1}{#2}{#3}{#4}{#5}}{}
    \ifthenelse{\diff = 1}{\twodog{#1}{#2}{#3}{#4}{#5}}{}
    \ifthenelse{\diff = 0}{\onedog{#1}{#2}{#4}{#5}}{}
}
\newcommand{\fourdog}[5]{%<weekday>, <start>, <end>, <name>, <place>
    \coordinate (textcenter) at (\the\totalwidth*#1+\the\halfcellwidth, 
        {(-\the\totalheight*#2-\the\totalheight*#3-\the\cellheight)/2});
    \coordinate (poscenter) at (\the\totalwidth*#1+\the\halfcellwidth+\the\positionmargin, 
        {(-\the\totalheight*#2-\the\totalheight*#3-\the\cellheight)/2});
    \fill[cell-cor] (\the\totalwidth*#1-0.5mm, -\the\totalheight*#2) rectangle 
        (\the\totalwidth*#1+\the\cellwidth+0.5mm, -\the\totalheight*#3-\the\cellheight-1mm);
    \node[anchor=center] at (textcenter) {\rotatebox{270}{\CJKfamily{vertfont}\CJKmove\Large #4}};
    \node[anchor=center] at (textcenter) {\includegraphics[width=\fourdogwidth]{img/4dog.png}};
    \node[anchor=west] at (poscenter)
        {\rotatebox{270}{\CJKfamily{vertfont}\CJKmove\color{col-tex}{#5}}};
}
\newcommand{\threedog}[5]{%<weekday>, <start>, <end>, <name>, <place>
    \coordinate (dogcenter) at (\the\totalwidth*#1+\the\halfcellwidth+\threedogoffset, 
        {(-\the\totalheight*#2-\the\totalheight*#3-\the\cellheight)/2});
    \coordinate (textcenter) at (\the\totalwidth*#1+\the\halfcellwidth, 
        {(-\the\totalheight*#2-\the\totalheight*#3-\the\cellheight)/2});
    \coordinate (poscenter) at (\the\totalwidth*#1+\the\halfcellwidth+\the\positionmargin, 
        {(-\the\totalheight*#2-\the\totalheight*#3-\the\cellheight)/2});
    \fill[cell-cor] (\the\totalwidth*#1-0.5mm, -\the\totalheight*#2) rectangle 
        (\the\totalwidth*#1+\the\cellwidth+0.5mm, -\the\totalheight*#3-\the\cellheight-1mm);
    \node[anchor=center] at (textcenter) {\rotatebox{270}{\CJKfamily{vertfont}\CJKmove\Large #4}};
    \node[anchor=center] at (dogcenter) {\includegraphics[width=\threedogwidth]{img/3dogFAT.png}};
    \node[anchor=west] at (poscenter)
        {\rotatebox{270}{\CJKfamily{vertfont}\CJKmove\color{col-tex}{#5}}};
}
\newcommand{\twodog}[5]{%<weekday>, <start>, <end>, <name>, <place>
    \coordinate (dogcenter) at (\the\totalwidth*#1+\the\halfcellwidth+\twodogoffset, 
        {(-\the\totalheight*#2-\the\totalheight*#3-\the\cellheight)/2});
    \coordinate (textcenter) at (\the\totalwidth*#1+\the\halfcellwidth, 
        {(-\the\totalheight*#2-\the\totalheight*#3-\the\cellheight)/2});
    \coordinate (poscenter) at (\the\totalwidth*#1+\the\halfcellwidth+\the\positionmargin, 
        {(-\the\totalheight*#2-\the\totalheight*#3-\the\cellheight)/2});
    \fill[cell-cor] (\the\totalwidth*#1-0.5mm, -\the\totalheight*#2) rectangle 
        (\the\totalwidth*#1+\the\cellwidth+0.5mm, -\the\totalheight*#3-\the\cellheight-1mm);
    \node[anchor=center] at (textcenter) {\rotatebox{270}{\CJKfamily{vertfont}\CJKmove\Large #4}};
    \node[anchor=center] at (dogcenter) {\includegraphics[width=\twodogwidth]{img/2dogR.png}};
    \node[anchor=west] at (poscenter)
        {\rotatebox{270}{\CJKfamily{vertfont}\CJKmove\color{col-tex}{#5}}};
}
\newcommand{\onedog}[4]{%<weekday>, <start>, <name>, <place>
    \coordinate (topleft) at (\the\totalwidth*#1-0.5mm, -\the\totalheight*#2);
    \coordinate (dogcenter) at (\the\totalwidth*#1+\the\halfcellwidth, -\the\totalheight*#2-\the\halfcellheight+\the\onedogoffset);
    \coordinate (textcenter) at (\the\totalwidth*#1+\the\halfcellwidth, -\the\totalheight*#2-\the\halfcellheight);
    \coordinate (poscenter) at (\the\totalwidth*#1+\the\halfcellwidth+\the\positionmargin, -\the\totalheight*#2-\the\halfcellheight);
    \fill[cell-cor] (topleft) rectangle +(\the\cellwidth+0.5mm, -\the\cellheight);
    \node[anchor=center] at (dogcenter) {\includegraphics[width=\onedogwidth]{img/paw.png}};
    \node[anchor=west] at (poscenter)
        {\rotatebox{270}{\CJKfamily{vertfont}\CJKmove\color{col-tex}{#4}}};
    \node[anchor=center] at (textcenter) {\rotatebox{270}{\CJKfamily{vertfont}\CJKmove\Large #3}};
}

\def\classtime{8:10-9:00,9:10-10:00,10:20-11:10,11:20-12:10,12:20-13:10,
13:20-14:10,14:20-15:10,15:30-16:20,16:30-17:20,17:30-18:20}
\DeclareOption{tmu}{\def\classtime{8:10-9:00,9:10-10:00,10:10-11:00,11:10-12:00,12:10-13:00,
13:10-14:00,14:10-15:00,15:10-16:00,16:10-17:00,17:10-18:00}}
\DeclareOption{ntu}{\def\classtime{8:10-9:00,9:10-10:00,10:20-11:10,11:20-12:10,12:20-13:10,
13:20-14:10,14:20-15:10,15:30-16:20,16:30-17:20,17:30-18:20}}
\ProcessOptions\relax

\newenvironment{schedule}{
    \begin{center}
    \begin{tikzpicture}
        [
        cell-def/.style={fill=col-def},
        cell-cor/.style={fill=col-bkg},
        cell-hed/.style={fill=col-hed, draw=col-def, ultra thick},
        ]
        \foreach \x in {1, ..., 5}
            \foreach \y in {1, 2, 3, 4, 6, 7, 8, 9, 10}
                \fill[cell-def] ({\the\totalwidth*\x}, -{\the\totalheight*\y}) rectangle +(\the\cellwidth, -\the\cellheight);
        \node[anchor=north west] at (\the\totalwidth-\rulewidth, 0) {\includegraphics[width=5\totalwidth]{img/weekday.png}};
        \node[anchor=center] at (3*\the\totalwidth+\the\halfcellwidth, -5*\the\totalheight-\the\halfcellheight)
        {\includegraphics{img/lunch.png}};
        \node[anchor=west] at (\the\totalwidth, -5*\the\totalheight-\the\halfcellheight)
        {\includegraphics{img/ball.png}};
        \foreach[count=\xi] \x in \classtime {
            \node[anchor=north] (class\xi) at (\the\halfcellwidth, -\the\totalheight*\xi-\the\celltoppadding) {\Large\xi};
            \node[anchor=south] (time\xi) at  (\the\halfcellwidth, -\the\totalheight*\xi-\the\cellheight+\the\cellbottompadding) {\scriptsize \x};
        }
}{
    \end{tikzpicture}
    \end{center}
}

