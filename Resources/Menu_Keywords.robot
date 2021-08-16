*** Settings ***
Variables  ../Locators/Menu_Locators.py
Variables  ../Locators/Common_Locators.py
Resource    Common_Keywords.robot

*** Variables ***
${items_list_title}     SẢN PHẨM
${suppliers_list_title}     NHÀ CUNG CẤP
${discounts_list_title}     KHUYẾN MÃI
${commission_list_title}    HOA HỒNG
${repository_information_list_title}     THÔNG TIN KHO
${store_estimate_list_title}      NHẬP GIÁ CHO CỬA HÀNG
${store_inventory_list_title}       KIỂM KÊ KHO
${customers_list_title}     KHÁCH HÀNG
${customers_group_list_title}       NHÓM KHÁCH HÀNG
${customers_account_list_title}     TÀI KHOẢN PHẢI THU
${accounts_group_list_title}      NHÓM TÀI KHOẢN KHÁCH HÀNG
${limitation_purchase_list_title}       GIỚI HẠN MUA HÀNG
${quote_order_list_title}       BÁO GIÁ
${work_order_list_title}        ĐƠN ĐẶT HÀNG
${sales_list_title}     BÁN HÀNG
${sales_tax_list_title}     LOẠI THUẾ
${sales_tax_group_list_title}     NHÓM THUẾ
${unit_list_title}     ĐƠN VỊ TÍNH
${sales_rep_list_title}      ĐẠI DIỆN BÁN HÀNG
${employee_list_title}      NHÂN VIÊN
${department_list_title}    GIAN HÀNG
${transfer_in_list_title}   NHẬP KHO
${purchase_order_list_title}    ĐƠN MUA HÀNG
${purchase_order_history_title}    LỊCH SỬ MUA HÀNG
${transfer_out_list_title}   XUẤT KHO
${transfer_out_history_title}   LỊCH SỬ XUẤT KHO
*** Keywords ***

# Items Management
Menu - Click on the Items Management menu

    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}

    Common - Click on an element       ${homepage_menu_items_management}

Menu - Click on the Items menu

    Common - Click on an element       ${homepage_menu_items}

    Verify navigate to the Items list successfully

Menu - Click on the Suppliers menu

    Common - Click on an element       ${homepage_menu_suppliers}

    Verify navigate to the Suppliers list successfully

Menu - Click on the Discount menu

    Common - Click on an element       ${homepage_menu_discount}

    Verify navigate to the Discount list successfully

Menu - Click on the Commission menu

    Common - Click on an element       ${homepage_menu_commission}

    Verify navigate to the Commission list successfully

Menu - Click on the Repository Information menu

    Common - Click on an element       ${homepage_menu_repository_information}

    Verify navigate to the Repository Information list successfully

Menu - Click on the Store Estimate menu

    Common - Click on an element       ${homepage_menu_estimate}

    Verify navigate to the Store Estimate list successfully

Menu - Click on the Store Inventory menu

    Common - Click on an element       ${homepage_menu_inventory}

    Verify navigate to the Store Inventory list successfully

# Customers management
Menu - Click on the Customers Management menu

    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}

    Common - Click on an element       ${homepage_menu_customers_management}

Menu - Click on the Customers menu

    Common - Click on an element       ${homepage_menu_customers}

    Verify navigate to the Customers list successfully

Menu - Click on the Customers Group menu

    Common - Click on an element       ${homepage_menu_customers_group}

    Verify navigate to the Customers Group list successfully

Menu - Click on the Customers Account menu

    Common - Click on an element       ${homepage_menu_customers_account}

    verify navigate to the customers account list successfully

Menu - Click on the Accounts Group menu

    Common - Click on an element       ${homepage_menu_accounts_group}

    Verify navigate to the Accounts Group list successfully

Menu - Click on the Limitation Purchase menu

    Common - Click on an element       ${homepage_menu_limitation_purchase}

    Verify navigate to the Limitation Purchase list successfully

# Purchase Management Menu

Menu - Click on the Purchase Management Menu

    Common - Click on an element    ${homepage_menu_purchase_management}

Menu - Click on the Purchase Menu

    Common - Click on an element    ${homepage_menu_purchase}

#    Verify navigate to the Purchase list successfully

Menu - Click on the Transfer in Menu

    Common - Click on an element    ${homepage_menu_transfer_in}

    Verify navigate to the Transfer in list successfully

