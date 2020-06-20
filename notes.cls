\NeedsTeXFormat{LaTeX2e}

% the date is mandatory or it won't compile anymore
\ProvidesClass{notes}[2017/09/26 Class for notes]

\LoadClass[a4paper, oneside, 12pt]{book}

% store options in a boolean
\RequirePackage{ifthen}

% packages options flags
\newboolean{italian}
\newboolean{english}
\newboolean{palatino}

% default values
\setboolean{italian}{true}
\setboolean{english}{false}
\setboolean{palatino}{false}

\DeclareOption{english}{%
	\setboolean{italian}{false}%
	\setboolean{english}{true}%
}

\DeclareOption{palatino}{%
	\setboolean{palatino}{true}
}

% all the other options: to the parent class
\DeclareOption*{%
	\PassOptionsToClass{\CurrentOption}{book}%
}
\ProcessOptions\relax

% encoding of the input files
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}

% typography stuff
\pagestyle{headings}
\linespread{1.3}

% thinner margin because PDF's will be
% prevalently consumed on screens
\RequirePackage[margin=1in]{geometry}

% quotes
\RequirePackage{csquotes}

% tweaks for figure captions
\RequirePackage[labelfont=bf,textfont=it]{caption}

% tweaks for lists
\RequirePackage{enumitem}
\setlist{labelindent=\parindent, leftmargin=2\parindent}

% tweaks for typograhpy
\RequirePackage{microtype}

% bibs
\usepackage[style=alphabetic]{biblatex}

% enable hyperlinks in the doc
\RequirePackage{hyperref}
\hypersetup{
	linktoc=all,
	colorlinks=true,
	linkcolor={blue!70!black},
	citecolor={green}
}

% show subsubsections in TOC
\setcounter{tocdepth}{3}
\setcounter{secnumdepth}{3}

% environments for theorems
\RequirePackage{mathtools, amsthm}
\RequirePackage{thmtools, thm-restate}

% alignment for display equations
\RequirePackage{float}

% symbols
\RequirePackage{mathrsfs}
\RequirePackage{amssymb, amsfonts}
\RequirePackage{textcomp}

\RequirePackage{centernot}

\RequirePackage[thicklines]{cancel}
\renewcommand{\CancelColor}{\color{gray!60}}

% images & plots
\RequirePackage{tikz}

% \usetikzlibrary{external}
%\tikzexternalize[prefix=figures/cache/]

\usetikzlibrary{cd, arrows}

%\AtBeginEnvironment{tikzcd}{\tikzexternaldisable}
%\AtEndEnvironment{tikzcd}{\tikzexternalenable}

% finer numbering for equations
\numberwithin{equation}{section}

