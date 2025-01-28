#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo -e "Welcome to My Salon, how can I help you?\n"

# Function to list services and prompt user to select one
GET_SERVICES_ID() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  # Fetch and list all services
  LIST_SERVICES=$($PSQL "SELECT service_id, name FROM services")
  echo "$LIST_SERVICES" | while read SERVICE_ID BAR SERVICE
  do
    echo "$SERVICE_ID) $SERVICE"
  done

  # Prompt for service ID selection
  read -p "Please enter the service ID: " SERVICE_ID_SELECTED

  # Validate the service ID
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]] || [[ -z $($PSQL "SELECT service_id FROM services WHERE service_id=$SERVICE_ID_SELECTED") ]]
  then
    GET_SERVICES_ID "I could not find that service. What would you like today?"
  else
    NEXT
  fi
}

# Function to handle the next steps after service selection
NEXT() {
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  
  # If customer does not exist, prompt for their name
  if [[ -z $CUSTOMER_NAME ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
  fi

  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED" | sed 's/ //g')
  
  echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
  read SERVICE_TIME

  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
  
  if [[ $INSERT_APPOINTMENT_RESULT == "INSERT 0 1" ]]
  then
    echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
}

GET_SERVICES_ID