Menu - Click on the Transfer out Menu

    Common - Click on an element    ${homepage_menu_transfer_out}

    Verify navigate to the Transfer out list successfully

Menu - Click on the Transfer out history Menu

    Common - Click on an element    ${homepage_menu_transfer_out_history}

    Verify navigate to the Transfer out history successfully

Menu - Click on the purchase order history Menu

    Common - Click on an element    ${homepage_menu_purchase_history}
    Verify navigate to the Purchase order history successfully
# Sales Management Menu
Menu - Click on the Sales Management menu

    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}

    Common - Click on an element       ${homepage_menu_sales_management}

Menu - Click on the Quote Order menu

    Common - Click on an element       ${homepage_menu_quote_order}

    Verify navigate to the Quote Order list successfully

Menu - Click on the Work Order menu

    Common - Click on an element       ${homepage_menu_work_order}

    Verify navigate to the Work Order list successfully

Menu - Click on the Sales menu

    Common - Click on an element       ${homepage_menu_sales}

    Verify navigate to the Sales list successfully

# Finance Managament menu
Menu - Click on the Finance Management menu

    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}

    Common - Click on an element       ${homepage_menu_finance_management}

Menu - Click on the Received - Payment Cash menu

    Wait Until Page Contains Element    ${homepage_menu_received_payment_management}   ${TIMEOUT}

    Common - Click on an element    ${homepage_menu_received_payment_management}

Menu - Click on the Sales Tax menu

    Common - Click on an element       ${homepage_menu_sales_tax}

    Verify navigate to the Sales Tax List successfully

Menu - Click on the Sales Tax Group List menu

    Common - Click on an element       ${homepage_menu_sales_tax_group}

    Verify navigate to the Sales Tax Group List successfully

# Category Menu
Menu - Click on the Category Management menu

    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}

    Common - Click on an element       ${homepage_menu_category_management}

Menu - Click on the unit of measurement menu

    Common - Click on an element       ${homepage_menu_unit}

    Verify navigate to the Unit List successfully

Menu - Click on the department menu

    Common - Click on an element    ${homepage_menu_department}
    
#    Verify navigate to the dapartment list successfully

# Management menu
Menu - Click on the Management menu

    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}

    Common - Click on an element       ${homepage_menu_management}

Menu - Click on the Sales Representatives menu

    Common - Click on an element       ${homepage_menu_sales_representatives}

    Verify navigate to the Sales Representative List successfully

Menu - Click on the Employee menu

    Common - Click on an element       ${homepage_menu_employee}

    Verify navigate to the Employee List successfully

# Verify

Verify navigate to the dapartment list successfully

    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}
    
    ${get_department_list_title}    Common - Get text an element    ${homepage_list_title}

    Should Be Equal    ${get_department_list_title}    ${department_list_title}

Verify navigate to the Items list successfully

    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}

    ${get_items_list_title}     Common - Get text an element        ${homepage_list_title}

    Should be equal     ${get_items_list_title}     ${items_list_title}

Verify navigate to the Suppliers list successfully

    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}

    ${get_suppliers_list_title}     Common - Get text an element        ${homepage_list_title}

    Should be equal     ${get_suppliers_list_title}     ${suppliers_list_title}

Verify navigate to the Discount list successfully

    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}

    ${get_discounts_list_title}     Common - Get text an element        ${homepage_list_title}

    Should be equal     ${get_discounts_list_title}     ${discounts_list_title}

Verify navigate to the Commission list successfully

    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}

    ${get_commission_list_title}     Common - Get text an element        ${homepage_list_title}

    Should be equal     ${get_commission_list_title}     ${commission_list_title}

Verify navigate to the Repository Information list successfully

    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}

    ${get_repository_information_list_title}     Common - Get text an element        ${homepage_list_title}

    Should be equal     ${get_repository_information_list_title}     ${repository_information_list_title}

Verify navigate to the Store Estimate list successfully

    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}

    ${get_store_estimate_list_title}     Common - Get text an element        ${homepage_list_title}

    Should be equal     ${get_store_estimate_list_title}     ${store_estimate_list_title}

Verify navigate to the Store Inventory list successfully

    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}

    ${get_store_inventory_list_title}     Common - Get text an element        ${homepage_list_title}

    Should be equal     ${get_store_inventory_list_title}     ${store_inventory_list_title}

