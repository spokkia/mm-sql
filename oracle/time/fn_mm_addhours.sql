CREATE OR REPLACE FUNCTION fn_mm_addhours
(
  par_date    IN DATE,
  par_hours   IN NUMBER
)
  RETURN DATE
IS
BEGIN
  RETURN par_date + (par_hours / 24);
END fn_mm_addhours;
/

CREATE OR REPLACE PUBLIC SYNONYM fn_mm_addhours FOR fn_mm_addhours;

GRANT EXECUTE ON fn_mm_addhours TO PUBLIC;

SELECT SYSDATE, fn_mm_addhours (SYSDATE, 2) FROM DUAL;
