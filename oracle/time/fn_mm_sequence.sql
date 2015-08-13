CREATE OR REPLACE FUNCTION fn_mm_sequence
(
  par_from   IN NUMBER,
  par_to     IN NUMBER,
  par_step   IN NUMBER DEFAULT 1
)
  RETURN ty_mm_tableofnumber
  PIPELINED
IS
  retval   NUMBER;
BEGIN
  retval := par_from;

  LOOP
    PIPE ROW (retval);
    EXIT WHEN retval = par_to;
    retval := retval + par_step;
  END LOOP;
END fn_mm_sequence;
/

CREATE OR REPLACE PUBLIC SYNONYM fn_mm_sequence FOR fn_mm_sequence;

GRANT EXECUTE ON fn_mm_sequence TO PUBLIC;

SELECT * FROM TABLE (fn_mm_sequence (1, 10));