\newenvironment{restheorem}[2][]
	{\restatable[#1]{theorem}{#2}}
	{\endrestatable}
\newenvironment{rescorollary}[2][]
	{\restatable[#1]{corollary}{#2}}
	{\endrestatable}
\newenvironment{reslemma}[2][]
	{\restatable[#1]{lemma}{#2}}
	{\endrestatable}

% enable Appendices environment
\RequirePackage[toc, page]{appendix}

% handle class options
\ifthenelse{\boolean{italian}}{%
	\RequirePackage[italian]{babel}%
	\renewcommand{\appendixtocname}{Appendici}%
	\renewcommand{\appendixpagename}{Appendici}%
	%
	% environments defs
	\theoremstyle{plain}%
	\newtheorem{theorem}{Teorema}[chapter]%
	\newtheorem{proposition}[theorem]{Proposizione}%
	\newtheorem{corollary}{Corollario}[theorem]%
	\newtheorem{lemma}[theorem]{Lemma}%
	\newtheorem{property}[theorem]{Proprietà}%
	\newtheorem{axiom}{Assioma}%
	\newtheorem{problem}{Problema}%
	\newtheorem{question}{Domanda}%
	\newtheorem{claim}{Affermazione}%
	%
	\theoremstyle{definition}%
	\newtheorem{definition}[theorem]{Definizione}%
	\newtheorem{example}{Esempio}[chapter]%
	\newtheorem{counterexample}[example]{Controesempio}%
	\newtheorem{nonexample}[example]{Non-Esempio}%
	\newtheorem{impexample}[example]{Esempio Importante}%
	\newtheorem{exercise}[example]{Esercizio}%
	\newtheorem{construction}[theorem]{Costruzione}%
	%
	\theoremstyle{remark}%
	\newtheorem{remark}{Osservazione}[theorem]%
	%
	% starred environments defs
	\theoremstyle{plain}%
	\newtheorem*{theorem*}{Teorema}%
	\newtheorem*{proposition*}{Proposizione}%
	\newtheorem*{corollary*}{Corollario}%
	\newtheorem*{lemma*}{Lemma}%
	\newtheorem*{property*}{Proprietà}%
	\newtheorem*{axiom*}{Assioma}%
	\newtheorem*{problem*}{Problema}%
	\newtheorem*{question*}{Domanda}%
	\newtheorem*{claim*}{Affermazione}%
	%
	\theoremstyle{definition}%
	\newtheorem*{definition*}{Definizione}%
	\newtheorem*{example*}{Esempio}%
	\newtheorem*{counterexample*}{Controesempio}%
	\newtheorem*{nonexample*}{Non-Esempio}%
	\newtheorem*{impexample*}{Esempio Importante}%
	\newtheorem*{exercise*}{Esercizio}%
	\newtheorem*{construction*}{Costruzione}%
	%
	\theoremstyle{remark}%
	\newtheorem*{remark*}{Osservazione}%
}{}
\ifthenelse{\boolean{english}}{%
	\RequirePackage[english]{babel}%
	%
	% environments defs
	\theoremstyle{plain}%
	\newtheorem{theorem}{Theorem}[chapter]%
	\newtheorem{proposition}[theorem]{Proposition}%
	\newtheorem{corollary}{Corollary}[theorem]%
	\newtheorem{lemma}[theorem]{Lemma}%
	\newtheorem{property}[theorem]{Property}%
	\newtheorem{axiom}{Axiom}%
	\newtheorem{problem}{Problem}%
	\newtheorem{question}{Question}%
	\newtheorem{claim}{Claim}%
	%
	\theoremstyle{definition}%
	\newtheorem{definition}[theorem]{Definition}%
	\newtheorem{example}{Example}[chapter]%
	\newtheorem{counterexample}[example]{Counterexample}%
	\newtheorem{nonexample}[example]{Non-Example}%
	\newtheorem{impexample}[example]{Important Example}%
	\newtheorem{exercise}[example]{Exercise}%
	\newtheorem{construction}[theorem]{Construction}%
	%
	\theoremstyle{remark}%
	\newtheorem{remark}{Remark}[theorem]%
	%
	% starred environments defs
	\theoremstyle{plain}%
	\newtheorem*{theorem*}{Theorem}%
	\newtheorem*{proposition*}{Proposition}%
	\newtheorem*{corollary*}{Corollary}%
	\newtheorem*{lemma*}{Lemma}%
	\newtheorem*{property*}{Property}%
	\newtheorem*{axiom*}{Axiom}%
	\newtheorem*{problem*}{Problem}%
	\newtheorem*{question*}{Question}%
	\newtheorem*{claim*}{Claim}%
	%
	\theoremstyle{definition}%
	\newtheorem*{definition*}{Definition}%
	\newtheorem*{example*}{Example}%
	\newtheorem*{counterexample*}{Counterexample}%
	\newtheorem*{nonexample*}{Non-Example}%
	\newtheorem*{impexample*}{Important Example}%
	\newtheorem*{exercise*}{Exercise}%
	\newtheorem*{construction*}{Construction}%
	%
	\theoremstyle{remark}%
	\newtheorem*{remark*}{Remark}%
}{}
\ifthenelse{\boolean{palatino}}{%
	\RequirePackage{tgpagella}%
	\RequirePackage{mathpazo}%
}{}
