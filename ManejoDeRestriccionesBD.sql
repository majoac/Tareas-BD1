--  EVIDENCIAS DE APRENDIZAJE: PREGUNTAS
-- ******************************************************************

-- ¿Qué es una restricción de integridad referencial?
-- R: Es una regla de una Base de Datos Relacional que asegura que las relaciones entre tablas sean válidas.
-- Impide que un registro en la tabla "hijo" (como 'alumno') haga referencia a un registro que no existe
-- en la tabla "padre" (como 'carrera'). Se implementa con **Claves Foráneas** (Foreign Keys) para evitar inconsistencias.

-- ¿Qué diferencia hay entre ON DELETE SET NULL, CASCADE y RESTRICT?
-- R: Definen el comportamiento cuando se elimina (DELETE) o actualiza (UPDATE) un registro padre con hijos vinculados:
-- 1. SET NULL: Pone en NULL el campo de la clave foránea en la tabla hija.
-- 2. CASCADE: Propaga la acción. Si eliminas el padre, se eliminan los hijos. Si actualizas el ID del padre, se actualiza en los hijos.
-- 3. RESTRICT: Rechaza la operación del padre si hay hijos vinculados.

-- ¿Por qué son importantes estas restricciones en sistemas reales?
-- R: Son cruciales para la **consistencia** y **confiabilidad**. Evitan datos "huérfanos" (inconsistentes) y aseguran que la lógica del negocio se cumpla automáticamente sin que el código de la aplicación tenga que verificar la integridad manualmente en cada operación.