CREATE OR REPLACE FUNCTION fn_mm_generate_series
(
  par_start   IN NUMBER,
  par_stop    IN NUMBER,
  par_step    IN NUMBER DEFAULT 1
)
  RETURN NUMBER
  PIPELINED
IS
  retval   NUMBER;
BEGIN
  IF (   par_start IS NULL
      OR par_stop IS NULL
      OR par_step IS NULL
      OR par_step = 0)
  THEN
    RETURN;
  END IF;

  IF    (par_start > par_stop AND par_step < 0)
     OR (par_start < par_stop AND par_step > 0)
  THEN
    RETURN;
  END IF;

  retval := par_start;

  WHILE (retval <> par_stop)
  LOOP
    PIPE ROW (retval);
    retval := retval + par_step;
  END LOOP;

  RETURN;
END mm_generate_series;
/