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

    dimension: sku {
      type: string
      sql: ${TABLE}.sku ;;
    }

    dimension: is_active {
      type: yesno
      sql: ${TABLE}.is_active ;;
    }

    measure: count {
      type: count
    }

    measure: avg_price {
      type: average
      sql: ${price} ;;
      value_format_name: usd
    }
  }
