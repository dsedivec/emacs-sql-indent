select
  *
  from
      t1
      join t2
          on t1.k = t2.k
          and t1.j = t2.j
  -- here's a "nested join"
      join (
        t3
        left join t4
            on t3.k = t4.k
            and t3.j = t4.j             -- this "and" is a select-join-condition
      )
          on t1.k = t3.k
          and t1.k = t4.k;              -- this "and" is a select-join-condition

select
  *
  from
      t1
      join t2
          on (t1.k = t2.k
              and t1.j = t2.j)  -- this "and" is a nested-statement-continuation
                                -- here's a "nested join"
      join (
        t3
        left join t4
            on (t3.k = t4.k
                and t3.j = t4.j) -- this "and" is a nested-statement-continuation
      )
          on (t1.k = t3.k
              and t1.k = t4.k); -- this "and" is a nested-statement-continuation


select (a
        join b
            on a.k1 = b.k2) -- this is a select-join-condition (hey! we're not an sql parser
  from a, b;

create or replace view some_view as
  with t1 AS
  (
    select
      foo
      from
          bar
     where
       baz
   and (
     -- putting or in this comment shouldn't look like a nested join: or
     foo.col > (
       select
         max(some_stuff)
         from
             this_other_table
        where
          an_id = foo.id
     )
   )
  )
select * from t1;
