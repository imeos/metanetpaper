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
\LoadClass[10pt, twoside]{scrartcl}

\usepackage[paperwidth=210mm, paperheight=279mm, left=18mm, textwidth=169mm]{geometry}

\usepackage{graphicx}
\usepackage{hyperref}


% Colorize and customize the headings
\usepackage{color}
\usepackage{titlesec}
% Generate TOC with hyperlinks inside document
\usepackage{hyperref}
% Custom background-images
\usepackage{wallpaper}
% XeLaTeX packages 
\usepackage[T1]{fontenc}
\usepackage{fontspec}
% Header and footer
\usepackage{fancyhdr}
% Marginnote
\usepackage{marginnote}
%Two columns per page
\usepackage{pdfcolparallel}
% Package for line-spacing
\usepackage{setspace}


% Eigene Definitionen
% -------------------

% Indent for new Paragraphs
\setlength{\parindent}{0pt}

% Select fonts
\setmainfont[Mapping=tex-text]{Adobe Garamond Pro}
\setsansfont[Mapping=tex-text]{Futura Std}
\setmonofont{Courier New}

% Farben
\definecolor{yellow}{rgb}{0.95,0.72,0}
\definecolor{orange}{rgb}{0.94,0.33,0}
\definecolor{lightorange}{rgb}{1,0.8,0.6}
\definecolor{red}{rgb}{0.7,0,0}
\definecolor{white}{rgb}{1,1,1}

% Headings - \section
\titleformat{\section}{
  \fontsize{18}{20}\selectfont \sffamily  \uppercase
}{--- \thesection \ ---}{1.12em}{\protect\linebreak}
% Headings - \subsection
\titleformat{\subsection}{
  \vskip 0.5cm \fontsize{13}{15}\selectfont \sffamily
}{\thesubsection}{1em}{}
% Headings - \subsubsection
\titleformat{\subsubsection}{
  \vskip 0.2cm \fontsize{11}{15}\selectfont \sffamily
}{\thesubsubsection}{0.62em}{}

% Ungeordnete Listen
\newenvironment{my_itemize}{
\begin{itemize}
  \setlength{\itemsep}{1pt}
  \setlength{\parskip}{0pt}
  \setlength{\parsep}{0pt}}{\end{itemize}
}

% Header and footer
\pagestyle{fancy}
\fancyhead[LE]{\textsf \rightmark}
\fancyhead[RO]{\textsf \leftmark}
\fancyhead[LO,RE]{}
\fancyfoot[C]{}
\fancyfoot[LE]{\vspace{0.1cm} \textsf{\thepage} \hskip 0.4cm \rule[-1.4cm]{0.25pt}{2cm}}
\fancyfoot[RO]{\vspace{0.3cm} \rule[-1.1cm]{0.25pt}{1.6cm} \hskip 0.2cm \textsf{\thepage}}

% Marginalien
\newcommand{\boxtext}[1]{
	\begin{center}
		{\textbf{#1}}
	\end{center}}
	
% Untertitel

% Titelseite
\renewcommand\maketitle{%
  \begin{titlepage}%
  	\ThisCenterWallPaper{1}{../media/titlepage.pdf}
  	  \begin{center}
        \parbox{11cm}{
      	  \begin{center}
        	  \vspace*{3.7cm}
        	  \begin{spacing}{2.5}
        	    \textsf{
          	    \Huge{
                  \MakeUppercase{
                    \@title % title
                  }
                }
              }\\
              \textit{
                \fontsize{13}{15}\selectfont{
                  -- \@subtitle \ -- % subtitle
                }
              }
            \end{spacing}
        	\end{center}
        }  
      	\end{center}
    \vfill
  \end{titlepage}
}

\endinput
