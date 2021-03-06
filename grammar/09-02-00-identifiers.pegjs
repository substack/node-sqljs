
// 9.2. Schema Object Names
// http://dev.mysql.com/doc/refman/5.6/en/identifiers.html


DATABASE_NAME "database name"
  = schema:ID { return schema }


TABLE_NAME "table name"
  = schema:ID '.' name:ID {
      return { schema: schema, table: name };
    }
  / name:ID { return { table: name }; }


COLUMN_NAME "column name"
  = schema:ID '.' table:ID '.' column:ID {
      return { schema: schema, table: table, column: column };
    }
  / table:ID '.' column:ID {
      return { table: table, column: column };
    }
  / column:ID {
      return { column: column };
    }


ID "identifier"
  = start:[A-Za-z$_] rest:[0-9A-Za-z$_]* { return start + rest.join(''); }
  / '`' name:([^`]/double_backtick_escape)+ '`' { return name.join(''); }


double_backtick_escape
  = "``" { return "`"; }

