% phrase(ip1, Ls).
% findall(Ls, phrase(ip1, Ls), List).
% write_list_to_file('my_file.txt', [1, 2, 3]).
% write_result().
% set_prolog_flag(stack_limit, 8_294_967_296).

% nomn --- именительный
% gent --- родительный
% datv --- дательный
% accs --- винительный
% ablt --- тваротельный
% loct --- предложный

% sing --- единственное число
% plur --- множественное число

% masc --- мужской род
% femn --- женский род
% neut --- средний род

% pres --- настоящее время

write_list_to_file(File, List) :- tell(File), write_list(List), told.
write_list([]).
write_list([H|T]) :- write_sentense(H), nl, write_list(T).

write_sentense([]).
write_sentense([H|T]) :- write(H), write(" "), write_sentense(T).

write_result(ic1) :- reconsult('data.pl'), findall(Ls, phrase(ic1, Ls), List), write_list_to_file('result/ic1.txt', List).
write_result(ic2) :- reconsult('data.pl'), findall(Ls, phrase(ic2, Ls), List), write_list_to_file('result/ic2.txt', List).
write_result(ic3) :- reconsult('data.pl'), findall(Ls, phrase(ic3, Ls), List), write_list_to_file('result/ic3.txt', List).
write_result(ic4) :- reconsult('data.pl'), findall(Ls, phrase(ic4, Ls), List), write_list_to_file('result/ic4.txt', List).
write_result(ic5) :- reconsult('data.pl'), findall(Ls, phrase(ic5, Ls), List), write_list_to_file('result/ic5.txt', List).
write_result(ic6) :- reconsult('data.pl'), findall(Ls, phrase(ic6, Ls), List), write_list_to_file('result/ic6.txt', List).
write_result(ic7) :- reconsult('data.pl'), findall(Ls, phrase(ic7, Ls), List), write_list_to_file('result/ic7.txt', List).
write_result(all) :- write_result(ic1), write_result(ic2), write_result(ic3), write_result(ic4), write_result(ic5), write_result(ic6), write_result(ic7).



ic1 --> noun_phrase(Multiplicity, Sex, _), verb_phrase(Multiplicity, Sex, _).
ic1 --> verb_phrase(_, _, _).

ic2 --> pronoun(Multiplicity, Sex, Case), noun_phrase(Multiplicity, Sex, Case), verb_phrase(Multiplicity, Sex, _), ["?"].
ic2 --> pronoun(Multiplicity, Sex, Case), noun_phrase(Multiplicity, Sex, Case), ["?"].

ic3 --> pronoun(Multiplicity, Sex, Case), noun_phrase(Multiplicity, Sex, Case), ["?"].
ic3 --> ic1, ["?"].

ic4 --> ["а"], ic3.

ic5 --> pronoun(Multiplicity, Sex, Case), noun_phrase(Multiplicity, Sex, Case), ["!"].
% ic5 --> pronoun(Multiplicity, Sex, _), noun_phrase(Multiplicity, Sex, _), verb_phrase(Multiplicity, Sex, _), ["!"].

ic6 --> noun_phrase(_, _, _), ["!"].
ic6 --> ["а"], pronoun(Multiplicity, Sex, _), verb_phrase(Multiplicity, Sex, _), ["!"].
% ic6 --> ["а"], pronoun(Multiplicity, Sex, _), noun_phrase(Multiplicity, Sex, _), verb_phrase(_, _, _), ["!"].

ic7 --> pronoun(Multiplicity, Sex, _), verb_phrase(Multiplicity, Sex, _), ["!"].
% ic7 --> pronoun(Multiplicity, Sex, _), noun_phrase(Multiplicity, Sex, _), verb_phrase(_, _, _), ["!"].


noun_phrase(Multiplicity, Sex, Case) --> noun(Multiplicity, Sex, Case).                                         % Сущность это Существительное ("яблоко")
noun_phrase(Multiplicity, Sex, Case) --> adjective(Multiplicity, Sex, Case), noun(Multiplicity, Sex, Case).     % Сущность это Прилагательное + Существительное ("вкусное яблоко") [согласование в роде, числе, падеже]
noun_phrase(Multiplicity, Sex, Case) --> pronoun(Multiplicity, Sex, Case).                            % Сущность это Местоимение ("Я")

verb_phrase(Multiplicity, Sex, Tense) --> verb(Multiplicity, Sex, Tense).                                       % Действие это Глагол ("упало")
verb_phrase(Multiplicity, Sex, Tense) --> verb(Multiplicity, Sex, Tense), noun_phrase(_, _, _).                 % Действие это Глагол + Сущность ("упало на землю")
verb_phrase(Multiplicity, Sex, Tense) --> adverb(), verb(Multiplicity, Sex, Tense).                             % Действие это Наречие + Глагол ("громко упало")
verb_phrase(Multiplicity, Sex, Tense) --> adverb(), verb(Multiplicity, Sex, Tense), noun_phrase(_, _, _).       % Действие это Наречие + Глагол + Сущность ("громко упало на землю")
