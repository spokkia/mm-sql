CREATE OR REPLACE TYPE ty_mm_tableofnumber IS TABLE OF NUMBER;

CREATE OR REPLACE PUBLIC SYNONYM ty_mm_tableofnumber FOR ty_mm_tableofnumber;

GRANT EXECUTE ON ty_mm_tableofnumber TO PUBLIC;