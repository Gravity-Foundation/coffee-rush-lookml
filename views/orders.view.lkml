view: orders {
  sql_table_name: `coffee_rush.orders` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension_group: delivered {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.delivered_date ;;
  }

  dimension_group: order {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.order_date ;;
  }

  dimension: order_number {
    type: string
    sql: ${TABLE}.order_number ;;
  }

  dimension_group: shipped {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.shipped_date ;;
  }

  dimension: shipping_cost {
    type: number
    sql: ${TABLE}.shipping_cost ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }
  dimension: tax_amount {
    type: number
    sql: ${TABLE}.tax_amount ;;
  }
  dimension: total_amount {
    type: number
    sql: ${TABLE}.total_amount ;;
  }
  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: total_order_amount {
    type: sum
    sql: ${total_amount} ;;
    value_format_name: usd
  }

  measure: average_order_value {
    type: average
    sql: ${total_amount} ;;
    value_format_name: usd
  }

  measure: total_shipping {
    type: sum
    sql: ${shipping_cost} ;;
    value_format_name: usd
  }

  measure: total_tax {
    type: sum
    sql: ${tax_amount} ;;
    value_format_name: usd
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  id,
  users.business_name,
  users.last_name,
  users.id,
  users.first_name,
  order_items.count
  ]
  }

}
