CREATE TEMP TABLE foo (
  x INT
);

CREATE TEMP TABLE foo AS
SELECT
	bar,
	baz
FROM
	t1;
