  %                                     MMMMMMMMM                                         
%                                                                             
%  MMO    MM   MMMMMM  MMMMMMM   MM    MMMMMMMM   MMD   MM  MMMMMMM MMMMMMM   
%  MMM   MMM   MM        MM     ?MMM              MMM$  MM  MM         MM     
%  MMMM 7MMM   MM        MM     MM8M    MMMMMMM   MMMMD MM  MM         MM     
%  MM MMMMMM   MMMMMM    MM    MM  MM             MM MMDMM  MMMMMM     MM     
%  MM  MM MM   MM        MM    MMMMMM             MM  MMMM  MM         MM     
%  MM     MM   MMMMMM    MM   MM    MM            MM   MMM  MMMMMMM    MM
%
%
%                - META-NET Language Whitepaper | CLASS -



\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{metanetpaper}[2011/09/20 LaTeX class to typeset bilingual papers of the DFKI META-NET Project]

% Use KOMA-script class 'scrartcl', based on 'article'
\LoadClass[11pt, twoside]{scrartcl}



% Dependencies
% ------------

% Define papersize
\usepackage[paperwidth=210mm, paperheight=279mm, top=21mm, bottom=34mm, left=24mm, right=22mm, headsep=20mm, bindingoffset=0mm]{geometry}

\usepackage{graphicx}

% Colorize and customize the headings
\usepackage[xetex]{color}
\usepackage{titlesec}
% Generate TOC with hyperlinks inside document, no border, no color
\usepackage[colorlinks=true, linkcolor=black, citecolor=black, urlcolor=black]{hyperref}
% Custom background-images
\usepackage{wallpaper}
% XeLaTeX packages 
\usepackage[T1]{fontenc}
\usepackage{fontspec}
% Two columns per page
\usepackage{pdfcolparallel}
% Linespacing
\usepackage[onehalfspacing]{setspace}
\usepackage{scrpage2}
% String modifications
\usepackage{xstring}
% TOC modifications
\usepackage{tocloft}



% Class options & definitions
% ---------------------------

% Indent for new Paragraphs
\setlength{\parindent}{0pt}


% Select fonts
\setmainfont[Mapping=tex-text]{Garamond Premier Pro}
\setsansfont[Mapping=tex-text]{Futura}
  \newfontfamily\futuralight{Futura Light}
  \newfontfamily\futurabook{Futura Book}
  \newfontfamily\futuramedium{Futura Medium}
\setmonofont{Courier New}


% Colors                                             
\definecolor{white}{cmyk}{0, 0, 0, 0}                % #FFFFFF
\definecolor{printblack}{cmyk}{0, 0, 0, 1}         % #141413
\definecolor{orange1}{cmyk}{0, 0.56, 0.86, 0}        % #FF6600
\definecolor{orange2}{cmyk}{0, 0.34, 0.87, 0.01}     % #FF9900
\definecolor{orange3}{cmyk}{0.01, 0.12, 0.91, 0.01}  % #FFCC00
\definecolor{red_dark}{cmyk}{0.2, 1, 1, 0.10}        % #B72126
\definecolor{red}{cmyk}{0, 0.72, 0.9, 0}             % #FF3300
\definecolor{grey1}{cmyk}{0, 0, 0, 0.7}              % #3C3C3C
\definecolor{grey2}{cmyk}{0.16, 0.11, 0.09, 0}       % #C6C7C8
                                                      

% Headings - \section
\titleformat{\section}{
  \fontsize{18}{20}\selectfont \sffamily  \uppercase
}{\centering--- \thesection \ ---}{-1.5em}{\centering\protect\linebreak}
% Headings - \subsection
\titleformat{\subsection}{
  \vskip 0.5cm \fontsize{14}{16}\selectfont \sffamily
}{\thesubsection}{1em}{\MakeUppercase}
% Headings - \subsubsection
\titleformat{\subsubsection}{
  \vskip 0.2cm \fontsize{11}{15}\selectfont \sffamily
}{\thesubsubsection}{0.62em}{}

 
%\renewcommand\ParallelRText[1]{{
%	\textcolor{grey1}{#1} }}



% Wie den Abstand aendern?
\newenvironment{my_itemize}{
  \begin{list}{\labelitemi}{
    \setlength{\itemsep}{-2pt}
    \setlength{\leftmargin}{1.3em}
  }
}
{\end{list}}


% Marginal notes
% \boxtext{your text}
\newcommand\boxtext[1]{
  \begin{center}
  \large{
    \textsf{
      #1
    }
  }
\end{center}
}


% Lines
% \colorrule{<color>}{<width>}{<thickness>}
\newcommand*\colorrule[3]{%
  \color{#1}\rule{#2}{#3}\normalcolor
}


% Header and footer
  % Sans-serif pagenumber
\setkomafont{pagenumber}{%
  \normalfont\sffamily\color{grey1}
}
  % Clear styling for head and foot
\clearscrheadings
\clearscrplain
\clearscrheadfoot 
  
  % Pagenumber on outer margin
\ofoot[\pagemark]{\pagemark}
\pagestyle{scrheadings}


% Titlepage
\renewcommand\maketitle{%
  \begin{titlepage}%
  \ThisCenterWallPaper{1}{../_media/titlepage.pdf}
    \vspace*{0.3cm}
    % Left column
    \begin{minipage}[t]{8.1cm}
      \color{grey2}
      \textsf{
        \begin{flushright}
          % Subtitle
          \StrBefore{\@subtitle}{ ---} \\
          \vspace*{0.5cm}
          % Title
          \fontsize{34}{34}\selectfont{%
            \MakeUppercase{%
              \protect\StrBefore{\@title}{ ---}
            }
          }
        \end{flushright}
        \vspace*{0.7cm}
      }
    \end{minipage}
    % spacing between colums
    \begin{minipage}[t]{0.5cm}\ \end{minipage}
    % Right column
    \begin{minipage}[t]{8.5cm}
      \color{white}
      \textsf{
        \begin{flushleft}
          % Subtitle
          \textcolor{white}{%
            \StrBehind{\@subtitle}{--- }
          } \\
          \vspace*{0.5cm}
          % Title
          \fontsize{34}{34}\selectfont{%
            \MakeUppercase{%
              \protect\StrBehind{\@title}{--- }
            }
          }
        \end{flushleft}
        \vspace*{0.7cm}
      }
    \end{minipage}
    % Authors
    \begin{Parallel}[c]{8.1cm}{7.7cm}
      \ParallelLText{
        \begin{flushright}
          \fontsize{14}{20}\selectfont{%
            \textsf{
              \textcolor{grey2}{by}
            }
          }
        \end{flushright}
      }
      \ParallelRText{
        \begin{flushleft}
          \fontsize{13}{16}\selectfont{%
            \textsf{%
              \textcolor{white}{%
                \@author
              }
            }
          }
        \end{flushleft}
      }
      \ParallelPar
    \end{Parallel}
  \end{titlepage}
}


% Table of contents
  % the sections
\renewcommand{\cftsecfont}{\futurabook}
\renewcommand{\cftsubsecfont}{\futuralight}
\renewcommand{\cftsubsubsecfont}{\futuralight}
  % the page numbers
\renewcommand{\cftsecpagefont}{\futurabook}  
\renewcommand{\cftsubsecpagefont}{\futuralight}
\renewcommand{\cftsubsubsecpagefont}{\futuralight}
  % remove 'Contents'
\renewcommand*\contentsname{}
  % set the depth
\setcounter{tocdepth}{3}


\endinput
