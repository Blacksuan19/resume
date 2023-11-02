\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{meta/resume}[2015/05/25 An elegant Résumé class]
\LoadClass[11pt]{article}

% disable indent globally
\setlength{\parindent}{0pt}
% some general improvements, defines the XeTeX logo
\RequirePackage{xltxtra}
% use xifthen
\RequirePackage{xifthen}
% use hyperlink for email and url
\RequirePackage{hyperref}
\PassOptionsToPackage{unicode}{hyperref}
\PassOptionsToPackage{naturalnames}{hyperref}
\RequirePackage{url}
\urlstyle{tt}
% use fontawesome
\hypersetup{hidelinks}
\RequirePackage{fontawesome}
% loading fonts
\RequirePackage{fontspec}
% Main document font
\usepackage{tgtermes}
\setmainfont[
  Path = fonts/Main/ ,
  Extension = .otf ,
  UprightFont = *-regular ,
  BoldFont = *-bold ,
  ItalicFont = *-italic ,
  BoldItalicFont = *-bolditalic ,
  SmallCapsFont = Fontin-SmallCaps
]{texgyretermes}

\RequirePackage[
  a4paper,
  left=0.8in,
  right=0.8in,
  top=0.70in,
  bottom=0.55in,
  nohead
]{geometry}

\RequirePackage{titlesec}
\RequirePackage{enumitem}
\setlist{noitemsep} % removes spacing from items but leaves space around the whole list
\setlist{nosep} % removes all vertical spacing within and around the list
\setlist[itemize]{topsep=0.25em, leftmargin=1.5pc}
\setlist[enumerate]{topsep=0.25em, leftmargin=1.5pc}
\RequirePackage[super]{nth}

\titleformat{\section}         % Customise the \section command 
{\Large\scshape\raggedright} % Make the \section headers large (\Large),
% small capitals (\scshape) and left aligned (\raggedright)
{}{0em}                      % Can be used to give a prefix to all sections, like 'Section ...'
{}                           % Can be used to insert code before the heading
[\titlerule]                 % Inserts a horizontal line after the heading
\titlespacing*{\section}{0cm}{*1.8}{*1.8}

\titleformat{\subsection}
{\large\raggedright}
{}{0em}
{}
\titlespacing*{\subsection}{0cm}{*1.8}{*0.6}

% =========== new commands ==============


\newcommand{\datedsection}[2]{%
  \section[#1]{#1 \hfill #2}%
}
\newcommand{\datedsubsection}[2]{%
  \subsection[#1]{#1 \hfill #2}%
}
\newcommand{\datedline}[2]{%
  {\par #1 \hfill #2 \par}%
}

% header stuff
\newcommand{\name}[1]{
  \centerline{\Huge\scshape{#1}}
  \vspace{1.25ex}
}

\newcommand{\jobTitle}[1]{
  %   \vspace{1.25ex} % add some space after the name
  \centerline{\Large\scshape{#1}}
  \vspace{1.2ex}
}

\newcommand{\email}[1]{\faEnvelope\ \href{mailto:#1}{#1}}
\newcommand{\phone}[1]{\faPhone\ \href{tel:#1}{#1}}

\newcommand{\linkedin}[2][]{\faLinkedin\
  \ifthenelse{\isempty{#1}}%
  {\href{#2}{#2}}
  {\href{#2}{#1}}}

\newcommand{\github}[2][]{\faGithub\
  \ifthenelse{\isempty{#1}}%
  {\href{#2}{#2}}
  {\href{#2}{#1}}}

\newcommand{\kaggle}[2][]{\faDatabase\
  \ifthenelse{\isempty{#1}}%
  {\href{#2}{#2}}
  {\href{#2}{#1}}}

\newcommand{\link}[2][]{
  \ifthenelse{\isempty{#1}}%
  {\href{#2}{#2}}
  {\href{#2}{#1}}}%

\newcommand{\location}[1]{
\faMapPin\ \ {#1}
\vspace{1.25ex}
}

\newcommand{\homepage}[2][]{\faLink\
  \ifthenelse{\isempty{#1}}%
  {\href{#2}{#2}}
  {\href{#2}{#1}}}

\newcommand{\basicInfo}[1]{
  \centerline{\large{#1}}
  \vspace{1.5ex}
}

% experience stuff
\newcommand{\role}[4]{\datedsubsection{\textbf{#1} - {#2}}{#3 -- #4}}
