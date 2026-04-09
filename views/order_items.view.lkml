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

    dimension: quantity {
      type: number
      sql: ${TABLE}.quantity ;;
    }

    dimension: unit_price {
      type: number
      sql: ${TABLE}.unit_price ;;
      value_format_name: usd
    }

    dimension: discount_amount {
      type: number
      sql: ${TABLE}.discount_amount ;;
      value_format_name: usd
    }

    dimension: line_total {
      type: number
      sql: ${TABLE}.line_total ;;
      value_format_name: usd
    }

    dimension_group: created {
      type: time
      timeframes: [raw, date, week, month, quarter, year]
      sql: ${TABLE}.created_at ;;
    }

    measure: count {
      type: count
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
  }
