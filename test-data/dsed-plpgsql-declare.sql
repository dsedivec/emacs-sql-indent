CREATE FUNCTION foo() RETURNS void LANGUAGE plpgsql AS $$
  DECLARE
    x INT := 42;
  BEGIN
    INSERT INTO bar (baz) VALUES (x);
  END;
$$;

-- Local Variables:
-- sql-product: postgres
-- End:
