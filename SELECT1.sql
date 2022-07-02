SELECT *
FROM alumnos
INNER JOIN alumnos_has_cursos_disponibles
ON alumnos.id = alumnos_has_cursos_disponibles.alumnos_id