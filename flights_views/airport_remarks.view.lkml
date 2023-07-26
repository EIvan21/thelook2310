# The name of this view in Looker is "Airport Remarks"
view: airport_remarks {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: flightstats.airport_remarks ;;
  drill_fields: [airport_remark_id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: airport_remark_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.airport_remark_id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Element Name" in Explore.

  dimension: element_name {
    type: string
    sql: ${TABLE}.element_name ;;
  }

  dimension: remark {
    type: string
    sql: ${TABLE}.remark ;;
  }

  dimension: site_number {
    type: string
    sql: ${TABLE}.site_number ;;
  }
  measure: count {
    type: count
    drill_fields: [airport_remark_id, element_name]
  }
}
