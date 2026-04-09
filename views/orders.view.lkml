view: orders {
  sql_table_name: coffee_rush.orders ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: order_number {
    type: string
    sql: ${TABLE}.order_number ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: total_amount {
    type: number
    sql: ${TABLE}.total_amount ;;
    value_format_name: usd
  }

  dimension: payment_method {
    type: string
    sql: ${TABLE}.payment_method ;;
  }

  dimension_group: order {
    type: time
    datatype: date
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.order_date ;;
  }

  dimension_group: shipped {
    type: time
    datatype: date
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.shipped_date ;;
  }

  dimension_group: delivered {
    type: time
    datatype: date
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.delivered_date ;;
  }

  measure: count {
    type: count
  }

  measure: total_revenue {
    type: sum
    sql: ${total_amount} ;;
    value_format_name: usd
  }

  measure: avg_order_value {
    type: average
    sql: ${total_amount} ;;
    value_format_name: usd
  }
}
