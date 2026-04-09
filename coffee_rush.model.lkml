# Coffee Rush E-commerce Data Model
#
# DATASET: Coffee Rush B2B/B2C e-commerce synthetic dataset
# TIME SPAN: 2015–2025 (11 years)
# TABLES: users, products, orders, order_items
# BIGQUERY: gfo5-demo-da133068.coffee_rush
#
# Represents a coffee and coffee accessories supplier serving both B2B
# (cafes, restaurants, hotels, corporate, grocery) and B2C customers.
#
# For dataset details and generation info see:
# https://github.com/Gravity-Foundation/synthetic_data_generator/tree/main/projects/coffee_rush

connection: "coffee_rush"

include: "/views/*.view.lkml"

# Main explore: Orders with related entities
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

# Product catalog explore
explore: products {
  label: "Product Catalog"
  description: "Browse and analyze the coffee product catalog"
}

# Customer analysis explore
explore: users {
  label: "Customer Analysis"
  description: "Analyze customer demographics and behavior"

  join: orders {
    type: left_outer
    sql_on: ${users.id} = ${orders.user_id} ;;
    relationship: one_to_many
  }
}
