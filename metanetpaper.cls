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
%
% 
% ----------------------------------------------------------------------------
%
% Class options
% []      = Set the inner part of the LWP
% [cover] = Set the cover of the LWP
% [ebook] = Set the eBook version of the LWP (including cover and inner part)
%
% ----------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{metanetpaper}[2011/09/20 LaTeX class to typeset bilingual papers of the DFKI META-NET Project]

% Use KOMA-script class 'scrartcl', based on 'article'
\LoadClass[11pt, twoside]{scrartcl}


% Dependencies
% ----------------------------------------------------------------------------

% Define papersize 210x279mm + 3mm bleed
\RequirePackage[paperwidth=216mm, paperheight=285mm, top=24mm, bottom=37mm, left=27mm, right=25mm, headsep=20mm, bindingoffset=0mm]{geometry}

\RequirePackage{graphicx}
\RequirePackage{mathabx} % Mathematical symbols
\RequirePackage[xetex]{color} % Colorize and customize the headings
\RequirePackage{titlesec} % Generate TOC with hyperlinks inside document, no border, no color
%\RequirePackage[colorlinks=true, linkcolor=black, citecolor=black, urlcolor=black]{hyperref}
\RequirePackage{url}
\RequirePackage{wallpaper} % Custom background-images
\RequirePackage[T1]{fontenc} % XeLaTeX packages 
\RequirePackage{fontspec}
\RequirePackage{parallel} % Two columns per page
\RequirePackage{multicol}
\RequirePackage[onehalfspacing]{setspace} % Linespacing
\RequirePackage{scrpage2}
\RequirePackage{xstring} % String modifications
\RequirePackage{tocloft} % TOC modifications
\RequirePackage{ifthen} % Conditional statements
\RequirePackage{booktabs}
\RequirePackage{longtable}
\RequirePackage{tabulary}
\RequirePackage{tabularx}
\RequirePackage{makecell}
\RequirePackage{multirow}
\RequirePackage{rotating}
\RequirePackage{colortbl}


% Class definitions
% ----------------------------------------------------------------------------

% Indent for new Paragraphs
\setlength{\parindent}{0pt}


% Package multicol options
  % Gutter between columns
\setlength{\columnsep}{5mm}


% Figure format
\renewcommand*{\figureformat}{\sffamily\thefigure\autodot}


% Set fonts
\setmainfont[Mapping=tex-text]{Garamond Premier Pro}
\setsansfont[Mapping=tex-text]{Futura}
  \newfontfamily\futuralight{Futura Light}
  \newfontfamily\futurabook{Futura Book}
  \newfontfamily\futuramedium{Futura Medium}
\setmonofont[Scale=0.7]{DejaVu Sans Mono}
  \newfontfamily\linguistics[Scale=0.8]{DejaVu Serif}
  
% Own defs
  % Editors
\def\editors#1{\gdef\@editors{#1}}
\def\@editors{\@latex@warning@no@line{No \noexpand\editors given}}
  % Autors with affiliation
\def\authoraffiliation#1{\gdef\@authoraffiliation{#1}}
\def\@authoraffiliation{\@latex@warning@no@line{No \noexpand\authoraffiliation given}}



% Colors                                             
\definecolor{white}{RGB}{255, 255, 255}    % #ffffff
\definecolor{printblack}{RGB}{0, 0, 0}     % #141413
\definecolor{orange1}{RGB}{255, 109, 50}   % #ff6600
\definecolor{orange2}{RGB}{233, 154, 53}   % #ff9900
\definecolor{orange3}{RGB}{255, 204, 0}    % #ffcc00
\definecolor{corange1}{RGB}{232, 183, 127} % #f5b58e
\definecolor{corange2}{RGB}{226, 157, 104} % #f5a676
\definecolor{corange3}{RGB}{222, 141, 85}  % #f5975d
\definecolor{corange4}{RGB}{220, 129, 70}  % #f58845
\definecolor{corange5}{RGB}{217, 116, 55}  % #f5792c
\definecolor{red_dark}{RGB}{146, 22, 32}   % #b72126
\definecolor{red}{RGB}{146, 22, 32}        % #c80000
\definecolor{red2}{RGB}{230, 134, 133}     % #ff8182
\definecolor{red3}{RGB}{189, 62, 68}       % #a83b3b
\definecolor{grey1}{RGB}{80, 80, 80}       % #3c3c3c
\definecolor{grey2}{RGB}{197, 200, 200}    % #c6c7c8
\definecolor{grey3}{RGB}{141, 142, 141}    % #c6c7c8
\definecolor{grey4}{RGB}{82, 68, 49}       % #847a6f
\definecolor{green}{RGB}{30, 127, 75}      % #1f9863
\definecolor{green2}{RGB}{103, 179, 86}    % #81c56b
\definecolor{blue}{RGB}{63, 172, 168}      % #44c1c5
\definecolor{blue2}{RGB}{91, 182, 177}     % #56d8d8
\definecolor{purple}{RGB}{107, 129, 177}   % #7e7fff


