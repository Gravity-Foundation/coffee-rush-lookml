connection: "demo"

include: "/views/*.view.lkml"

explore: orders {
  label: "Orders Analysis"
  description: "Analyze orders with user, product, and order item details"

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: order_items {
    type: left_outer
    sql_on: ${orders.id} = ${order_items.order_id} ;;
    relationship: one_to_many
  }

  join: products {
    type: left_outer
    sql_on: ${order_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
}

explore: products {
  label: "Product Catalog"
  description: "Browse and analyze the coffee product catalog"
}

explore: users {
  label: "Customer Analysis"
  description: "Analyze customer demographics and behavior"

  join: orders {
    type: left_outer
    sql_on: ${users.id} = ${orders.user_id} ;;
    relationship: one_to_many
  }
}
