% a) Napisz predykat split2(Filename, FileNameA, FileNameB), 
% który rozdziela plik FileName na dwa pliki FileNameA i FileNameB. 
% Do pierwszego trafiają znaki z pliku FileName znajdujące się na 
% pozycjach parzystych (licząc od zera), a do drugiego pozostałe.

split2(Filename, FilenameA, FilenameB) :-
    open(Filename, read, ReadStream, [type(text)]),
    open(FilenameA, write, OddStream, [type(text)]),
    open(FilenameB, write, EvenStream, [type(text)]),
    get_char(ReadStream, Char),
    process(ReadStream, EvenStream, OddStream, Char),
    close(ReadStream),
    close(OddStream),
    close(EvenStream).

process(_, _, _, end_of_file).
process(ReadStream, OddStream,EvenStream, Char) :-
    not(Char == end_of_file),
    put_char(OddStream, Char),
    get_char(ReadStream, NewChar),
    process(ReadStream, EvenStream, OddStream, NewChar).

% b) Napisz predykat join2( FileNameA, FileNameB, FileName), 
% który łączy plik FileNameA i FileNameB powstałe w wyniku działania 
% poprzedniego predykatu, odtwarzając tym samym oryginalny plik FileName. 
% Inaczej mówiąc predykat split2 przeplata znaki z dwóch pierwszych 
% plików i zapisuje wynik do trzeciego pliku.

join2(FileNameA, FileNameB, FileName) :-
    open(FileNameA, read, OddStream, [type(text)]),
    open(FileNameB, read, EvenStream, [type(text)]),
    open(FileName, write, OutStream, [type(text)]),
    get_char(OddStream, Char),
    process2(OutStream, OddStream, EvenStream, Char),
    close(OddStream),
    close(EvenStream),
    close(OutStream).

process2(_, _, _, end_of_file).
process2(OutStream, OddStream, EvenStream, Char) :-
    not(Char == end_of_file),
    put_char(OutStream, Char),
    get_char(EvenStream, NewChar),
    process2(OutStream, EvenStream, OddStream, NewChar).