% Orphans and widows
% \widowpenalties 3 10000 10000 100 
% \clubpenalties 3 10000 10000 100
% CAREFUL: There are sideeffects with the "parallel" package!



% Headings
  % Reset all sections, subsections and subsubsections
\titleformat{\section}{}{
  \centering \fontsize{24}{1.2}\color{red}\sffamily\thesection
}{-0.35em}{\centering\protect\linebreak}

\titleformat{\subsection}[block]{}{\raggedright\LARGE\futuralight\thesubsection}{0.5em}{\linespread{1.1}\raggedright\LARGE\sffamily\MakeUppercase}\titlespacing{\subsection}{0pt}{*4}{*1}

\titleformat{\subsubsection}{}{\fontsize{14}{14}\futuralight\thesubsubsection}{0.5em}{\fontsize{14}{1.2}\sffamily}

  % Redefine \section as \ssection and then as \sectionstar and \sectionnostar
  % for numbered and unnumbered sections
\newcommand{\ssection}{\@ifstar
                     \sectionStar%
                     \sectionNoStar%
}
\newcommand{\sectionNoStar}[2][]{%
  \section[#1]{%
    \vspace*{1mm}
    \ThisCenterWallPaper{1}{../_media/section_bg.pdf}
    \begin{minipage}[t]{\textwidth}
      \begin{spacing}{2.2}
      \color{red}
      \textsf{%
        % Title
        \fontsize{24}{24}\selectfont{%
          \MakeUppercase{#2}
        }
      }
      \end{spacing}
    \end{minipage}
    \vspace*{-8mm}
  }
}
\newcommand{\sectionStar}[2][]{%
  \clearpage
  \vspace*{9mm}
  \ThisCenterWallPaper{1}{../_media/section_bg.pdf}
  \begin{minipage}[t]{\textwidth}
    \begin{spacing}{2.2}
    \color{red}
    \textsf{%
      % Title
      \fontsize{24}{24}\selectfont{%
        \MakeUppercase{#2}
      }
    }
    \end{spacing}
  \end{minipage}
}

  % Redefine bilingual \sections
  % Unstarred bsections will be added to the appendix of the TOC
\newcounter{bsectioncounter}
\renewcommand{\thebsectioncounter}{\Alph{bsectioncounter}}
\newcommand{\bsection}{\@ifstar
                     \bsectionStar%
                     \bsectionNoStar%
}
\newcommand{\bsectionNoStar}[2][]{%
  \clearpage
  \stepcounter{bsectioncounter}
  \ifx#1\@null
  \ifsecondargument
    \addcontentsline{toc}{section}{\thebsectioncounter\hskip0.75em #2}
  \else
    \addcontentsline{toc}{section}{\thebsectioncounter\hskip0.75em #1}
  \fi
  \ThisCenterWallPaper{1}{../_media/section_bg.pdf}
  % Numbering
  \begin{center}
    \textsf{%
      \fontsize{24}{24}\selectfont{%
        \textcolor{red}{%
          \thebsectioncounter\\
        }
      }
    }
  \end{center}
  \vspace*{-6mm}
  % original language
  \begin{minipage}[t]{79mm}
      \color{red}
      \textsf{%
        \begin{flushright}%
          % Title
          \fontsize{24}{24}\selectfont{%
            \MakeUppercase{%
              \protect\StrBefore{#2}{ ---}
            }
          }
        \end{flushright}
        \vspace*{3mm}
      }
  \end{minipage}
  % spacing between colums
  \begin{minipage}[t]{6mm}\ \end{minipage}
  % english version
  \begin{minipage}[t]{81mm}
    \color{grey1}
    \textsf{%
      \begin{flushleft}%
        % Title
        \fontsize{24}{24}\selectfont{%
          \MakeUppercase{%
            \protect\StrBehind{#2}{--- }
          }
        }
      \end{flushleft}
      \vspace*{3mm}
    }
  \end{minipage}
}
\newcommand{\bsectionStar}[2][]{%
  \clearpage
  \vspace*{1mm}
  \ThisCenterWallPaper{1}{../_media/section_bg.pdf}
  % original language
  \begin{minipage}[t]{79mm}
      \color{red}
      \textsf{%
        \begin{flushright}%
          % Title
          \fontsize{24}{24}\selectfont{%
            \MakeUppercase{%
              \protect\StrBefore{#2}{ ---}
            }
          }
        \end{flushright}
        \vspace*{3mm}
      }
  \end{minipage}
  % spacing between colums
  \begin{minipage}[t]{6mm}\ \end{minipage}
  % english version
  \begin{minipage}[t]{81mm}
    \color{grey1}
    \textsf{%
      \begin{flushleft}%
        % Title
        \fontsize{24}{24}\selectfont{%
          \MakeUppercase{%
            \protect\StrBehind{#2}{--- }
          }
        }
      \end{flushleft}
      \vspace*{3mm}
    }
  \end{minipage}
}


% Lists
  % List item style
\renewcommand{\labelitemi}{$\sqbullet$}
  % Unordered list spacing
\renewenvironment{itemize}{
  \begin{list}{\labelitemi}{
    \setlength{\itemsep}{-2pt}
    \setlength{\leftmargin}{1.3em}
  }
}
{\end{list}
}
  % Ordered list spacing
\renewenvironment{enumerate}{
  \begin{list}{\arabic{enumi}.}{
    \setlength{\itemsep}{-2pt}
    \setlength{\leftmargin}{1.3em}
    \usecounter{enumi}
  }
}
{\end{list}
}


% URL style
\urlstyle{same} 
%\urlstyle{rm}


% Marginal notes
  % \boxtext{your text}
\newcommand\boxtext[1]{
  \vskip4mm
  \begin{center}
  \colorrule{grey3}{0.5\textwidth-3.5mm}{1.5pt}
  \vskip1.5mm
  \fontsize{12}{9}\selectfont{\textsf{#1}}
  \colorrule{grey3}{0.5\textwidth-3.5mm}{1.5pt}
  \end{center}
}

% For IPA characters
\newcommand\lingua[1]{[{\selectfont\linguistics #1}]}


% Lines
  % \colorrule{<color>}{<width>}{<thickness>}
\newcommand*\colorrule[3]{%
  \color{#1}\rule{#2}{#3}\normalcolor
}


% Page header and footer
  % Sans-serif pagenumber
\setkomafont{pagenumber}{%
  \fontsize{10}{1.2}\normalfont\sffamily\color{grey1}
}
  % Clear styling for head and foot
\pagestyle{scrheadings}
\clearscrheadings
\clearscrplain
\clearscrheadfoot 
\setfootwidth[27mm]{text}
  
  % Pagenumber on outer margin
\lefoot[\pagemark]{
  \colorrule{grey1}{22mm}{0.5pt}%
  \vskip1mm%
  \begin{minipage}[h]{23mm}%
    \begin{flushright}%
        \fontsize{10}{1.2}\normalfont\sffamily\color{grey1}%
      \pagemark
    \end{flushright}
  \end{minipage}
}

\rofoot[\pagemark]{
\colorrule{grey1}{22mm}{0.5pt}%
\vskip1mm%
  \begin{minipage}[h]{21mm}%
    \begin{flushleft}%
        \fontsize{10}{1.2}\normalfont\sffamily\color{grey1}%
      \pagemark
    \end{flushleft}
  \end{minipage}
}


% Captions
\addtokomafont{caption}{\sffamily}


% Bibliography
\renewenvironment{thebibliography}[1]{
  \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
    \vspace*{1cm}
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
{\def\@noitemerr
 {\@latex@warning{Empty `thebibliography' environment}}%
\endlist}
      

% Table of contents
  % remove 'Contents'
\renewcommand\contentsname{}
  % set the depth
\setcounter{tocdepth}{2}
  % the sections
\renewcommand{\cftsecfont}{\fontsize{12}{9}\selectfont\futurabook}
\renewcommand{\cftsubsecfont}{\futuralight}
\renewcommand{\cftsubsubsecfont}{\futuralight}
  % the page numbers
\renewcommand{\cftsecpagefont}{\futurabook}  
\renewcommand{\cftsubsecpagefont}{\futuralight}
\renewcommand{\cftsubsubsecpagefont}{\futuralight}


% Mocktitle
  % Maketitle
\renewcommand\maketitle{%
  \begin{titlepage}%  
    % Mocktitle
    \cleardoublepage
    \pagestyle{empty} 
    \ThisCenterWallPaper{1}{../_media/mocktitlepage.pdf}
    \vspace*{3mm}
    % Left column
    \begin{minipage}[t]{81mm}
      \color{grey3}
      \textsf{
        \begin{flushright}
          % Subtitle
          \StrBefore{\@subtitle}{ ---} \\
          \vspace*{5mm}
          % Title
          \fontsize{36}{36}\selectfont{%
            \MakeUppercase{%
              \protect\StrBehind{\@title}{--- }
            }
          }
        \end{flushright}
        \vspace*{7mm}
      }
    \end{minipage}
    % spacing between colums
    \begin{minipage}[t]{5mm}\ \end{minipage}
    % Right column
    \begin{minipage}[t]{85mm}
      \color{red}
      \textsf{
        \begin{flushleft}
          % Subtitle
          \StrBehind{\@subtitle}{--- } \\
          \vspace*{5mm}
          % Title
          \fontsize{36}{36}\selectfont{%
            \MakeUppercase{%
              \protect\StrBefore{\@title}{ ---}
            }
          }
        \end{flushleft}
        \vspace*{7mm}
      }
    \end{minipage}
    % Authors
    \begin{Parallel}[c]{81mm}{77mm}
      \ParallelLText{
        \
      }
      \ParallelRText{
        \begin{flushleft}
          \fontsize{14}{24}\selectfont{%
            \textsf{%
              \textcolor{red}{%
                \@authoraffiliation
              }
            }
          }
        \end{flushleft}
      }
      \ParallelPar
    \end{Parallel}
    \vfill
     % Left column
      \begin{minipage}[t]{81mm}\ \end{minipage}
      % spacing between colums
      \begin{minipage}[t]{5mm}\ \end{minipage}
      % Right column
      \begin{minipage}[t]{85mm}
        \textsf{\color{red}\@editors}
      \end{minipage}
    \clearpage
  \end{titlepage}
}
  % Funding notices
  % Left funding notice
\long\def\FundingLNotice#1{\gdef\@FundingLNotice{#1}}
\def\@FundingLNotice{\@latex@warning@no@line{No \noexpand\FundingLNotice given}}
  % Rightfunding notice
\long\def\FundingRNotice#1{\gdef\@FundingRNotice{#1}}
\def\@FundingRNotice{\@latex@warning@no@line{No \noexpand\FundingRNotice given}}
\newcommand{\makefundingnotice}{%
  \centerline{META-NET -- office@meta-net.eu -- http://www.meta-net.eu}

  \vfill

  \hskip90mm\colorrule{grey3}{110mm}{1.5pt}
  \vskip1mm

  \begin{minipage}[t]{81mm}
    \begin{small}
      \@FundingLNotice
    \end{small}
  \end{minipage}  
  % spacing between colums
  \begin{minipage}[t]{8mm}\ \end{minipage}
  \begin{minipage}[t]{82mm}
    \color{grey1}
    \begin{small}
      \@FundingRNotice
    \end{small}
  \end{minipage}
  
  \vskip6mm
  \hskip-29mm\colorrule{grey3}{110mm}{1.5pt}
  
  \clearpage
}


% Class options
% ----------------------------------------------------------------------------
  % Left text on spine
\def\SpineLText#1{\gdef\@SpineLText{#1}}
\def\@SpineLText{\@latex@warning@no@line{No \noexpand\SpineLText given}}
  % Right text on spine
\def\SpineRText#1{\gdef\@SpineRText{#1}}
\def\@SpineRText{\@latex@warning@no@line{No \noexpand\SpineRText given}}
  % Left text on spine
\def\quotes#1{\gdef\@quotes{#1}}
\def\@quotes{\@latex@warning@no@line{No \noexpand\quotes given}}


% Set the cover for the printversion
\DeclareOption{cover}{%
  % Define papersize for cover 420x279mm + 5mm bleed
  \setlength{\paperwidth}{430mm}%
  \setlength{\paperheight}{289mm}%
  \setlength{\textwidth}{380mm}%
%  \setlength{\width}{380mm}%
  
  % Titlepage
    % Maketitle
  \renewcommand\maketitle{%
    \begin{titlepage}%
    \ThisCenterWallPaper{1}{../_media/titlepage.pdf}
      \vspace*{3mm}
      % workaround to add 2mm to \left margin of geometry package
      \begin{minipage}[t]{1mm}\ \end{minipage}
      % Back cover
      \begin{minipage}[t]{166mm}  
        \vskip60mm
        \begin{minipage}[t]{79mm}
          \color{grey2}%
          \textsf{%
            \@SpineLText
          }
        \end{minipage}
        % Gutter 
        \begin{minipage}[t]{8mm}\ \end{minipage}
        \begin{minipage}[t]{79mm}
          \color{white}%
          \textsf{%
            \@SpineRText
          }
        \end{minipage}
        \vskip10mm
        \textsf{%
          \textcolor{white}{\@quotes}
        }
      \end{minipage}
      % Space between back and front cover
      \begin{minipage}[t]{43mm}\ \end{minipage} 
      % Front cover
      \begin{minipage}[t]{185mm} 
        % Left column
        \begin{minipage}[t]{81mm}
          \color{grey2}
          \textsf{
            \begin{flushright}
              % Subtitle
              \StrBefore{\@subtitle}{ ---} \\
              \vspace*{5mm}
              % Title
              \fontsize{36}{36}\selectfont{%
                \MakeUppercase{%
                  \protect\StrBehind{\@title}{--- }
                }
              }
            \end{flushright}
            \vspace*{7mm}
          }
        \end{minipage}
        % spacing between colums
        \begin{minipage}[t]{5mm}\ \end{minipage}
        % Right column
        \begin{minipage}[t]{85mm}
          \color{white}
          \textsf{
            \begin{flushleft}
              % Subtitle
              \textcolor{white}{%
                \StrBehind{\@subtitle}{--- }
              } \\
              \vspace*{5mm}
              % Title
              \fontsize{36}{36}\selectfont{%
                \MakeUppercase{%
                  \protect\StrBefore{\@title}{ ---}
                }
              }
            \end{flushleft}
            \vspace*{7mm}
          }
        \end{minipage}
        % Authors
        \begin{Parallel}[c]{81mm}{97mm}
          \ParallelLText{
            \
          }
          \ParallelRText{
            \begin{flushleft}
              \fontsize{14}{1.2}\selectfont{%
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
      \end{minipage} % end Front cover
    \end{titlepage}
  }
}


% Set the ebook version
\DeclareOption{ebook}{%
  \AtEndOfClass{
    \RequirePackage{varioref}
    \RequirePackage{hyperref}
  }
  
  % Define papersize for cover 210x279mm + 0mm bleed
  \geometry{paperwidth=210mm, paperheight=279mm, top=24mm, bottom=34mm, left=22mm, right=22mm}%
  
  \setfootwidth[-22mm]{paper}
  \lefoot[\pagemark]{}

  \refoot[\pagemark]{
  \colorrule{grey1}{22mm}{0.5pt}%
  \vskip1mm%
    \begin{minipage}[h]{21mm}%
      \begin{flushleft}%
          \fontsize{10}{1.2}\normalfont\sffamily\color{grey1}%
        \pagemark
      \end{flushleft}
    \end{minipage}
  }
  
  % Title & Mocktitle
    % Maketitle
  \renewcommand\maketitle{%
    \begin{titlepage}%  
      % Title
      \pagestyle{empty}
      \ThisCenterWallPaper{1}{../_media/titlepage_ebook.pdf}
      \vspace*{3mm}
      % Left column
      \begin{minipage}[t]{83mm}
        \color{grey2}
        \textsf{
          \begin{flushright}
            % Subtitle
            \StrBefore{\@subtitle}{ ---} \\
            \vspace*{5mm}
            % Title
            \fontsize{36}{36}\selectfont{%
              \MakeUppercase{%
                \protect\StrBehind{\@title}{--- }
              }
            }
          \end{flushright}
          \vspace*{7mm}
        }
      \end{minipage}
      % spacing between colums
      \begin{minipage}[t]{5mm}\ \end{minipage}
      % Right column
      \begin{minipage}[t]{85mm}
        \color{white}
        \textsf{
          \begin{flushleft}
            % Subtitle
            \StrBehind{\@subtitle}{--- } \\
            \vspace*{5mm}
            % Title
            \fontsize{36}{36}\selectfont{%
              \MakeUppercase{%
                \protect\StrBefore{\@title}{ ---}
              }
            }
          \end{flushleft}
          \vspace*{7mm}
        }
      \end{minipage}
      % Authors
      \begin{Parallel}[c]{81mm}{77mm}
        \ParallelLText{
          \
        }
        \ParallelRText{
          \begin{flushleft}
            \fontsize{14}{24}\selectfont{%
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
      % Mocktitle
      \cleardoublepage
      \ThisCenterWallPaper{1}{../_media/mocktitlepage.pdf}
      \vspace*{3mm}
      % Left column
      \begin{minipage}[t]{83mm}
        \color{grey3}
        \textsf{
          \begin{flushright}
            % Subtitle
            \StrBefore{\@subtitle}{ ---} \\
            \vspace*{5mm}
            % Title
            \fontsize{36}{36}\selectfont{%
              \MakeUppercase{%
                \protect\StrBehind{\@title}{--- }
              }
            }
          \end{flushright}
          \vspace*{7mm}
        }
      \end{minipage}
      % spacing between colums
      \begin{minipage}[t]{5mm}\ \end{minipage}
      % Right column
      \begin{minipage}[t]{85mm}
        \color{red}
        \textsf{
          \begin{flushleft}
            % Subtitle
            \StrBehind{\@subtitle}{--- } \\
            \vspace*{5mm}
            % Title
            \fontsize{36}{36}\selectfont{%
              \MakeUppercase{%
                \protect\StrBefore{\@title}{ ---}
              }
            }
          \end{flushleft}
          \vspace*{7mm}
        }
      \end{minipage}
      % Authors
      \begin{Parallel}[c]{81mm}{77mm}
        \ParallelLText{
          \
        }
        \ParallelRText{
          \begin{flushleft}
            \fontsize{14}{24}\selectfont{%
              \textsf{%
                \textcolor{red}{%
                  \@authoraffiliation
                }
              }
            }
          \end{flushleft}
        }
        \ParallelPar
      \end{Parallel}
      \vfill
       % Left column
        \begin{minipage}[t]{81mm}\ \end{minipage}
        % spacing between colums
        \begin{minipage}[t]{5mm}\ \end{minipage}
        % Right column
        \begin{minipage}[t]{85mm}
          \textsf{\color{red}\@editors}
        \end{minipage}
      \clearpage
    \end{titlepage}
  }
  
  % Makespine
  \providecommand\makespine{%
    \clearpage
    \pagestyle{empty}
    \ThisCenterWallPaper{1}{../_media/spinepage_ebook.pdf}
    \vspace*{50mm}
    % Left column
    \begin{minipage}[t]{84mm}
      \color{grey2}%
      \textsf{%
        \@SpineLText
      }
    \end{minipage}
    % spacing between colums
    \begin{minipage}[t]{5mm}\ \end{minipage}
    % Right column
    \begin{minipage}[t]{76mm}
      \color{white}%
      \textsf{%
        \@SpineRText
      }
    \end{minipage}
    \vskip10mm
    \begin{flushleft}
      \textsf{%
        \textcolor{white}{\@quotes}
      }
    \end{flushleft}
  }
}
\ProcessOptions\relax


\endinput
