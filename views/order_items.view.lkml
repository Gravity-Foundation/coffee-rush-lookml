view: order_items {
  sql_table_name: `coffee_rush.order_items` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.created_date ;;
  }

  dimension: discount_amount {
    type: number
    sql: ${TABLE}.discount_amount ;;
  }
  dimension: line_total {
    type: number
    sql: ${TABLE}.line_total ;;
  }
  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }
  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_id ;;
  }
  dimension: product_name {
    type: string
    sql: ${TABLE}.product_name ;;
  }
  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }
  dimension: unit_price {
    type: number
    sql: ${TABLE}.unit_price ;;
  }
  measure: count {
    type: count
    drill_fields: [id, product_name, products.name, products.id, orders.id]
  }

  measure: total_revenue {
    type: sum
    sql: ${line_total} ;;
    value_format_name: usd
  }

  measure: total_quantity {
    type: sum
    sql: ${quantity} ;;
  }

  measure: total_discount {
    type: sum
    sql: ${discount_amount} ;;
    value_format_name: usd
  }

  measure: average_unit_price {
    type: average
    sql: ${unit_price} ;;
    value_format_name: usd
  }
}
