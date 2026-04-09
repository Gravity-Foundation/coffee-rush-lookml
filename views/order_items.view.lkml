view: order_items {
  sql_table_name: coffee_rush.order_items ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.product_name ;;
    description: "Product name from products table for easier analysis"
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: unit_price {
    type: number
    sql: ${TABLE}.unit_price ;;
    value_format_name: usd
  }

  dimension: discount_pct {
    type: number
    sql: ${TABLE}.discount_pct ;;
    value_format_name: percent_2
    description: "Discount percentage applied (0.0-1.0)"
  }

  dimension: discount_amount {
    type: number
    sql: ${TABLE}.discount_amount ;;
    value_format_name: usd
    description: "Dollar amount of discount calculated from discount_pct"
  }

  dimension: line_total {
    type: number
    sql: ${TABLE}.line_total ;;
    value_format_name: usd
  }

  # Aliases for backward compatibility with existing queries
  dimension: sale_price {
    type: number
    sql: ${unit_price} ;;
    value_format_name: usd
    description: "Alias for unit_price field"
  }

  dimension: total_sale_price {
    type: number
    sql: ${line_total} ;;
    value_format_name: usd
    description: "Alias for line_total field"
  }

  dimension_group: created {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  measure: count {
    type: count
    drill_fields: [id, order_id, product_id, quantity]
  }

  measure: total_quantity {
    type: sum
    sql: ${quantity} ;;
  }

  measure: total_sales {
    type: sum
    sql: ${line_total} ;;
    value_format_name: usd
  }

  measure: avg_quantity {
    type: average
    sql: ${quantity} ;;
    value_format_name: decimal_2
  }
}
