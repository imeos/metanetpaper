\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{/Users/chris/Documents/Studies/FHP/DFKI/metanetpaper/metanetpaper}[2011/09/19 LaTeX class to typeset bilingual papers of the DFKI META-NET Project]

% Use class 'article'
\LoadClass[]{article}

\usepackage[]{graphicx}
% Parallel, two-column layout
\usepackage{parallel}
% ...  in EN ISO 216 B5 format
\usepackage[paper=b5paper]{geometry}

% The basic layout
\setlength{\textheight}{180mm}
\setlength{\textwidth}{125mm}
\setlength{\parindent}{0pt} % No indent for new paragraphs

% ========= Kopfzeile =================     
  \sbox{\firmhead}{\parbox{\textwidth}{%
   \begin{minipage}[t]{180mm}
   \mbox{}\\
   \includegraphics[width=180mm]{/Users/chris/Documents/Studies/FHP/DFKI/dfkipapr/media/meta-net_header.pdf}
   \end{minipage}
   \begin{minipage}[t]{\rightfield}
   \vspace{0.2ex}
    \usebox{\FIRM}
	\end{minipage}\\[8pt]
	\rule{\textwidth}{1pt}}}
