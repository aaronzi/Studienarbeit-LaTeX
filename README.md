# Studienarbeit LaTeX für Fortgeschrittene

## Aufgabenstellung

1. Programmieren Sie eine eigene Dokumentenklasse HTWself.
   
  (a) HTWself soll die folgenden Eigenschaften und Parameter beinhalten.
  
    i.   Programmieren sie zwei Optionen, htwLogo (Verwendung für Laborberichte) und
         htwWeiteres (Verwendung für Prüfungen), für HTWself. In Abhängigkeit der gewählten
         Option soll ein eigenes Dokumentencover ausgegeben werden. Gestalten
         Sie die Minimalversionen beider Cover.
         
    ii.  Initialisieren Sie alle notwendigen und hinreichenden Pakete und Optionen, die
         für diese Dokumentenklasse notwendig sind.
         
  (b) Erstellen Sie drei Kapitel.
  
    i.   Programmieren Sie das Logo der Hochschule für Technik und Wirtscha Berlin.
         Das Logo soll mit htwLogo ausgegeben werden. Verwenden Sie den Funktionsbefehl
         \multido.
         
    ii.  Programmieren Sie ein Schachbrett. Dabei sind die “üblichen” schwarzen Felder
         über eine variierende Farbtiefe mittels fillcolor=blue[<Variable>] abzubilden. Diese
         Farbvariation – über alle Felder – soll ausschließlich über den Befehl \multido
         realisiert werden. Das Schachbrett soll ausgegeben werden, wenn die Option
         htwWeiteres kompiliert wird.
         
    iii. Stellen Sie eine Kurvenschar von vier Funktionen eines Polynoms fünen Gra-
         des dar. Verwenden Sie den Funktionsbefehl \multido um die Vielfachheit der
         Funktion abzubilden. Die Kurvenschar soll im Intervall [−5,5] abgebildet werden.
         Für eine geeignete Darstellung sollen mindesten sechs Parameter/Optionen für
         die Gestaltung der Koordinatenachsen oder des Koordinatensystems verwendet
         werden. Das Koordinatensystem soll ausgegeben werden, wenn die Option
         htwWeiteres und die Option htwLogo kompiliert wird.
