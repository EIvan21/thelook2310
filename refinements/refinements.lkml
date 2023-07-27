include: "/views/**/*.view.lkml"

view: +order_items {
  sql_table_name:

  -- if prod -- {{_user_attributes['prod_schema']}}.order_items
  -- if dev --  {{_user_attributes['dev_schema']}}.{{_user_attributes['dev_table']}}


    ;;

}

view: +orders {
  sql_table_name:
  -- if dev -- demo_db.billion_orders
  -- if prod -- demo_db.hundred_million_orders
  ;;
}
