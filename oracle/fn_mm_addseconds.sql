CREATE OR REPLACE FUNCTION fn_mm_addseconds
(
  par_date      IN DATE,
  par_seconds   IN NUMBER
)
  RETURN DATE
IS
BEGIN
  RETURN par_date + (par_seconds / (24 * 60 * 60));
END fn_mm_addseconds;
/

CREATE OR REPLACE PUBLIC SYNONYM fn_mm_addseconds FOR fn_mm_sequence;

GRANT EXECUTE ON fn_mm_addseconds TO PUBLIC;

SELECT SYSDATE, fn_mm_addseconds (SYSDATE, 2) FROM DUAL;