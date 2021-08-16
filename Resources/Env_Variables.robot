*** Settings ***
Library  BuiltIn
Library  Collections
Library  SeleniumLibrary
Library  String
Library  DateTime

Resource  Common_Keywords.robot
Resource  Menu_Keywords.robot
Resource  Products_Keywords.robot
Resource  Suppliers_Keywords.robot
Resource  Quote_Order.robot
Resource  Customers_Keywords.robot
Resource  Login_Keywords.robot
Resource  Sales_Tax_Keywords.robot
Resource  Unit_Of_Measurement_Keywords.robot
Resource  Tax_Group_Keywords.robot
Resource  Employee_Keywords.robot
Resource  Transfer_In_Keywords.robot
Resource  Purchase_Order_Keywords.robot
Resource  Transfer_Out_Keywords.robot
Resource  Receipt_Voucher_Keywords.robot
Resource  Payment_Voucher_Keywords.robot

*** Variables ***
${TIMEOUT}    8s
${SELENIUM_SPEED}         0.0
${TITLE}        S2Retail