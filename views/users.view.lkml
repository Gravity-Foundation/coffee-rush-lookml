  view: users {
    sql_table_name: coffee_rush.users ;;

    dimension: id {
      primary_key: yes
      type: number
      sql: ${TABLE}.id ;;
    }

    dimension: customer_type {
      type: string
      sql: ${TABLE}.customer_type ;;
    }

    dimension: email {
      type: string
      sql: ${TABLE}.email ;;
    }

    dimension: first_name {
      type: string
      sql: ${TABLE}.first_name ;;
    }

    dimension: last_name {
      type: string
      sql: ${TABLE}.last_name ;;
    }

    dimension: city {
      type: string
      sql: ${TABLE}.city ;;
    }

    dimension: state {
      type: string
      sql: ${TABLE}.state ;;
    }

    dimension: country {
      type: string
      sql: ${TABLE}.country ;;
    }

    dimension: age {
      type: number
      sql: ${TABLE}.age ;;
    }

    dimension: gender {
      type: string
      sql: ${TABLE}.gender ;;
    }

    dimension_group: created {
      type: time
      datatype: date
      timeframes: [raw, date, week, month, quarter, year]
      sql: ${TABLE}.created_date ;;
    }

    measure: count {
      type: count
    }
  }
