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

  dimension_group: order {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.order_date ;;
  }

  dimension_group: shipped {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.shipped_date ;;
  }

  dimension_group: delivered {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.delivered_date ;;
  }

  dimension: total_amount {
    type: number
    sql: ${TABLE}.total_amount ;;
    value_format_name: usd
  }

  dimension: shipping_cost {
    type: number
    sql: ${TABLE}.shipping_cost ;;
    value_format_name: usd
  }

  dimension: tax_amount {
    type: number
    sql: ${TABLE}.tax_amount ;;
    value_format_name: usd
  }

  dimension: payment_method {
    type: string
    sql: ${TABLE}.payment_method ;;
  }

  dimension: shipping_address {
    type: string
    sql: ${TABLE}.shipping_address ;;
  }

  # Aliases for backward compatibility with existing queries
  dimension: total_amount_of_order_usd {
    type: number
    sql: ${total_amount} ;;
    value_format_name: usd
    description: "Alias for total_amount field"
  }

  dimension_group: created {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.order_date ;;
    description: "Alias for order dimension_group"
  }

  measure: count {
    type: count
    drill_fields: [id, order_number, status, order_date]
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
