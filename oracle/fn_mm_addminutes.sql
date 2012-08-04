CREATE OR REPLACE FUNCTION fn_mm_addminutes
(
  par_date      IN DATE,
  par_minutes   IN NUMBER
)
  RETURN DATE
IS
BEGIN
  RETURN par_date + (par_minutes / (24 * 60));
END fn_mm_addminutes;
/

CREATE OR REPLACE PUBLIC SYNONYM fn_mm_addminutes FOR fn_mm_sequence;

GRANT EXECUTE ON fn_mm_addminutes TO PUBLIC;