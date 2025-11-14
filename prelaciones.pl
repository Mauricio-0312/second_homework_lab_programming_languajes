% Alumno: Mauricio Fragachan
% Carnet: 20-10265

% Hechos base: prela(Materia, Prelacion)
% Significa que Prelacion es una prelación directa de Materia.

prela(ci2691, ci3661).
prela(ci2525, ci2691).
prela(ci2691, ci3641).
prela(ci3641, ci3725).
prela(ci3725, ci3825).
prela(ma1111, ci2525).

% 1. prelacion_directa(A, B)
% Verdadero si A es prelación directa de B.
prelacion_directa(A, B) :-
    prela(A, B).

% 2. prelacion_total(A, B)
% Verdadero si A es prelación directa o indirecta de B.
% (recursivo)
prelacion_total(A, B) :-
    prela(A, B).  % caso base: directa

prelacion_total(A, B) :-
    prela(A, X),          % A es prelación directa de X
    prelacion_total(X, B). % X es prelación total de B

% Ejemplos de prueba:
% prelacion_total(ci2525, ci3661).   % true.
% prelacion_total(ma1111, ci3825).   % true.
% prelacion_total(ci3661, ci3725).   % false.
