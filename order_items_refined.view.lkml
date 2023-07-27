include: "/views/**/*.view.lkml"

view: +order_items {
  sql_table_name:

  -- if prod -- demo_db.order_items
  -- if dev -- demo_db.order_items_vijaya

  ;;

}
