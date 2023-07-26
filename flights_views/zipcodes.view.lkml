# The name of this view in Looker is "Zipcodes"
view: zipcodes {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: flightstats.zipcodes ;;
  drill_fields: [zipcode_id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: zipcode_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.zipcode_id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Allocation" in Explore.

  dimension: allocation {
    type: number
    sql: ${TABLE}.allocation ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_allocation {
    type: sum
    sql: ${allocation} ;;  }
  measure: average_allocation {
    type: average
    sql: ${allocation} ;;  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: population {
    type: number
    sql: ${TABLE}.population ;;
  }

  dimension: state_code {
    type: string
    sql: ${TABLE}.state_code ;;
  }

  dimension: state_fips {
    type: yesno
    sql: ${TABLE}.state_fips ;;
  }

  dimension: zipcode {
    type: zipcode
    sql: ${TABLE}.zipcode ;;
  }
  measure: count {
    type: count
    drill_fields: [zipcode_id, name]
  }
}
