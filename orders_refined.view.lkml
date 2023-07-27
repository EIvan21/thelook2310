include: "/views/**/*.view.lkml"

view: +orders {
  sql_table_name:
  -- if dev -- demo_db.billion_orders
  -- if prod -- demo_db.hundred_million_orders
  ;;
}
