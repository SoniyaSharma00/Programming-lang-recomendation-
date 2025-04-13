% Simple Expert System in Prolog for Programming Language Recommendation

% Knowledge base: Programming languages based on user preferences

% Language rules based on multiple factors
language(python) :- 
    preference(easy_to_learn); 
    preference(data_science); 
    preference(automation); 
    preference(scripting); 
    preference(ai_ml).

language(java) :- 
    preference(object_oriented), 
    (preference(mobile_development); preference(scalable); preference(enterprise_apps); preference(backend)).

language(javascript) :- 
    preference(web_development), 
    (preference(frontend); preference(dynamic); preference(full_stack); preference(interactivity)).

language(c) :- 
    preference(system_programming), 
    (preference(performance); preference(low_level); preference(embedded_systems); preference(memory_management)).

language(ruby) :- 
    preference(web_development), 
    (preference(productivity); preference(readability); preference(startups); preference(rapid_prototyping)).

language(cpp) :- 
    preference(system_programming), 
    (preference(performance); preference(gaming); preference(software_engineering); preference(oop)).

language(r) :- 
    preference(data_science), 
    (preference(statistics); preference(machine_learning); preference(bioinformatics); preference(visualization)).

language(swift) :- 
    preference(mobile_development), 
    (preference(ios); preference(safety); preference(modern_syntax)).

language(go) :- 
    preference(scalable), 
    (preference(concurrent_programming); preference(cloud_development); preference(server_side)).

language(kotlin) :- 
    preference(mobile_development), 
    (preference(android); preference(safety); preference(object_oriented); preference(modern_syntax)).

language(php) :- 
    preference(web_development), 
    (preference(backend); preference(server_side); preference(cms); preference(php_frameworks)).


display_recommendation :-
    language(Language),
    write('You should consider learning: '), write(Language), nl, fail.
display_recommendation.

% Start the system
start :-
    write('Programming Language Recommendation Expert System'), nl,
    write('Answer the following questions with yes or no.'), nl,
    ask_preferences,
    display_recommendation,
    write('Recommendation complete.'), nl.

% Asking preferences dynamically
ask_preferences :-
    retractall(preference(_)), % Clear previous preferences
    write('Do you want an easy-to-learn language? (yes/no)'), nl,
    read(Ans1), process_answer(Ans1, easy_to_learn),
    write('Are you interested in data science? (yes/no)'), nl,
    read(Ans2), process_answer(Ans2, data_science),
    write('Do you need a language for automation? (yes/no)'), nl,
    read(Ans3), process_answer(Ans3, automation),
    write('Do you prefer object-oriented programming? (yes/no)'), nl,
    read(Ans4), process_answer(Ans4, object_oriented),
    write('Are you interested in mobile development? (yes/no)'), nl,
    read(Ans5), process_answer(Ans5, mobile_development),
    write('Do you want a scalable language? (yes/no)'), nl,
    read(Ans6), process_answer(Ans6, scalable),
    write('Are you focused on web development? (yes/no)'), nl,
    read(Ans7), process_answer(Ans7, web_development),
    write('Do you prefer frontend development? (yes/no)'), nl,
    read(Ans8), process_answer(Ans8, frontend),
    write('Do you need a dynamic language? (yes/no)'), nl,
    read(Ans9), process_answer(Ans9, dynamic),
    write('Are you interested in system programming? (yes/no)'), nl,
    read(Ans10), process_answer(Ans10, system_programming),
    write('Do you need high performance? (yes/no)'), nl,
    read(Ans11), process_answer(Ans11, performance),
    write('Do you want a low-level language? (yes/no)'), nl,
    read(Ans12), process_answer(Ans12, low_level),
    write('Are you looking for productivity and readability? (yes/no)'), nl,
    read(Ans13), process_answer(Ans13, readability).

% Store preference if the answer is yes
process_answer(yes, Preference) :- assertz(preference(Preference)).
process_answer(no, _).