Verify navigate to the Customers list successfully

    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}

    ${get_customers_list_title}     Common - Get text an element        ${homepage_list_title}

    Should be equal     ${get_customers_list_title}     ${customers_list_title}

Verify navigate to the Customers Group list successfully

    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}

    ${get_customers_group_list_title}     Common - Get text an element        ${homepage_list_title}

    Should be equal     ${get_customers_group_list_title}     ${customers_group_list_title}

Verify navigate to the Customers Account list successfully

    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}

    ${get_customers_account_list_title}     Common - Get text an element        ${homepage_list_title}

    Should be equal     ${get_customers_account_list_title}     ${customers_account_list_title}

Verify navigate to the Accounts Group list successfully

    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}

    ${get_accounts_group_list_title}     Common - Get text an element        ${homepage_list_title}

    Should be equal     ${get_accounts_group_list_title}     ${accounts_group_list_title}

Verify navigate to the Limitation Purchase list successfully

    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}

    ${get_limitation_purchase_list_title}     Common - Get text an element        ${homepage_title_limitation_purchase}

    Should be equal     ${get_limitation_purchase_list_title}     ${limitation_purchase_list_title}

Verify navigate to the Quote Order list successfully

    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}

    ${get_quote_order_list_title}     Common - Get text an element        ${homepage_list_title}

    Should be equal     ${get_quote_order_list_title}     ${quote_order_list_title}

Verify navigate to the Work Order list successfully

    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}

    ${get_work_order_list_title}     Common - Get text an element        ${homepage_list_title}

    Should be equal     ${get_work_order_list_title}     ${work_order_list_title}

Verify navigate to the Sales list successfully

    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}

    ${get_sales_list_title}     Common - Get text an element        ${homepage_list_title}

    Should be equal     ${get_sales_list_title}     ${sales_list_title}

Verify navigate to the Sales Tax List successfully

    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}

    ${get_sales_tax_list_title}     Common - Get text an element        ${homepage_list_title}

    Should be equal     ${get_sales_tax_list_title}     ${sales_tax_list_title}

Verify navigate to the Sales Tax Group List successfully

    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}

    ${get_sales_tax_group_list_title}     Common - Get text an element        ${homepage_list_title}

    Should be equal     ${get_sales_tax_group_list_title}     ${sales_tax_group_list_title}

Verify navigate to the Unit List successfully

    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}

    ${get_unit_list_title}     Common - Get text an element        ${homepage_list_title}

    Should be equal     ${get_unit_list_title}     ${unit_list_title}

Verify navigate to the Sales Representative List successfully

    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}

    ${get_sales_rep_list_title}     Common - Get text an element        ${homepage_list_title}

    Should be equal     ${get_sales_rep_list_title}     ${sales_rep_list_title}

Verify navigate to the Employee List successfully

    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}

    ${get_employee_list_title}     Common - Get text an element        ${homepage_list_title}

    Should be equal     ${get_employee_list_title}     ${employee_list_title}

Verify navigate to the Transfer in list successfully

    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}

    ${get_transfer_in_list_title}     Common - Get text an element        ${homepage_list_title}

    Should be equal     ${get_transfer_in_list_title}     ${transfer_in_list_title}

Menu - Click on the Purchase Order Management menu

    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}

    Common - Click on an element       ${homepage_menu_purchase_management}

Menu - Click on the Purchase Order menu

    Common - Click on an element       ${homepage_menu_purchase}

Verify navigate to the Purchase Order list successfully

    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}

    ${get_purchase_order_list_title}     Common - Get text an element        ${homepage_list_title}

    Should be equal     ${get_purchase_order_list_title}     ${purchase_order_list_title}

Verify navigate to the Transfer out list successfully

    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}

    ${get_transfer_out_list_title}     Common - Get text an element        ${homepage_list_title}

    Should be equal     ${get_transfer_out_list_title}     ${transfer_out_list_title}

Verify navigate to the Transfer out history successfully

    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}

    ${get_transfer_out_list_title}     Common - Get text an element        ${homepage_list_title}

    Should be equal     ${get_transfer_out_list_title}     ${transfer_out_history_title}

Verify navigate to the Purchase order history successfully

    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}

    ${get_purchase_order_history_title}     Common - Get text an element        ${homepage_list_title}

    Should be equal     ${get_purchase_order_history_title}     ${purchase_order_history_title}