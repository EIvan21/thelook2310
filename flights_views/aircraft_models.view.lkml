# The name of this view in Looker is "Aircraft Models"
view: aircraft_models {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: flightstats.aircraft_models ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Aircraft Category ID" in Explore.

  dimension: aircraft_category_id {
    type: yesno
    sql: ${TABLE}.aircraft_category_id ;;
  }

  dimension: aircraft_engine_type_id {
    type: yesno
    # hidden: yes
    sql: ${TABLE}.aircraft_engine_type_id ;;
  }

  dimension: aircraft_model_code {
    type: string
    sql: ${TABLE}.aircraft_model_code ;;
  }

  dimension: aircraft_type_id {
    type: yesno
    # hidden: yes
    sql: ${TABLE}.aircraft_type_id ;;
  }

  dimension: amateur {
    type: yesno
    sql: ${TABLE}.amateur ;;
  }

  dimension: engines {
    type: yesno
    sql: ${TABLE}.engines ;;
  }

  dimension: manufacturer {
    type: string
    sql: ${TABLE}.manufacturer ;;
  }

  dimension: model {
    type: string
    sql: ${TABLE}.model ;;
  }

  dimension: seats {
    type: number
    sql: ${TABLE}.seats ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_seats {
    type: sum
    sql: ${seats} ;;  }
  measure: average_seats {
    type: average
    sql: ${seats} ;;  }

  dimension: speed {
    type: number
    sql: ${TABLE}.speed ;;
  }

  dimension: weight {
    type: number
    sql: ${TABLE}.weight ;;
  }
  measure: count {
    type: count
    drill_fields: [aircraft_types.aircraft_type_id, aircraft_engine_types.aircraft_engine_type_id]
  }
}
