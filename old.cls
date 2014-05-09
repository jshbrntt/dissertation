%\section{Class declaration}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cmpreport}[23/07/2013 v2.1 (Pierre Chardaire) Third year Project Report]
% Base this class on KOMA script article class file
% A 5mm binding is added to margin
%
\LoadClass[12pt,BCOR0.5cm,twoside=false,appendixprefix=false]{scrartcl}

%\KOMAoptions{appendixprefix=true}.
% Required packages
%
% Font combination
%
\RequirePackage{mathptmx}                 %doc 3 format
\RequirePackage[scaled=0.9]{helvet}       %doc 3 format
\RequirePackage{courier}                  %doc 3 format
%\RequirePackage{ccfonts,eulervm}         %doc 1 format
%\renewcommand{\mathbf}{\mathbold}        %doc 1 format
%\RequirePackage{lmodern}                 %doc 2 format
%\RequirePackage[math]{iwona}             %doc 2 format
\RequirePackage[T1]{fontenc}
%\renewcommand*\familydefault{\sfdefault} %doc 2 format
%
% needed for changing geometry of marksheets
%
\RequirePackage{geometry}
%
% for citing (and necessary for APA style)
%
\RequirePackage{natbib}
\bibliographystyle{apalike}
%
% Students will have figures in their report
%
\RequirePackage{graphicx}
%
% Ensure that table captions are above tables and figure captions are below figure
% independently of the position of the caption command in the latex source
%
\RequirePackage{float}
%\floatstyle{komabelow}
%\restylefloat{figure}
%\setlength{\abovecaptionskip}{5pt plus 2pt minus 2pt}
%\floatstyle{komaabove}
%\restylefloat{table}
%\setlength{\belowcaptionskip}{5pt plus 2pt minus 2pt}
%
% KOMA-script package for headings
%
\RequirePackage{scrlayer-scrpage}
%
% Enables to handle url in citations
% Also allow clickable section/citations/refs in PDF
%
\RequirePackage{hyperref}
%
% Links are underlined, but these lines do not appear in printed PDF
%
\hypersetup{colorlinks=false,pdfborderstyle={/S/U/W 1}}
%
% url wrapping
%
\g@addto@macro{\UrlBreaks}{\UrlOrds}
%
% url style: more compact than default tt 
%
\def\url@ukostyle{%
\@ifundefined{selectfont}{\def\UrlFont{\sf}}{\def\UrlFont{\sf\slshape}}} 
\urlstyle{uko}
%
% Captions are left aligned
%
\RequirePackage[justification=justified,singlelinecheck=false]{caption}
%
% Numbering of figures and table
%
\RequirePackage{chngcntr}
\counterwithin{figure}{section}
\counterwithin{table}{section}
\counterwithin{equation}{section}
%
% Creation of better tables
%
\RequirePackage{array}
\RequirePackage{ragged2e}
\RequirePackage{booktabs}
\newcolumntype{L}[1]{>{\RaggedRight\hspace{0pt}}p{\dimexpr #1\linewidth-2\tabcolsep}}
\newcolumntype{R}[1]{>{\RaggedLeft\hspace{0pt}}p{\dimexpr #1\linewidth-2\tabcolsep}}
\newcolumntype{C}[1]{>{\Centering\hspace{0pt}}p{\dimexpr #1\linewidth-2\tabcolsep}}
\newcolumntype{M}[1]{>{\Centering\hspace{0pt}}m{\dimexpr #1\linewidth-2\tabcolsep}}

\newlength{\arrayrulewidthOriginal}
\newcommand{\Hline}[1]{%
  \noalign{\global\setlength{\arrayrulewidthOriginal}{\arrayrulewidth}}%
  \noalign{\global\setlength{\arrayrulewidth}{#1 pt}}\hline%
  \noalign{\global\setlength{\arrayrulewidth}{\arrayrulewidthOriginal}}}

\newcommand{\LL}{\RaggedRight}
\newcommand{\RR}{\RaggedLeft}
\newcommand{\CC}{\Centering}

%
% As we don't want students to change the cmidrule weight we can make the option format 
% more consistent
% 
\RequirePackage{xparse}
%
\let\@originalcmidrule\cmidrule
\DeclareExpandableDocumentCommand{\cmidrule}{o m}{%
\IfNoValueTF{#1} 
       {\@originalcmidrule{#2}}
       {\@originalcmidrule (#1){#2}}
}
\renewcommand{\lightrulewidth}{\cmidrulewidth}
\newcommand{\uhrule}{\midrule[\heavyrulewidth]}
%
% To align numbers on decimal points in tables
% amongst other things
%
\RequirePackage{siunitx}
%
% To simplify use of multicolumns
%
\DeclareExpandableDocumentCommand{\mcc}{o d() m}{% 
\IfNoValueTF{#1} 
    {%    
        \IfNoValueTF{#2}
        {\multicolumn{1}{c}{#3}}
        {\multicolumn{1}{C{#2}}{#3}}
    }
    {%    
        \IfNoValueTF{#2}
        {\multicolumn{#1}{c}{#3}}
        {\multicolumn{#1}{C{#2}}{#3}}        
    }
}
\DeclareExpandableDocumentCommand{\mcl}{o d() m}{% 
\IfNoValueTF{#1} 
    {%    
        \IfNoValueTF{#2}
        {\multicolumn{1}{l}{#3}}
        {\multicolumn{1}{L{#2}}{#3}}
    }
    {%    
        \IfNoValueTF{#2}
        {\multicolumn{#1}{l}{#3}}
        {\multicolumn{#1}{L{#2}}{#3}}        
    }
}
\DeclareExpandableDocumentCommand{\mcr}{o d() m}{% 
\IfNoValueTF{#1} 
    {%    
        \IfNoValueTF{#2}
        {\multicolumn{1}{r}{#3}}
        {\multicolumn{1}{R{#2}}{#3}}
    }
    {%    
        \IfNoValueTF{#2}
        {\multicolumn{#1}{r}{#3}}
        {\multicolumn{#1}{R{#2}}{#3}}        
    }
}
%
%
% table with tablenotes
%
\RequirePackage{threeparttable}
%
% to create note in middle of text
%
\newcommand{\mtnote}[1]{\textsuperscript{\TPTtagStyle{#1}}}
\g@addto@macro\TPT@opt@flushleft{\labelsep.0em}
%
% table environment
%
\let\@originaltable\table
\let\@endoriginaltable\endtable
\RenewDocumentEnvironment{table}{o m}
{\IfNoValueTF{#1} 
       {\@originaltable\threeparttable\caption{#2}}
       {\@originaltable[#1]\threeparttable\caption{#2}}}
{\endthreeparttable\@endoriginaltable}
%
\renewcommand{\TPTminimum}{\textwidth}
%
\let\@originaltablenotes\tablenotes
\let\@endoriginaltablenotes\endtablenotes
\RenewDocumentEnvironment{tablenotes}{}
{\footnotesize\@originaltablenotes[flushleft]}
{\@endoriginaltablenotes}
%
% For creating figures with subfigures
%
\RequirePackage{subcaption}
%
% Figure environment
%
\let\@originalfigure\figure
\let\@endoriginalfigure\endfigure
\RenewDocumentEnvironment{figure}{o m}
{  \IfNoValueTF{#1} 
       {\@originalfigure}
       {\@originalfigure[#1]}}
{\caption{#2}\@endoriginalfigure}
%
% To create conditional lists of tables and list of figures
%
\RequirePackage{etoolbox}
\AtEndEnvironment{figure}{\gdef\there@is@a@figure{}} 
\AtEndEnvironment{table}{\gdef\there@is@a@table{}} 
\AtEndDocument{\ifdefined\there@is@a@figure\label{fig:was:used:in:doc}\fi} 
\AtEndDocument{\ifdefined\there@is@a@table\label{tab:was:used:in:doc}\fi} 

\newcommand{\conditionalLoF}{\@ifundefined{r@fig:was:used:in:doc}{}{\listoffigures}}%
\newcommand{\conditionalLoT}{\@ifundefined{r@tab:was:used:in:doc}{}{\listoftables}}%

\newif\if@list
\@listtrue
\newcommand{\nolist}{\renewcommand{\listoffigures}{}\renewcommand{\listoftables}{}\@listfalse}
%
% For table of content
%
\RequirePackage[title,titletoc,toc]{appendix}
\RequirePackage[nottoc,notlof,notlot]{tocbibind}
\settocbibname{References}
%
% For mathematics
%
\RequirePackage{amsmath}
%
% for the admnin option (i.e. to write tutorials in same format as report)
%
\let\@originalauthor\author
\global\let\@myauthor\@empty
\renewcommand*{\author}[1]{%
\@originalauthor{#1}\renewcommand*{\@myauthor}{#1}}
%
% supervisor's name
%
\newcommand*{\supervisor}[1]{\renewcommand*{\@supervisor}{#1}}
\newcommand*{\@supervisor}{\ClassError{cmpfinalreport}{No \string\supervisor\space given}{}}
%
% registration number (note stutent submissions are anonymised so no concept of author name)
%
\newcommand*{\registration}[1]{\renewcommand*{\@registration}{#1}}
\newcommand*{\@registration}{\ClassError{cmpfinalreport}{No \string\registration\space given}{}}
%
% course code
%
\newcommand*{\ccode}[1]{\renewcommand*{\@ccode}{#1}}
\newcommand*{\@ccode}{\ClassError{cmpfinalreport}{No \string\ccode\space given}{}}
%
% acknowledgements
% (used in final report only if students wants to include acknowledgements)
%
\global\let\@acknowledgements\@empty
\newcommand{\acknowledgements}[1]{\renewcommand{\@acknowledgements}{#1}}
%
% summary (replace use of abstract environment)
%
\newcommand{\summary}[1]{\renewcommand{\@summary}{#1}}
\newcommand{\@summary}{\ClassError{cmpfinalreport}{No \string\summary\space given}{}}
%
\AtBeginDocument{%
\let\default@color\current@color
\maketitle
}
%
% Options. cmpreport can be used with four exclusive (exclusivity not tested) options
% proposal/review/progress/final for the four pieces of work returned by students
%
\newif\if@nottutorial
\@nottutorialtrue
\DeclareOption{tutorial}{
    \@nottutorialfalse
}
\newif\if@intermediate
\@intermediatetrue
\DeclareOption{final}{
    \@intermediatefalse
}
\DeclareOption{proposal}{
    \newcommand*{\@worktitle}{Project proposal}
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Marksheet at end of document
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    \AtEndDocument{
        \clearpage
        % \InputIfFileExists{marksheetproposal.tex}{}{Missing marksheet}
        \thispagestyle{empty}
        \newgeometry{left=1cm,right=1cm,top=1cm,bottom=1cm}
        \renewcommand\thepage{}
        \noindent{\bf\@ccode}\hspace{\stretch{1}}
        {\bf Student registration number:\@registration}
        \\
        \\
        \begin{tabular}{|p{13.8cm}|c|c|c|c|c|}
        \multicolumn{6}{l}{{\bf Project proposal}}\\
        \hline
        Description of project: aims, motivation, understanding of issues, problems & First & 2.1 & 2.2 & 3 & Fail\\
        \hline
        Resources, references: evidence of preliminary work to identify key resources, initial reading & First & 2.1 & 2.2 & 3 & Fail\\
        \hline
        Proposed approaches: relevance, suitability, appropriateness & First & 2.1 & 2.2 & 3 & Fail\\
        \hline
        Risks: identification, suitable contingency planning & First & 2.1 & 2.2 & 3 & Fail\\
        \hline
        \multicolumn{6}{l}{{\bf Quality of writing}}\\
        \hline
        Clarity, structure correctness of writing & First & 2.1 & 2.2 & 3 & Fail\\
        \hline
        Presentation conforms to style  & First & 2.1 & 2.2 & 3 & Fail\\
        \hline
        \multicolumn{6}{l}{{\bf Workplan}}\\
        \hline
        Measurable objectives : appropriate, realistic, timely & First & 2.1 & 2.2 & 3 & Fail\\
        \hline
        Gantt chart: legibility, clarity, feasibility of schedule  & First & 2.1 & 2.2 & 3 & Fail\\
        \hline
        \multicolumn{6}{l}{{\bf Comments}}\\
        \hline
        \multicolumn{6}{|l|}{\rule{0pt}{17 cm}}\\
        \hline
        \multicolumn{6}{|l|}{Supervisor: \makeatletter \@supervisor \makeatother}\\
        \hline
        \end{tabular}
        \vspace{1em}\\
        Markers should circle the appropriate level of performance in each section. Report and evaluation sheet should be   collected by the student from the supervisor.
        \restoregeometry
    } %\AtEndDocument
} %\DeclareOption{proposal}
\DeclareOption{review}
{
    \newcommand*{\@worktitle}{Literature review}
    \AtEndDocument{
        \clearpage
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % Marksheet at end of document
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        \thispagestyle{empty}
        \newgeometry{left=1cm,right=1cm,top=1cm,bottom=1cm}
        \renewcommand\thepage{}
        {\bf\noindent\@ccode}
        \hspace{\stretch{1}}
        {\bf Student registration number: \@registration}
        \\
        \\
        \begin{tabular}{|p{13.8cm}|c|c|c|c|c|}
        \multicolumn{6}{l}{{\bf Literature review}}\\
        \hline
        Introduction: brief description of project, areas of knowledge required, roadmap & First & 2.1 & 2.2 & 3 & Fail\\
        \hline
        Discovery of suitable quantity and quality of material & First & 2.1 & 2.2 & 3 & Fail\\
        \hline
        Description of key issues and themes relevant to the project & First & 2.1 & 2.2 & 3 & Fail\\
        \hline
        Evaluation, analysis and critical review & First & 2.1 & 2.2 & 3 & Fail\\
        \hline
        \multicolumn{6}{l}{{\bf Quality of writing}}\\
        \hline
        Clarity, structure and correctness of writing & First & 2.1 & 2.2 & 3 & Fail\\
        \hline
        Presentation conforms to style (criteria similar to conference paper reviews) & First & 2.1 & 2.2 & 3 & Fail\\
        \hline
        References correctly presented, complete adequate (but no excessive) citations & First & 2.1 & 2.2 & 3 & Fail\\
        \hline
        \multicolumn{6}{l}{{\bf Revised Workplan (if applicable)}}\\
        \hline
        Measurable objectives : appropriate, realistic, timely & First & 2.1 & 2.2 & 3 & Fail\\
        \hline
        \multicolumn{6}{l}{{\bf Comments}}\\
        \hline
        \multicolumn{6}{|l|}{\rule{0pt}{17 cm}}\\
        \hline
        \multicolumn{6}{|l|}{Supervisor: \makeatletter \@supervisor \makeatother}\\
        \hline
        \end{tabular}
        \vspace{0.5cm}\\
        Markers should circle the appropriate level of performance in each section. Report and evaluation sheet should be   collected by the student from the supervisor.
        \restoregeometry
    } %\AtEndDocument
} %\DeclareOption{review}
\DeclareOption{progress}
{
    \newcommand*{\@worktitle}{Progress report}
    \AtEndDocument{
        \clearpage
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % Marksheet at end of document
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        \thispagestyle{empty}
        \newgeometry{left=1cm,right=1cm,top=1cm,bottom=1cm}
        \renewcommand\thepage{}
        {\bf\noindent\@ccode}
        \hspace{\stretch{1}}
        {\bf Student registration number: \@registration}
        \\
        \\
        \begin{tabular}{|p{13.8cm}|c|c|c|c|c|}
        \multicolumn{6}{l}{{\bf Progress report}}\\
        \hline
        Description of project: aims, motivation & First & 2.1 & 2.2 & 3 & Fail\\
        \hline
        Description and understanding of issues and problems addressed in the project & First & 2.1 & 2.2 & 3 & Fail\\
        \hline
        Achievement so far according to what is reasonably expected for the type of project & First & 2.1 & 2.2 & 3 & Fail\\
        \hline
        Discussion and justification of changes to project aims, scope, workplan & First & 2.1 & 2.2 & 3 & Fail\\
        \hline
        \multicolumn{6}{l}{{\bf Quality of writing}}\\
        \hline
        Clarity, structure correctness of writing & First & 2.1 & 2.2 & 3 & Fail\\
        \hline
        \multicolumn{6}{l}{{\bf Comments}}\\
        \hline
        \multicolumn{6}{|l|}{\rule{0pt}{19 cm}}\\
        \hline
        \multicolumn{6}{|l|}{Supervisor: \makeatletter \@supervisor \makeatother}\\
        \hline
        \end{tabular}
        \vspace{0.5cm}\\
        Markers should circle the appropriate level of performance in each section. Report and evaluation sheet should be   collected by the student from the supervisor.
        \restoregeometry
    } %\AtEndDocument
} %\DeclareOption{progress}
\ProcessOptions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% headings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\if@nottutorial
  %
  \newpagestyle{reportheadings}
  {(0pt,0pt){}{}{\@ccode\hfill\headmark}(\textwidth,1pt)} % header
  {(\textwidth,1pt){}{}{Reg:~\@registration\hfill\pagemark}(0pt,0pt)} % footer
  \newpagestyle{titlepageheading}
  {(0pt,0pt){}{}{\@ccode\hfill\@worktitle}(\textwidth,1pt)} % header
  {(\textwidth,1pt){}{}{Reg:~\@registration\hfill{}For\space\@supervisor}(0pt,0pt)} % footer
\else
  \newpagestyle{reportheadings}
  {(0pt,0pt){}{}{Third year project tutorial\hfill\headmark}(\textwidth,1pt)} % header
  {(\textwidth,1pt){}{}{\@myauthor\hfill\pagemark}(0pt,0pt)} % footer
\fi
%
% Because \maketitle issue a \thisplagestyle{plain} at
% the end of execution
%
\g@addto@macro{\maketitle}{\thispagestyle{reportheadings}}
\if@nottutorial
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  % Inital proposal/literrature survey
  % (the name of supervisor appears in te title page headings)
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    \if@intermediate
    \renewcommand{\@maketitle}{%
        \thispagestyle{titlepageheading}
        \begin{center}
                \vspace*{\fill}
                \let\footnote\thanks
                {\LARGE\bfseries \@title\par}%
                \vskip 1em\relax
                \ifx\@myauthor\@empty
                    \relax
                \else
                    {\Large  \@myauthor}\\[\baselineskip]
                \fi
                {\large registration:~\@registration}
                \vspace*{\fill}
        \end{center}
        \newpage
    }
    \pagestyle{reportheadings}
    \else
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Final report
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
    \renewcommand{\@maketitle}{%
        \pagenumbering{roman}
        \thispagestyle{empty}     
        \newgeometry{left=2.5cm,right=2cm,top=1cm,bottom=2cm}
        { \centering
          \vspace*{\baselineskip}
          \ifx\@myauthor\@empty
              \relax
          \else
              {\Large  \@myauthor}\\[\baselineskip]
          \fi
          { Registration number~\@registration}\\[\baselineskip]
          \rule{\textwidth}{1.6pt}\vspace*{-\baselineskip}\vspace{4pt}
          \rule{\textwidth}{0.4pt}\\
          \begingroup
             \hyphenpenalty 10000
             \exhyphenpenalty 10000
             {\noindent\Huge\bfseries \@title\par}
          \endgroup
          \rule{\textwidth}{0.4pt}\vspace*{-\baselineskip}\vspace{5pt}
          \rule{\textwidth}{1.6pt}\\
          \vskip 2\baselineskip\relax
          { Supervised by~\@supervisor}\par
          \vspace*{\fill}
          \includegraphics[width=3cm]{uealogo.png}\\
          { University of East Anglia}\\
          { Faculty of Science}\\
          { School of Computing Sciences}\\
          \par
        }
        \restoregeometry
        \newpage
        \thispagestyle{empty}
        %
        %  Dealing with optional acknowledgements
        %
        \section*{Abstract}
        \@summary
        \ifx\@acknowledgements\@empty
                \relax
        \else
                \section*{Acknowledgements}
                \@acknowledgements
        \fi %
        \newpage
        \tableofcontents
        \newpage
        \if@list
           \conditionalLoF
           \newpage
           \conditionalLoT
           \newpage
        \fi
        \pagenumbering{arabic}
        \setcounter{page}{1}
      }
      \pagestyle{reportheadings}
      \renewcommand{\baselinestretch}{1.3}
\fi
%
%
%
\else
\pagestyle{reportheadings}
\fi %end \if@nottutorial 
