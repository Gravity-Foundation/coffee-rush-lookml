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
    description: "B2B (cafe, restaurant, corporate, hotel, grocery) or B2C (consumer)"
  }

  dimension: business_name {
    type: string
    sql: ${TABLE}.business_name ;;
    description: "Business name for B2B customers"
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

  dimension: zip_code {
    type: string
    sql: ${TABLE}.zip_code ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension_group: created {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  measure: count {
    type: count
    drill_fields: [id, first_name, last_name, email]
  }
}
