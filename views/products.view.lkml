view: products {
  sql_table_name: coffee_rush.products ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
    value_format_name: usd
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
    value_format_name: usd
  }

  # Alias for backward compatibility with existing queries
  dimension: retail_price {
    type: number
    sql: ${price} ;;
    value_format_name: usd
    description: "Alias for price field"
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  dimension_group: created {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}.is_active ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, category, brand]
  }

  measure: avg_price {
    type: average
    sql: ${price} ;;
    value_format_name: usd
  }
}
