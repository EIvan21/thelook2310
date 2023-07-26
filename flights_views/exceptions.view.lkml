# The name of this view in Looker is "Exceptions"
view: exceptions {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: flightstats.exceptions ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Bad Tail Num" in Explore.

  dimension: bad_tail_num {
    type: string
    sql: ${TABLE}.bad_tail_num ;;
  }

  dimension: carrier {
    type: string
    sql: ${TABLE}.carrier ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: first_seen {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.first_seen ;;
  }

  dimension: good_tail_num {
    type: string
    sql: ${TABLE}.good_tail_num ;;
  }

  dimension_group: last_seen {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.last_seen ;;
  }

  dimension: owner_name {
    type: string
    sql: ${TABLE}.owner_name ;;
  }
  measure: count {
    type: count
    drill_fields: [owner_name]
  }
}
