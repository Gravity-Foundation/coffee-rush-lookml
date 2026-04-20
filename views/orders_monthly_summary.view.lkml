view: orders_monthly_summary {
  sql_table_name: coffee_rush.orders_monthly_summary ;;

  dimension: month {
    type: string
    sql: ${TABLE}.month ;;
    description: "Month in YYYY-MM format, attributed by delivered_date (falls back to order_date for non-delivered orders)"
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  dimension: month_num {
    type: number
    sql: ${TABLE}.month_num ;;
  }

  dimension: last_updated {
    type: date
    sql: ${TABLE}.last_updated ;;
  }

  measure: order_count {
    type: sum
    sql: ${TABLE}.order_count ;;
  }

  measure: total_revenue {
    type: sum
    sql: ${TABLE}.total_revenue ;;
    value_format_name: usd
    description: "Revenue summed from orders.total_amount (includes all statuses; attributed by delivered_date)"
  }
}
