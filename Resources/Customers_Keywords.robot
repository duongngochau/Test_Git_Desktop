*** Settings ***
Variables  ../Locators/Customers_Locators.py

*** Keywords ***

Navigate to the Customers list

    Menu - Click on the Customers Management menu

    Menu - Click on the Customers menu

View detail a customer

    Common - Click on an element        ${view_detail_button_locator}

Navigate to the Delivery address tab

    Common - Click on an element        ${delivery_address_tab_locator}
