% Alumno: Mauricio Fragachan
% Carnet: 20-10265

% Hechos base

% dicta(Profesor, Materia)
dicta(leonardo, ci3661).
dicta(maria, ci3725).
dicta(pedro, ci2691).

% cursa(Estudiante, Materia)
cursa(ana, ci3661).
cursa(ana, ci3725).
cursa(juan, ci3661).
cursa(elena, ci2691).
cursa(elena, ci3725).

% nota(Estudiante, Materia, Nota)
nota(ana, ci3661, 88).
nota(ana, ci3725, 70).
nota(juan, ci3661, 40).
nota(elena, ci2691, 51).
% elena no tiene nota en ci3725

% 1. profesor_de(Prof, Est)
% Verdadero si Prof le da clases a Est en al menos una materia.
profesor_de(Prof, Est) :-
    dicta(Prof, Mat),
    cursa(Est, Mat).

% 2. aprobado(Est, Mat)
% Verdadero si Est cursó Mat y obtuvo nota >= 50.
aprobado(Est, Mat) :-
    nota(Est, Mat, Nota),
    Nota >= 50.

% 3. aplazado(Est)
% Verdadero si Est ha aplazado (nota < 50) alguna materia.
aplazado(Est) :-
    nota(Est, _, Nota),
    Nota < 50.

% 4. cursando_sin_nota(Est, Mat)
% Verdadero si Est cursa Mat pero no tiene nota registrada.
cursando_sin_nota(Est, Mat) :-
    cursa(Est, Mat),
    not(nota(Est, Mat, _)).

% Ejemplos de prueba:
% profesor_de(leonardo, ana).        % true.
% aprobado(elena, ci2691).           % true.
% aplazado(juan).                    % true.
% cursando_sin_nota(elena, ci3725).  % true.
