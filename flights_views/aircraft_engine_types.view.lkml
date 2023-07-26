# The name of this view in Looker is "Aircraft Engine Types"
view: aircraft_engine_types {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: flightstats.aircraft_engine_types ;;
  drill_fields: [aircraft_engine_type_id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: aircraft_engine_type_id {
    primary_key: yes
    type: yesno
    sql: ${TABLE}.aircraft_engine_type_id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Description" in Explore.

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }
  measure: count {
    type: count
    drill_fields: [aircraft_engine_type_id, aircraft.count, aircraft_engines.count, aircraft_models.count]
  }
}
