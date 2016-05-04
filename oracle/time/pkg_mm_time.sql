CREATE OR REPLACE PACKAGE pkg_mm_time
IS
  FUNCTION fn_addhours
  (
    par_date    IN DATE,
    par_hours   IN INTEGER
  )
    RETURN DATE;

  FUNCTION fn_addhours_ts
  (
    par_date    IN TIMESTAMP,
    par_hours   IN INTEGER
  )
    RETURN TIMESTAMP;

  FUNCTION fn_addminutes
  (
    par_date      IN DATE,
    par_minutes   IN INTEGER
  )
    RETURN DATE;

  FUNCTION fn_addminutes_ts
  (
    par_date      IN TIMESTAMP,
    par_minutes   IN INTEGER
  )
    RETURN TIMESTAMP;

  FUNCTION fn_addseconds
  (
    par_date      IN DATE,
    par_seconds   IN INTEGER
  )
    RETURN DATE;

  FUNCTION fn_addseconds_ts
  (
    par_date      IN TIMESTAMP,
    par_seconds   IN INTEGER
  )
    RETURN TIMESTAMP;

  FUNCTION fn_addweeks
  (
    par_date    IN DATE,
    par_weeks   IN INTEGER
  )
    RETURN DATE;

  FUNCTION fn_addweeks_ts
  (
    par_date    IN TIMESTAMP,
    par_weeks   IN INTEGER
  )
    RETURN TIMESTAMP;

  FUNCTION fn_addyears
  (
    par_date    IN DATE,
    par_years   IN INTEGER
  )
    RETURN DATE;

  FUNCTION fn_addyears_ts
  (
    par_date    IN TIMESTAMP,
    par_years   IN INTEGER
  )
    RETURN TIMESTAMP;
END pkg_mm_time;
/

CREATE OR REPLACE PACKAGE BODY pkg_mm_time
IS
  FUNCTION fn_addhours
  (
    par_date    IN DATE,
    par_hours   IN INTEGER
  )
    RETURN DATE
  IS
  BEGIN
    RETURN par_date + (par_hours / 24);
  END fn_addhours;

  FUNCTION fn_addhours_ts
  (
    par_date    IN TIMESTAMP,
    par_hours   IN INTEGER
  )
    RETURN TIMESTAMP
  IS
  BEGIN
    RETURN par_date + (par_hours / 24);
  END fn_addhours_ts;

  FUNCTION fn_addminutes
  (
    par_date      IN DATE,
    par_minutes   IN INTEGER
  )
    RETURN DATE
  IS
  BEGIN
    RETURN par_date + (par_minutes / (24 * 60));
  END fn_addminutes;

  FUNCTION fn_addminutes_ts
  (
    par_date      IN TIMESTAMP,
    par_minutes   IN INTEGER
  )
    RETURN TIMESTAMP
  IS
  BEGIN
    RETURN par_date + (par_minutes / (24 * 60));
  END fn_addminutes_ts;

  FUNCTION fn_addseconds
  (
    par_date      IN DATE,
    par_seconds   IN INTEGER
  )
    RETURN DATE
  IS
  BEGIN
    RETURN par_date + (par_seconds / (24 * 60 * 60));
  END fn_addseconds;

  FUNCTION fn_addseconds_ts
  (
    par_date      IN TIMESTAMP,
    par_seconds   IN INTEGER
  )
    RETURN TIMESTAMP
  IS
  BEGIN
    RETURN par_date + (par_seconds / (24 * 60 * 60));
  END fn_addseconds_ts;

  FUNCTION fn_addweeks
  (
    par_date    IN DATE,
    par_weeks   IN INTEGER
  )
    RETURN DATE
  IS
  BEGIN
    RETURN par_date + (par_weeks * 7);
  END fn_addweeks;

  FUNCTION fn_addweeks_ts
  (
    par_date    IN TIMESTAMP,
    par_weeks   IN INTEGER
  )
    RETURN TIMESTAMP
  IS
  BEGIN
    RETURN par_date + (par_weeks * 7);
  END fn_addweeks_ts;

  FUNCTION fn_addyears
  (
    par_date    IN DATE,
    par_years   IN INTEGER
  )
    RETURN DATE
  IS
  BEGIN
    RETURN ADD_MONTHS (par_date, par_years * 12);
  END fn_addyears;

  FUNCTION fn_addyears_ts
  (
    par_date    IN TIMESTAMP,
    par_years   IN INTEGER
  )
    RETURN TIMESTAMP
  IS
    v_date     DATE;
    v_result   TIMESTAMP;
  BEGIN
    v_date := TO_DATE (TRUNC (par_date));
    v_date := ADD_MONTHS (v_date, par_years * 12);
    v_result := TO_TIMESTAMP (   TO_CHAR (v_date, 'YYYYMMDD')
                              || TO_CHAR (par_date, 'HH24MISSXFF'),
                              'YYYYMMDDHH24MISSXFF');
    RETURN v_result;
  END fn_addyears_ts;
END pkg_mm_time;
/