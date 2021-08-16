*** Settings ***
Variables   ../Locators/Common_Locators.py
Variables   ../Locators/Products_Locators.py
Variables   ../Data/Products.yaml
Library    Collections
Resource    Common_Keywords.robot

*** Keywords ***

####   Items Menu  ####

Navigate To Products Page And Verify The Products Page Appears

    Menu - Click on the Items menu

    Wait Until Page Contains Element    ${products_tle_grid_item}     ${TIMEOUT}

Open the item class pop-up and choose the item class

    [Arguments]  ${data_tle_popup_choose_type}   ${item_class}

    Click On Create Button to open the item class pop-up

    Verify The item class Pop-Up Appears successfully   ${data_tle_popup_choose_type}

    Choose the item class for new item   ${item_class}

Click On Create Button to open the item class pop-up

    Common - Click on an element    ${products_btn_Create}

Verify The item class Pop-Up Appears successfully

    [Arguments]  ${data_tle_popup_choose_type}

    ${Pop_Up_Title}    Common - Get text an element    ${products_PopUp_ProductType}

    Should Be Equal    ${data_tle_popup_choose_type}    ${Pop_Up_Title}

Choose the item class for new item

    [Arguments]  ${item_class}

    Wait Until Page Contains Element    ${products_PopUp_ProductType}   ${TIMEOUT}

    Wait Until Page Contains Element    ${item_class}   ${TIMEOUT}

    Common - Click on an element    ${item_class}

Navigate to create product page and verify the page appear successfully

    [Arguments]   ${title}

    Click On Create Product Button For Navigate To Create Product Page

    Verify The Create Product Page Appear successfully   ${title}

Click On Create Product Button For Navigate To Create Product Page

    Common - Click on an element    ${products_btn_ItemClass}

    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

Verify The Create Product Page Appear successfully

    [Arguments]  ${title}

    ${title_create}      Common - Get text an element    ${products_tle_Create}

    Should Be Equal    ${title}    ${title_create}

Filling in all unrequired fields on general information tab

    [Arguments]  ${item_department}  ${item_category}  ${item_barcode}

    Input decription for the item

    Input department for the item    ${item_department}

    Input category for the item    ${item_category}

    Input barcode for the item    ${item_barcode}

Filling in all unrequired fields on price and cost tab

    Input Price A for the item

    Input Price B for the item

    Input Price C for the item

Filling in all unrequired fields on technical information tab

    [Arguments]   ${item_parent}

    Input Parent Product for the item    ${item_parent}

    Input item size in technical information tab

    Add properties and properties value

Input item type for the item

    [Arguments]  ${item_type}

    [Return]   ${item_type}

    Common - Choose a value from combobox    ${products_cbx_ItemClass}    ${products_cbx_Type.replace('type','${item_type}')}

Input code for the standar item

    [Return]    ${ItemCode}

    ${ItemCode}    Generate Random String  7   123456789

    Common - Press a key on the keyboard    ${products_txt_standar_code}    CTRL+a+BACKSPACE
    
    Common - Input text to element    ${products_txt_standar_code}    ${ItemCode}

Input code for the serial item

    [Return]    ${serial_item_code}

    ${ItemCode}    Generate Random String  7   123456789

    ${serial_item_code}    Set Variable   ${ItemCode}

    Common - Press a key on the keyboard    ${products_txt_matrix_code}    CTRL+a+BACKSPACE

    Common - Input text to element    ${products_txt_matrix_code}    ${serial_item_code}

Click On Add Serial/Imei To Create Serial Product

    Common - Click on an element    ${products_btn_AddSerial}

Input Name for the item

    [Return]    ${ItemName}

    ${ItemName}    Generate Random String  10   [LETTERS]
    
    Common - Press a key on the keyboard    ${products_txt_standar_name}    CTRL+a+BACKSPACE

    Common - Input text to element    ${products_txt_standar_name}    ${ItemName}

Input tax For the item

    [Arguments]  ${item_tax}

    [Return]   ${item_tax}

    Common - Choose a value from combobox    ${products_cbx_ItemTax}    ${products_input_ItemTax.replace('tax','${item_tax}')}

Input Cost for the item

    [Return]  ${item_cost}

    Common - Click on an element    ${products_cell_Cost}

    Common - Press a key on the keyboard    ${products_txt_cost}    CTRL+a+BACKSPACE

    ${item_cost}    Generate Random String  3   123456789

    Common - Input text to element    ${products_txt_cost}    ${item_cost}

Input Price for the item

    [Return]    ${item_price}

    Common - Click on an element    ${products_cell_Price}

    Common - Press a key on the keyboard    ${products_txt_Price}    CTRL+a+BACKSPACE

    ${item_price}   Generate Random String  5   123456789

    Common - Input text to element    ${products_txt_Price}    ${item_price}

Input unit for the item

    [Arguments]     ${item_unit}

    Common - Choose a value from combobox    ${products_cbx_ItemUnit}    ${products_input_ItemUnit.replace('unit','${item_unit}')}

Navigate to PRICE AND COST tab and verify the tab appear successfully

    [Arguments]   ${data_title_price_and_cost}

    Navigate to PRICE AND COST tab

    Verify The PRICE AND COST tab appear successfully   ${data_title_price_and_cost}

Navigate to PRICE AND COST tab

    Common - Click on an element    ${products_tab_PriceAndCost}

Verify The PRICE AND COST tab appear successfully

    [Arguments]   ${data_title_price_and_cost}

    ${title_PriceAndCost}   Common - Get text an element    ${products_tab_PriceAndCost}

    Should Be Equal    ${data_title_price_and_cost}    ${title_PriceAndCost}

Navigate to TECHNICAL INFORMATION tab and verify the tab appear successfully

    [Arguments]   ${data_tle_tech_infor}

    Navigate to TECHNICAL INFORMATION tab

    Verify The ECHNICAL INFORMATION tab appear successfully   ${data_tle_tech_infor}

Navigate to TECHNICAL INFORMATION tab

    Common - Click on an element    ${products_tab_TechInfor}

Verify The ECHNICAL INFORMATION tab appear successfully

    [Arguments]     ${data_tle_tech_infor}

    ${title_Technical_Infor}      Common - Get text an element    ${products_tab_TechInfor}

    Should Be Equal    ${data_tle_tech_infor}    ${title_Technical_Infor}

Input Parent Product for the item

    [Arguments]  ${item_parent}

    Common - Choose a value from combobox    ${products_cbx_ParentProduct}    ${products_input_ParentProduct.replace('parent_product','${item_parent}')}

    Input Exchange Value for parent item

Input Exchange Value for parent item

    Common - Double click on an element    ${products_cell_ExchangeValue}

    ${ExchangeValue}   Generate Random String  2  [NUMBERS]

    Common - Input text to element    ${products_txt_ExchangeValue}    ${ExchangeValue}

Input item size in technical information tab

    Input length for the item

    Input width for the item

    Input height for the item

    Input weight for the item

Input length for the item

    Common - Click on an element    ${products_cell_length}

    Common - Press a key on the keyboard    ${products_txt_length}    CTRL+a+BACKSPACE

    ${length}   Generate Random String  2  [NUMBERS]

    Common - Input text to element    ${products_txt_length}   ${length}

Input width for the item

    Common - Click on an element    ${products_cell_width}

    Common - Press a key on the keyboard    ${products_txt_width}    CTRL+a+BACKSPACE

    ${width}   Generate Random String  2  [NUMBERS]

    Common - Input text to element    ${products_txt_width}    ${width}

Input height for the item

    Common - Click on an element    ${products_cell_height}

    Common - Press a key on the keyboard    ${products_txt_height}    CTRL+a+BACKSPACE

    ${height}   Generate Random String  2  [NUMBERS]

    Common - Input text to element    ${products_txt_height}    ${height}

Input weight for the item

    Common - Click on an element    ${products_cell_weight}

    Common - Press a key on the keyboard    ${products_txt_weight}    CTRL+a+BACKSPACE

    ${weight}   Generate Random String  2  [NUMBERS]

    Common - Input text to element    ${products_txt_weight}    ${weight}

Add properties and properties value

    Common - Click on an element    ${products_btn_AddProperty}

    # Properties

    Common - Click on an element    ${products_txt_properties}

    ${Properties}  Generate Random String  2   [LETTERS]

    Common - Input text to element    ${products_txt_properties}    ${Properties}

    # Properties Value

    Common - Click on an element    ${products_txt_propertyValue}

    ${PropertiesValue}  Generate Random String  5   [LETTERS]

    Common - Input text to element    ${products_txt_propertyValue}    ${PropertiesValue}

Navigate to Serial/Imei tab and verify the page appear successfully

    [Arguments]   ${serial/imei}

    Navigate To Serial/Imei tab

    Verify The Serial/Imei Page Appears successfully   ${serial/imei}

Navigate To Serial/Imei tab

    Common - Click on an element    ${products_tle_Serial}
    
    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

Verify The Serial/Imei Page Appears successfully

    [Arguments]  ${title_serial_imei}

    ${Serial}   Common - Get text an element    ${products_tle_Serial}

    Should Be Equal     ${title_serial_imei}     ${Serial}

Input Serial 1 For Serial item

    ${Serial1}     Generate Random String  10   123456789

    Common - Input text to element    ${products_txt_Serial1}    ${Serial1}

    Input Begin Serial For Serial/Imei 1

Input Serial 2 For Serial item

    ${Serial2}     Generate Random String  10   123456789

    Common - Input text to element    ${products_txt_Serial2}    ${Serial2}

    Input Begin Serial For Serial/Imei 2

Input Serial 3 For Serial item

    ${Serial3}=     Generate Random String  10   123456789

    Common - Input text to element    ${products_txt_Serial3}    ${Serial3}

    Input Begin Serial For Serial/Imei 3

Input Begin Serial For Serial/Imei 1

    Common - Double click on an element    ${products_cell_BeginSerial1}

    ${BeginSerial1}     Generate Random String  4   123456789

    Common - Input text to element    ${products_txt_BeginSerial1}    ${BeginSerial1}

Input Begin Serial For Serial/Imei 2

    Common - Double click on an element    ${products_cell_BeginSerial2}

    ${BeginSerial2}     Generate Random String  4   123456789

    Common - Input text to element    ${products_txt_BeginSerial2}    ${BeginSerial2}

Input Begin Serial For Serial/Imei 3

    Common - Double click on an element    ${products_cell_BeginSerial3}

    ${BeginSerial3}=     Generate Random String  4   123456789

    Common - Input text to element    ${products_txt_BeginSerial3}    ${BeginSerial3}

Input Quantity Serial For the item

    Common - Double click on an element    ${products_cell_QuantitySerial}

    ${QuantitySerial}     Generate Random String    2   123

    Common - Input text to element   ${products_txt_QuantitySerial}    ${QuantitySerial}

    Click On Add Serial/Imei To Create Serial Product

    Wait Until Page Contains Element    ${products_table_row}   ${TIMEOUT}


               ###############      Matrix Items     ################

Input code for the matrix item

    [Return]    ${MatrixItemCode}

    # Input Item Code

    ${MatrixItemCode}    Generate Random String  7   123456789

    Common - Press a key on the keyboard    ${products_txt_matrix_code}    CTRL+a+BACKSPACE
    
    Common - Input text to element    ${products_txt_matrix_code}    ${MatrixItemCode}

Input name for the matrix item

    [Return]   ${MaxItemName}

    ${MaxItemName}     Generate Random String      10      [LETTERS]

    Common - Press a key on the keyboard    ${products_txt_matrix_name}    CTRL+a+BACKSPACE

    Common - Input text to element    ${products_txt_matrix_name}     ${MaxItemName}

Input supplier for the matrix items

    [Arguments]   ${data_supplier}

    Common - Choose a value from combobox    ${products_txt_Suppliers}    ${products_input_Suppliers.replace('supplier','${data_supplier}')}

Input commission for the item

    [Arguments]   ${data_commission}

    Common - Choose a value from combobox    ${products_txt_Commission}    ${products_input_Commission.replace('commission','${data_commission}')}

Input decription for the item

    ${Decription}  Generate Random String  20  [LETTERS]

    Common - Press a key on the keyboard    ${products_txt_Description}    CTRL+a+BACKSPACE
    
    Common - Input text to element    ${products_txt_Description}    ${Decription}

Input department for the item

    [Arguments]  ${item_department}

    Common - Choose a value from combobox    ${products_cbx_department}    ${products_input_Department.replace('department','${item_department}')}

Input category for the item

    [Arguments]  ${item_category}

    Common - Choose a value from combobox    ${products_cbx_Category}    ${products_input_Category.replace('category','${item_category}')}

Input barcode for the item

    [Arguments]   ${item_barcode}

    Common - Choose a value from combobox    ${products_cbx_Barcode}    ${products_input_Barcode.replace('barcode','${item_barcode}')}

Navigate to property tab for verify item properties

    Wait Until Page Contains Element    ${products_tle_Property}   ${TIMEOUT}

    Common - Click on an element    ${products_tle_Property}

    Wait Until Page Contains Element    ${products_nav_table}   ${TIMEOUT}
    
    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

Input 1 property for the matrix items

    Input Dimention 1

    Input Dimention Value 1

    Click On Create Items Button To Create Matrix Items

Input 3 property for the matrix items

    Click On Add Button To Add More Properties

    Click On Add Button To Add More Properties

    Input Dimention 1

    Input Dimention Value 1

    Input Dimention 2

    Input Dimention Value 2

    Input Dimention 3

    Input Dimention Value 3

    Click On Create Items Button To Create Matrix Items

Input Dimention 1

    ${Dimension1}   Generate Random String  3   [LETTERS]

    Common - Input text to element    ${products_txt_Dimension1}    ${Dimension1}

Input Dimention 2

    ${Dimension2}   Generate Random String  3   [LETTERS]

    Common - Input text to element    ${products_txt_Dimension2}    ${Dimension2}

Input Dimention 3

    ${Dimension3}   Generate Random String  3   [LETTERS]

    Common - Input text to element    ${products_txt_Dimension3}    ${Dimension3}

Input Dimention Value 1

    ${Dimension_Value1}   Generate Random String  3   [LETTERS]

    Common - Input text to element    ${products_txt_DimenVal1}    ${Dimension_Value1}

    Common - Press a key on the keyboard    ${products_txt_DimenVal1}  ,

Input Dimention Value 2

    ${Dimension_Value2}=   Generate Random String  3   [LETTERS]

    Common - Input text to element    ${products_txt_DimenVal2}    ${Dimension_Value2}

    Common - Press a key on the keyboard    ${products_txt_DimenVal2}  ,

Input Dimention Value 3

    ${Dimension_Value3}=   Generate Random String  3   [LETTERS]

    Common - Input text to element    ${products_txt_DimenVal3}    ${Dimension_Value3}

    Common - Press a key on the keyboard    ${products_txt_DimenVal3}  ,

Click On Add Button To Add More Properties

    Common - Click on an element    ${products_btn_AddMoreProperty}

Click On Create Items Button To Create Matrix Items

    Wait Until Page Contains Element    ${products_btn_NewMatrixItem}   ${TIMEOUT}

    Common - Click on a button    ${products_btn_NewMatrixItem}
    
    Common - Click on a button    ${products_btn_NewMatrixItem}

    Wait Until Page Contains Element    ${products_table_row}   ${TIMEOUT}

Click on save button to create a product

    Common - Click on an element    ${products_btn_save}
    
    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

    Menu - Click on the Items menu
    
    Wait Until Page Contains Element    ${products_table_row}     ${TIMEOUT}

Click on action button and open the update suppliers pop-up

    Product - Click on action button to open the menu list

    Click on the update supplier menu to open the update suppliers pop-up

Product - Click on action button to open the menu list

    Wait Until Page Contains Element    ${bnt_context_menu}   ${TIMEOUT}

    Common - Click on an element    ${bnt_context_menu}

    Sleep   1s

Click on the update supplier menu to open the update suppliers pop-up

    [Arguments]  ${data_item}
    
    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

#    Search a item   ${data_item}

    Common - Search data    ${data_item}

    ${item_name}    Convert To Upper Case   ${data_item}

    # Click on the update supplier menu

    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

    Product - Click on action button to open the menu list

    Common - Click on an element    ${products_menu_UpdateSupp}

    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

    # Verify the update supplier pop-up appear

    ${title_UpdatePopup}   Common - Get text an element    ${products_tle_UpdateSupp}

    Should Be Equal    ${5902['data_tle_popup_update_supplier']} ${item_name}    ${title_UpdatePopup}

Add multiple suppliers for product and close the update suppliers pop-up

    [Arguments]   ${supplier}

    Click on Add Supplier button to open the pop-up

    Wait Until Page Contains Element    ${products_add_supp_pop_up}   ${TIMEOUT}

    Wait Until Page Does Not Contain Element    ${products_message}   ${TIMEOUT}

    Common - Choose a value from combobox    ${products_cbx_Supp}    ${products_input_SuppName.replace('supllier_name','${supplier}')}

    # Input cost of suppliers

    Common - Double click on an element    ${products_cell_ReceiptCost}

    ${ReceiptCost}     Generate Random String  5   [NUMBERS]

    Common - Input text to element    ${products_txt_ReceiptCost}    ${ReceiptCost}

    # Input min quantity

    Common - Double click on an element    ${products_cell_MinQty}

    ${MinQuantity}     Generate Random String  1   123456789

    Common - Input text to element    ${products_txt_MinQty}    ${MinQuantity}

    # Click on save and continue button

    Common - Click on an element    ${products_btn_SaveAndContinue}

    # Close the pop-up

    Close The Create Supplier Item Pop-up

Close The Add Suppliers Pop-up

    Common - Click on an element    ${products_btn_CloAddSupp}

Click on Add Supplier button to open the pop-up

    Wait Until Page Contains Element    ${products_btn_AddSupp}   ${TIMEOUT}

    Common - Click on an element    ${products_btn_AddSupp}

Close The Create Supplier Item Pop-up

    Common - Click on an element    ${products_btn_CancelSuppItem}

Click on delete icon to remove Suppliers of Product

    # Click on Delete icon to remove supplier
    
    Wait Until Page Contains Element    ${products_icon_delete}   ${TIMEOUT}

    Common - Click on an element    ${products_icon_delete}

    # Confirm remove supplier

    Common - Click on an element    ${products_btn_DelSupp}
    
    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

Remove suppliers after add supplier for product

    ${elements}    Get WebElements     //a[@title='Xóa']

    FOR    ${element}    IN    @{elements}

        ${count}  Get Element Count    //a[@title='Xóa']

        Exit For Loop If    ${count}==0

        Click on delete icon to remove Suppliers of Product

        Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

#        Wait Until Page Does Not Contain Element    ${products_message}   ${TIMEOUT}

        Wait Until Page Contains Element    ${products_message}   ${TIMEOUT}

    END

Copy a product from data grid

    [Arguments]   ${item}

    Common - Search data    ${item}

    Product - Click on action button to open the menu list
    
    Common - Click on an element    ${products_menu_copy}
    
    Common - Click on an element    ${products_btn_copy}
    
    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

Verify Create a copy product successfully

    [Arguments]   ${item}

    [Return]   ${get_item}

    ${get_item}    Common - Get text an element    ${products_grid_item_code.replace('item_code','${item}-saochep')}

    ${data_grid_item_copy}   Common - Get text an element    ${products_cell_item_copy}

    Should Be Equal    ${get_item}    ${data_grid_item_copy}
    
    Common - Clear text on an element    ${products_txt_search}

Click on action button and open the suppliers list pop-up to see detail

    [Arguments]   ${item_code}

#    Search a item    ${item_code}

    Common - Search data    ${item_code}

    Product - Click on action button to open the menu list

    Common - Click on an element    ${products_menu_ViewSuppItem}

Click on action button and open the warehouse information pop-up

    Product - Click on action button to open the menu list

    # Click on the view supplier list menu

    Common - Click on an element    ${products_menu_WareHouse}

Verify the warehouse information pop-up appear with data correct

    ${title_WareHouse}  Common - Get text an element    ${products_tle_WareHouse}

    ${First_ItemName}  Common - Get text an element    ${products_table_cell.replace('number','3')}

    ${First_ItemName}   Convert To Upper Case    ${First_ItemName}

    Should Be Equal    ${14370['data_tle_popup_ware_house']} ${First_ItemName}   ${title_WareHouse}

Verify the suppliers list pop-up appear with data correct

    [Arguments]   ${item}
    
    Wait Until Page Contains Element    ${products_sub_table_row}   ${TIMEOUT}

    Common - Click on an element    ${products_nav_table_supplier}

    ${detail_supp_name}     Common - Get data from a column    ${products_table_view_supplier}    1

    Common - Press a key on the keyboard    ${products_table_view_supplier}    ESC

    Reload Page

    Wait Until Page Contains Element    ${products_table_row}   ${TIMEOUT}

    Common - Search data    ${item}

    Product - Click on action button to open the menu list

    Common - Click on an element    ${products_menu_UpdateSupp}
    
    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}
    
    Wait Until Page Contains Element    ${products_sub_table_row}   ${TIMEOUT}

    ${update_supp_name}     Common - Get data from a column    ${products_table_update_supplier}      1

    Should Be Equal    ${detail_supp_name}    ${update_supp_name}

Verify create product successfully

    [Arguments]   ${item_create_code}  ${item_create_name}

    Common - Search data    ${item_create_code}

    Common - Click on an element    ${products_grid_item_code.replace('item_code','${item_create_code}')}

    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

    ${item_code}    Common - Get text an element    ${item_label_detail.replace('number','2')}

    ${item_name}    Common - Get text an element    ${item_label_detail.replace('number','3')}

    Should Be Equal     ${item_create_code}    ${item_code}

    Should Be Equal    ${item_create_name}    ${item_name}

    Menu - Click on the Items menu

    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

    Wait Until Page Contains Element    ${products_grid_item_code.replace('item_code','${item_create_code}')}    ${TIMEOUT}

Verify data of standar products

    [Arguments]   ${item_create_code}

    Common - Search data    ${item_create_code}
    
    Wait Until Page Contains Element    ${products_table_row}    ${TIMEOUT}

    ${grid_item_code}       Common - Get text an element    ${products_table_cell.replace('number','2')}

    ${grid_item_name}       Common - Get text an element    ${products_table_cell.replace('number','3')}

    ${grid_item_type}       Common - Get text an element    ${products_table_cell.replace('number','4')}

    ${grid_item_unit}       Common - Get text an element    ${products_table_cell.replace('number','5')}

    ${grid_item_price}      Common - Get text an element    ${products_table_cell.replace('number','6')}

    Common - Click on an element    ${products_grid_item_code.replace('item_code','${item_create_code}')}

    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

    ${item_type}    Common - Get text an element    ${item_label_detail.replace('number','1')}

    ${item_code}    Common - Get text an element    ${item_label_detail.replace('number','2')}

    ${item_name}    Common - Get text an element    ${item_label_detail.replace('number','3')}

    Should Be Equal     ${grid_item_code}    ${item_code}

    Should Be Equal     ${grid_item_name}    ${item_name}

    Should Be Equal     ${grid_item_type}    ${item_type}

    Navigate to PRICE AND COST tab

    ${item_unit}    Common - Get text an element    ${item_label_detail.replace('number','11')}

    ${item_price}   Common - Get text an element    ${item_label_detail.replace('number','13')}

    Should Be Equal    ${grid_item_unit}     ${item_unit}

    Should Be Equal    ${grid_item_price}    ${item_price}

    Menu - Click on the Items menu

    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

    Wait Until Page Contains Element    ${products_grid_item_code.replace('item_code','${item_create_code}')}    ${TIMEOUT}

Verify data of serial products

    [Arguments]   ${item_create_code}

    Common - Search data     ${item_create_code}

    Wait Until Page Contains Element    ${products_table_row}    ${TIMEOUT}

    ${grid_item_code}       Common - Get text an element    ${products_table_cell.replace('number','2')}

    ${grid_item_name}       Common - Get text an element    ${products_table_cell.replace('number','3')}

    ${grid_item_type}       Common - Get text an element    ${products_table_cell.replace('number','4')}

    ${grid_item_unit}       Common - Get text an element    ${products_table_cell.replace('number','5')}

    ${grid_item_price}      Common - Get text an element    ${products_table_cell.replace('number','6')}

    Common - Click on an element    ${products_grid_item_code.replace('item_code','${item_create_code}')}

    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

    ${item_type}    Common - Get text an element    ${item_label_detail.replace('number','1')}

    ${item_code}    Common - Get text an element    ${item_label_detail.replace('number','2')}

    ${item_name}    Common - Get text an element    ${item_label_detail.replace('number','3')}

    Should Be Equal     ${grid_item_code}    ${item_code}

    Should Be Equal     ${grid_item_name}    ${item_name}

    Should Be Equal     ${grid_item_type}    ${item_type}

    Navigate to PRICE AND COST tab

    ${item_unit}    Common - Get text an element    ${item_label_detail.replace('number','11')}

    ${item_price}   Common - Get text an element    ${item_label_detail.replace('number','13')}

    Should Be Equal    ${grid_item_unit}     ${item_unit}

    Should Be Equal    ${grid_item_price}    ${item_price}

    Navigate To Serial/Imei tab

    Wait Until Page Contains Element    ${products_table_row}    ${TIMEOUT}

    ${detail_item_serial1_number}    Common - Get data from a column    ${products_table}    1

    ${detail_item_serial2_number}    Common - Get data from a column    ${products_table}    2

    ${detail_item_serial3_number}    Common - Get data from a column    ${products_table}    3

    Clicking on Edit button for navigate to edit item page

    ### Navigate To Serial/Imei tab ###

    Wait Until Page Contains Element    ${products_tle_Serial}

    Common - Click on an element    ${products_tle_Serial}

    Wait Until Page Contains Element    ${products_table_row}    ${TIMEOUT}

    ${edit_item_serial1_number}    Common - Get data from a column    ${products_table}    2

    ${edit_item_serial2_number}    Common - Get data from a column    ${products_table}    3

    ${edit_item_serial3_number}    Common - Get data from a column    ${products_table}    4

    Should Be Equal    ${detail_item_serial1_number}    ${edit_item_serial1_number}

    Should Be Equal    ${detail_item_serial2_number}    ${edit_item_serial2_number}

    Should Be Equal    ${detail_item_serial3_number}    ${edit_item_serial3_number}

    Menu - Click on the Items menu

    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

    Wait Until Page Contains Element    ${products_table_row}    ${TIMEOUT}

Verify data of matrix products

    [Arguments]   ${item_create_code}

    Common - Search data    ${item_create_code}

    Wait Until Page Contains Element    ${products_table_row}    ${TIMEOUT}

    ${grid_item_code}       Common - Get text an element    ${products_table_cell.replace('number','2')}

    ${grid_item_name}       Common - Get text an element    ${products_table_cell.replace('number','3')}

    ${grid_item_type}       Common - Get text an element    ${products_table_cell.replace('number','4')}

    ${grid_item_unit}       Common - Get text an element    ${products_table_cell.replace('number','5')}

    ${grid_item_price}      Common - Get text an element    ${products_table_cell.replace('number','6')}

    Common - Click on an element    ${products_grid_item_code.replace('item_code','${item_create_code}')}

    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

    Sleep   1s

    ${item_type}    Common - Get text an element    ${item_label_detail.replace('number','1')}

    ${item_code}    Common - Get text an element    ${item_label_detail.replace('number','2')}

    ${item_name}    Common - Get text an element    ${item_label_detail.replace('number','3')}

    ${item_unit}    Common - Get text an element    ${item_label_detail.replace('number','13')}

    ${item_price}   Common - Get text an element    ${item_label_detail.replace('number','15')}

    Should Be Equal     ${grid_item_code}     ${item_code}

    Should Be Equal     ${grid_item_name}     ${item_name}

    Should Be Equal     ${grid_item_type}     ${item_type}

    Should Be Equal     ${grid_item_unit}     ${item_unit}

    Should Be Equal     ${grid_item_price}    ${item_price}

    Menu - Click on the Items menu

    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

    Wait Until Page Contains Element    ${products_grid_item_code.replace('item_code','${item_create_code}')}    ${TIMEOUT}

Verify the update product page appear

    [Arguments]  ${data_tle_item_update}

    ${Title_UpdateItem}     Common - Get text an element    ${products_tle_UpdateItem}

    Should Be Equal    ${data_tle_item_update}    ${title_Update_Item}

Random Item type

    [Return]  ${ItemType}

    ${num} =  Generate random string   1     1234

    ${ItemType}=  Run keyword if  '${num}'=='1'  set variable  Chuẩn
    ...   ELSE  Run keyword if  '${num}'=='2'  set variable  Dịch vụ
    ...   ELSE  Run keyword if  '${num}'=='3'  set variable  Trọng lượng
    ...   ELSE  set variable  Phiếu mua hàng
    log  ${ItemType}

Random Department

    [Return]  ${Department}

    ${num} =  Generate random string   1     12

    ${Department}=  Run keyword if  '${num}'=='1'  set variable  Gian hàng laptop
    ...   ELSE  set variable  Gian hàng PC
    log  ${Department}

Random Barcode

    [Return]  ${Barcode}

    ${num} =  Generate random string   1     123

    ${Barcode}=  Run keyword if  '${num}'=='1'  set variable  Code128
    ...   ELSE  Run keyword if  '${num}'=='2'  set variable  Code93Extended
    ...   ELSE  set variable  None
    log  ${Barcode}

Random Tax

    [Return]  ${Tax}

    ${num} =  Generate random string   1     12

    ${Tax}=  Run keyword if  '${num}'=='1'  set variable  VAT20
    ...   ELSE  set variable  VAT
    log  ${Tax}

Random Unit

    [Return]  ${Unit}

    ${num} =  Generate random string   1     123

    ${Unit}=  Run keyword if  '${num}'=='1'  set variable  Cái
    ...   ELSE  Run keyword if  '${num}'=='2'  set variable  Chiếc
    ...   ELSE  set variable  Bộ
    log  ${Unit}

Input Price A for the item

    [Return]    ${item_price_a}

    Common - Double click on an element    ${products_cell_PriceA}

    Common - Press a key on the keyboard    ${products_txt_PriceA}  CTRL+a+BACKSPACE

    ${item_price_a}  Generate Random String  5   [NUMBERS]

    Common - Input text to element    ${products_txt_PriceA}    ${item_price_a}

Input Price B for the item

    [Return]    ${item_price_b}

    Common - Double click on an element    ${products_cell_PriceB}

    Common - Press a key on the keyboard    ${products_txt_PriceB}  CTRL+a+BACKSPACE

    ${item_price_b}  Generate Random String  5   [NUMBERS]

    Common - Input text to element    ${products_txt_PriceB}    ${item_price_b}

Input Price C for the item

    Common - Double click on an element    ${products_cell_PriceC}

    Common - Press a key on the keyboard    ${products_txt_PriceC}  CTRL+a+BACKSPACE

    ${item_price_c}  Generate Random String  5   [NUMBERS]

    Common - Input text to element    ${products_txt_PriceC}    ${item_price_c}

Click on Save button to update for item

    Common - Click on an element    ${products_btn_SaveUpdate}
    
    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

    Wait Until Page Contains Element    ${homepage_menu_items}      ${TIMEOUT}

    Menu - Click on the Items menu

Clear Data After Create Products Successfully

    [Arguments]  ${item_code}

    Update Status For Items From Is Working To Suspension of bussiness

    Navigate to the Suspension of bussiness product list page for delete Products

    Delete Items    ${item_code}

Add a store for a item

    [Arguments]   ${item_code}   ${data_store}

    Common - Press a key on the keyboard    ${txt_search}    CTRL+a+BACKSPACE

    Common - Search data    ${item_code}

    Product - Click on action button to open the menu list

    Click on update store list menu
    
    Wait Until Page Contains Element    ${products_lbx_StoreList}    ${TIMEOUT}

    Common - Click on an element    ${products_lbx_StoreList}

    Sleep   1s

    Common - Click on an element    ${products_lbx_store.replace('store','${data_store}')}

    Click on update store list button

    Common - Click on an element    ${products_lbx_StoreList}

    Close the pop-up

    Reload Page
    
    Wait Until Page Contains Element    ${products_grid_item_code.replace('item_code','${item_code}')}    ${TIMEOUT}

Update Status For Items From Is Working To Suspension of bussiness

    Product - Click on action button to open the menu list

    Click on update store list menu

    Clear data of store list

    Click on update store list button

    Close the pop-up

Click on update store list menu
    
    Common - Click on an element    ${products_menu_UpdateStatus}

    Sleep   1s

Clear data of store list

    Common - Click on an element    ${products_lbx_StoreList}

    Common - Click on an element    ${products_icon_DelStore}

Click on update store list button

    Common - Click on an element    ${products_btn_StatusAct}

    Wait Until Page Contains Element    ${products_message}     ${TIMEOUT}

Close the pop-up

    Common - Press a key on the keyboard    ${products_lbx_StoreList}    ESC

Navigate to the Suspension of bussiness product list page for delete Products

    Common - Choose a value from combobox    ${products_cbx_Status}    ${products_cbx_Suspensions}
    
    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

    Common - Press a key on the keyboard    ${products_cbx_Status}     TAB

Delete Items

    [Arguments]     ${item_code}

    Wait Until Element Is Enabled       //td[@id="s2-code"]//a[contains(text(),'${item_code}')]     ${TIMEOUT}

    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

    Product - Click on action button to open the menu list

    Common - Click on an element    ${products_menu_DelItems}

    Common - Click on an element    ${products_btn_DelItems}

    Reload Page

Remove item After Create Product Successfully

    [Arguments]  ${item_code}

    ${elements}    Get WebElements     ${bnt_context_menu}

    FOR    ${element}    IN    @{elements}

        Wait Until Element Is Visible    ${products_title_products}     ${TIMEOUT}

        Common - Search data    ${item_code}

        ${count}  Get Element Count    //td[@id="s2-code"]//a[contains(text(),'${item_code}')]

        Exit For Loop If    ${count}==0

        ${element}  Clear Data After Create Products Successfully   ${item_code}

        Element Should Be Visible    ${products_cbx_Status}
        
        Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

    END

Clicking on Edit button for navigate to edit item page

    # Click on Edit button

    Wait Until Page Contains Element    ${products_detail_item_code}   ${TIMEOUT}
    
    Wait Until Page Contains Element    ${products_btn_edit}    ${TIMEOUT}
    
    Common - Click on an element    ${products_btn_edit}

#    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}
    
#    Wait Until Page Does Not Contain Element    ${loader_icon_locator}   ${TIMEOUT}
    
    Wait Until Page Contains Element    ${products_detail_item_code}   ${TIMEOUT}

Delete current serial for update new serial

    Wait Until Page Contains Element    ${products_table_row}   ${TIMEOUT}

    # Click on Select all serial checkbox

    Common - Click on an element    ${products_chk_SelectAllSerial}
    
    Wait Until Page Contains Element    ${products_serial_checked}

    # Click on Delete button to delete all serial

    Common - Click on an element    ${products_btn_DelSerial}

Open the update products page and verify the update page appear

    [Arguments]   ${item_code}   ${title_update}

    View detail a product for verify   ${item_code}

    Clicking on Edit button for navigate to edit item page

    Verify the update product page appear   ${title_update}

View detail a product for verify

    [Arguments]   ${item_code}

    Common - Search data    ${item_code}
    
    Wait Until Page Contains Element    ${products_table_row}   ${TIMEOUT}

    Common - Click on an element    ${products_grid_item_code.replace('item_code','${item_code}')}
    
    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

Select a sub-product for update

    Common - Click on an element    ${products_update_sub_code}

Select a sub-product for update on property tab

    Common - Click on an element    ${products_table_cell.replace('number','4')}

Random Category Laptop

    [Return]  ${category}

    ${category_num}     Generate random string   1     12

    ${category}  Run keyword if  '${category_num}'=='1'   set variable  Laptop gaming
    ...   ELSE   set variable  Laptop văn phòng
    log  ${category}

Random Category PC

    [Return]  ${category}

    ${category_num}     Generate random string   1     12

    ${category}  Run keyword if  '${category_num}'=='1'   set variable  PC gaming
    ...   ELSE   set variable  PC văn phòng
    log  ${category}

Update type for the item

    [Return]   ${update_item_type}

    ${update_item_type}   Random Item type

    Input item type for the item    ${update_item_type}

Update tax for the item

    ${update_tax}   Random Tax

    Input tax For the item    ${update_tax}

Update all unrequired fields in general information tab for sub-product

    # update description for the item

    Input decription for the item

    # Update department for the item

    ${update_department}   Random Department

    Input department for the item    ${update_department}

    ${department}    Set Variable   ${update_department}

    # Update category for the item

    ${update_category}  Run keyword if  '${department}'=='Gian hàng laptop'   Random Category Laptop
    ...   ELSE   Run keyword if  '${department}'=='Gian hàng PC'   Random Category PC
    log  ${update_category}

    Input category for the item    ${update_category}

    # Update barcode for the item

    ${update_barcode}  Random Barcode

    Input barcode for the item    ${update_barcode}

Update unit for the item

    ${update_unit}   Random Unit

    Input unit for the item    ${update_unit}

Update all unrequired fields in price and cost tab for sub-product

    # Update price A for the item

    Input Price A for the item

    # Update price B for the item

    Input Price B for the item

    # Update price C for the item

    Input Price C for the item

Update all unrequired fields in technical information tab for sub-product

    # Update data for technical information

    Navigate to TECHNICAL INFORMATION tab

    Input item size in technical information tab
    
    Common - Click on an element    ${products_icon_delete}

    Add properties and properties value

Add a sub-product for matrix item

    [Arguments]   ${item_parent}

    [Return]   ${sub_item_code}

    View detail a product for verify   ${item_parent}

    Clicking on Edit button for navigate to edit item page

    Navigate to property tab for verify item properties

    Click On Create Items Button To Create Matrix Items

    Click On Create Items Button To Create Matrix Items
    
    ${sub_item_code}    Common - Get text an element    ${products_table_cell.replace('number','4')}

    Click on Save button to update for item

Remove a sub-product for matrix item

    [Arguments]   ${item_parent}

    [Return]   ${sub_item_code}

    View detail a product for verify   ${item_parent}

    Clicking on Edit button for navigate to edit item page
    
    Wait Until Page Contains Element    ${products_detail_item_code}   ${TIMEOUT}

    Navigate to property tab for verify item properties

    ${sub_item_code}    Common - Get text an element    ${products_table_cell.replace('number','4')}

    Click on toggle button left side to hiding the menu

    Click on delete icon to remove a sub product

    Click on toggle button right side to open the menu

    Click on Save button to update for item
    
    Wait Until Page Contains Element    ${products_table_row}    ${TIMEOUT}

Click on toggle button left side to hiding the menu

    Common - Click on an element    ${products_icon_left_side_bar}

Click on toggle button right side to open the menu

    Common - Click on an element    ${products_icon_right_side_bar}

Click on delete icon to remove a sub product

    Wait Until Page Contains Element    ${products_icon_delete_sub}   ${TIMEOUT}

    Common - Click on an element    ${products_icon_delete_sub}

Open the update image pop-up to update image for the item

    Product - Click on action button to open the menu list

    Wait Until Page Contains Element    ${products_menu_add_image}      ${TIMEOUT}

    Common - Click on an element    ${products_menu_add_image}

    Sleep   1s

Upload a image for the item

    [Arguments]   ${data_image}

    ${give_path}    Set Variable    ${CURDIR}

    ${change_path}  Set Variable    ${give_path.replace('TestSuites','Data')}

    ${change_path_to_image_file}  Set Variable    ${give_path.replace('Resources','Data/Images/${data_image}')}

    Common - Upload File    ${products_input_image}     ${change_path_to_image_file}
    
    Common - Wait until the loading icon loads successfully    ${products_icon_loader_image}

Verify image uploaded successfully

    ${count_image}      Get Element Count    ${products_image_upload}

    ${image_number}     Set Variable    [${count_image}]

    Mouse Over    ${products_image_upload}${image_number}

    ${image_uploaded}     Set Variable    ${products_image_upload}${image_number}

    ${get_image_src}    Common - Get attribute an element    ${products_image_upload}${image_number}    src
    
    Common - Click on an element    ${products_btn_view_image}${image_number}
    
    ${get_view_image_src}   Common - Get attribute an element    ${products_view_image}    src

    Should Be Equal    ${get_image_src}    ${get_view_image_src}

    Common - Press a key on the keyboard    ${products_view_image}    ESC

Remove the image after uploaded successfully

    ${count_image}      Get Element Count    ${products_image_upload}

    ${image_number}     Set Variable    [${count_image}]

    Mouse Over    ${products_image_upload}${image_number}
    
    Common - Click on an element    ${products_btn_delete_image}${image_number}

Insert text for the image

    ${count_image}      Get Element Count    ${products_image_upload}

    ${image_number}     Set Variable    [${count_image}]

    Mouse Over    ${products_image_upload}${image_number}
    
    Common - Click on an element    ${products_image_edit}${image_number}

    ${alt}   Generate Random String   10    [LETTERS]

    Common - Press a key on the keyboard    ${products_txt_image_alt}     CTRL+a+BACKSPACE

    Common - Input text to element     ${products_txt_image_alt}     ${alt}
    
    Common - Click on an element    ${products_btn_alt}
    
    Common - Click on an element    ${products_btn_cancel_alt}

Input code for sub-product on property tab

    [Return]   ${sub_code}

    ${sub_code}     Generate Random String   7   123456789

    Common - Press a key on the keyboard    ${products_txt_sub_code_propety}    CTRL+a+BACKSPACE

    Common - Input text to element    ${products_txt_sub_code_propety}    ${sub_code}

Input name for sub-product on property tab

    [Return]   ${sub_name}

    ${sub_name}     Generate Random String   10   [LETTERS]

    Common - Press a key on the keyboard    ${products_txt_sub_name_propety}    CTRL+a+BACKSPACE

    Common - Input text to element    ${products_txt_sub_name_propety}    ${sub_name}

Input description for sub-product on property tab

    [Return]   ${sub_description}

    ${sub_description}     Generate Random String   15   [LETTERS]

    Common - Press a key on the keyboard    ${products_txt_sub_description_propety}    CTRL+a+BACKSPACE

    Common - Input text to element    ${products_txt_sub_description_propety}    ${sub_description}

    Common - Press a key on the keyboard    ${products_txt_sub_description_propety}    TAB

Input price for sub-product on property tab

    [Return]   ${sub_price}

    ${sub_price}     Generate Random String   4   [NUMBERS]

    Common - Press a key on the keyboard    ${products_txt_sub_price_propety}    CTRL+a+BACKSPACE

    Common - Input text to element    ${products_txt_sub_price_propety}    ${sub_price}

    Common - Press a key on the keyboard    ${products_txt_sub_price_propety}    TAB

Input price A for sub-product on property tab

    [Return]   ${sub_price_a}

    ${sub_price_a}     Generate Random String   5   [NUMBERS]

    Common - Press a key on the keyboard    ${products_txt_sub_priceA_propety}    CTRL+a+BACKSPACE

    Common - Input text to element    ${products_txt_sub_priceA_propety}    ${sub_price_a}

    Common - Press a key on the keyboard    ${products_txt_sub_priceA_propety}    TAB

Input price B for sub-product on property tab

    [Return]   ${sub_price_b}

    ${sub_price_b}     Generate Random String   5   [NUMBERS]

    Common - Press a key on the keyboard    ${products_txt_sub_priceB_propety}    CTRL+a+BACKSPACE

    Common - Input text to element    ${products_txt_sub_priceB_propety}    ${sub_price_b}

    Common - Press a key on the keyboard    ${products_txt_sub_priceB_propety}    TAB

Input price C for sub-product on property tab

    [Return]   ${sub_price_c}

    ${sub_price_c}     Generate Random String   5   [NUMBERS]

    Common - Press a key on the keyboard    ${products_txt_sub_priceC_propety}    CTRL+a+BACKSPACE

    Common - Input text to element    ${products_txt_sub_priceC_propety}    ${sub_price_c}

Verify data of the standar product on view detail page

    [Arguments]   ${item_code}

    ${detail_item_type}         Common - Get text an element    ${item_label_detail.replace('number','1')}

    ${detail_item_code}         Common - Get text an element    ${item_label_detail.replace('number','2')}

    ${detail_item_name}         Common - Get text an element    ${item_label_detail.replace('number','3')}

    Navigate to PRICE AND COST tab

    ${detail_item_unit}         Common - Get text an element    ${item_label_detail.replace('number','11')}

    ${detail_item_price}        Common - Get text an element    ${item_label_detail.replace('number','13')}

    Menu - Click on the Items menu
    
    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

#    Search a item    ${item_code}

    Common - Search data    ${item_code}

    ${product_code}         Common - Get text an element    ${products_table_cell.replace('number','2')}

    ${product_name}         Common - Get text an element    ${products_table_cell.replace('number','3')}

    ${product_type}         Common - Get text an element    ${products_table_cell.replace('number','4')}

    ${product_unit}         Common - Get text an element    ${products_table_cell.replace('number','5')}

    ${product_price}        Common - Get text an element    ${products_table_cell.replace('number','6')}

    Should Be Equal    ${detail_item_type}      ${product_type}

    Should Be Equal    ${detail_item_code}      ${product_code}

    Should Be Equal    ${detail_item_name}      ${product_name}

    Should Be Equal    ${detail_item_unit}      ${product_unit}

    Should Be Equal    ${detail_item_price}     ${product_price}

Filter the item by department

    [Arguments]   ${data_department}

    Input department for the item    ${data_department}
    
    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

    Sleep   1s

Filter the item by supplier

    [Arguments]   ${data_supplier}

    Common - Choose a value from combobox    ${products_cbx_supplier}    ${products_filter_input_supplier.replace('supplier','${data_supplier}')}

    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

    Sleep   1s

Verify the data when filter by dapartment

    [Arguments]   ${data_department}

    ${item_data_code}   Common - Get data from a column    ${products_table}    2

    Menu - Click on the Category Management menu

    Sleep   1s

    Menu - Click on the department menu

    Common - Search data    ${data_department}

    Product - Click on action button to open the menu list
    
    Wait Until Page Contains Element    ${department_menu_view_item}    ${TIMEOUT}

    Common - Click on an element    ${department_menu_view_item}

    Wait Until Page Contains Element    ${products_table_verify}//tr    ${TIMEOUT}

    ${department_data_item_code}    Common - Get data from a column    ${products_table_verify}    1

    Should Be Equal    ${item_data_code}    ${department_data_item_code}

Verify the data when filter by supplier

    [Arguments]   ${data_supplier}
    
    Common - Click on an element    ${products_nav_table_item}

    ${item_data_list}   Common - Get data from a column    ${products_table}    2

    Menu - Click on the Suppliers menu

    Common - Search data    ${data_supplier}

    Product - Click on action button to open the menu list

    Common - Click on an element    ${suppliers_menu_item_list}

    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

    Sleep   1s

    Common - Click on an element    ${supplier_nav_table_item}

    Sleep   1s

    Wait Until Page Contains Element    ${products_table_verify}//tr    ${TIMEOUT}

    ${supplier_data_item_list}    Common - Get data from a column    ${products_table_verify}    2

    Should Be Equal    ${item_data_list}    ${supplier_data_item_list}

Verify the data when filter by status

    Wait Until Page Contains Element    ${products_table_row}   ${TIMEOUT}

    ${suspension_status}    Common - Get text an element    ${products_cbx_Status}

    ${xpath}    Set Variable    ${products_table}//tr
    
    ${count}    Get Element Count    ${xpath}

    FOR    ${i}    IN RANGE    1    ${count} + 1

        ${name}     Get Table Cell    ${products_table}     ${i}    11

        Should Be Equal    ${suspension_status}    ${name}

    END

Open the warehouse list pop-up

    Product - Click on action button to open the menu list
    
    Wait Until Page Contains Element    ${products_menu_warehouse_list}     ${TIMEOUT}

    Common - Click on an element    ${products_menu_warehouse_list}

    Sleep   1s

Verify inventory data of the product

    [Return]   ${names}

    Common - Click on an element    ${products_nav_table_warehouse}

    Wait Until Page Contains Element    ${products_table_warehouse_list}  ${TIMEOUT}

    ${xpath}    Set Variable    ${products_table_warehouse_list}

    ${count}    Get Element Count    ${xpath}

    ${names}   Create List

    FOR    ${i}    IN RANGE    1    ${count} + 1

        ${name}     Common - Get text an element    xpath=(${xpath})[${i}]

        Append To List    ${names}    ${name}

    END

    Log    ${names}

#    ${xpath}    Set Variable    ${products_table_warehouse_list_row}
#
#    ${count}    Get Element Count    ${xpath}
#
#    ${warehouse}   Create List
#
#    ${warehouse_list}   Create List
#
#    FOR    ${i}    IN RANGE    1    ${count} + 1
#
#        ${warehouse_name}     Common - Get text an element    ${products_table_warehouse_name.replace('number','${i}')}
#        Append To List    ${warehouse}    ${warehouse_name}
#
#        ${warehouse_inventory}     Common - Get text an element    ${products_table_warehouse_inventory.replace('number','${i}')}
#        Append To List    ${warehouse}    ${warehouse_inventory}
#
#        ${warehouse_order}     Common - Get text an element    ${products_table_warehouse_order.replace('number','${i}')}
#        Append To List    ${warehouse}    ${warehouse_order}
#
#        ${warehouse_available}     Common - Get text an element    ${products_table_warehouse_available.replace('number','${i}')}
#        Append To List    ${warehouse}    ${warehouse_available}
#
#        ${warehouse_transfer_in}     Common - Get text an element    ${products_table_warehouse_transfer_in.replace('number','${i}')}
#        Append To List    ${warehouse}    ${warehouse_transfer_in}
#
#        Append To List    ${warehouse_list}   ${warehouse}
#
#    END
#
#    Log    ${warehouse_list}

    Common - Press a key on the keyboard    ${products_table_warehouse_list}    ESC

Filter Repository by item name      ### Repository Information page ###

    [Arguments]   ${item_name}

    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}
    
    Common - Choose a value from combobox    ${repository_cbx_filter_item}    ${repository_input_filter_item.replace('item_name','${item_name}')}
    
    Common - Click on an element    ${repository_btn_filter}

Navigate to Repository information page

    Wait Until Page Contains Element    ${homepage_menu_repository_information}     ${TIMEOUT}

    Common - Click on an element        ${homepage_menu_repository_information}

    Common - Click on an element        ${homepage_menu_repository_information}

Verify the data in Repository information page when filter by item name

    [Arguments]     ${products_list_warehouse}

    Wait Until Page Contains Element    ${nav_table_colomn3}    ${TIMEOUT}

    Common - Click on an element    ${nav_table_colomn3}
    
    ${repository_warehouse}     Common - Get data from a column    ${products_table}    3

#    ${xpath}    Set Variable    ${products_table_row}
#
#    ${count}    Get Element Count    ${xpath}
#
#    ${warehouse}   Create List
#
#    ${warehouse_list}   Create List
#
#    FOR    ${i}    IN RANGE    1    ${count} + 1
#
#        ${warehouse_name}     Common - Get text an element    ${repository_table_warehouse_name.replace('number','${i}')}
#
#        Append To List    ${warehouse}    ${warehouse_name}
#
#        ${warehouse_inventory}  Common - Get text an element    ${repository_table_warehouse_inventory.replace('number','${i}')}
#
#        Append To List    ${warehouse}   ${warehouse_inventory}
#
#        ${warehouse_order}  Common - Get text an element    ${repository_table_warehouse_order.replace('number','${i}')}
#
#        Append To List    ${warehouse}   ${warehouse_order}
#
#        ${warehouse_available}  Common - Get text an element    ${repository_table_warehouse_available.replace('number','${i}')}
#
#        Append To List    ${warehouse}   ${warehouse_available}
#
#        ${warehouse_TI}  Common - Get text an element    ${repository_table_warehouse_transfer_in.replace('number','${i}')}
#
#        Append To List    ${warehouse}   ${warehouse_TI}
#
#        Append To List    ${warehouse_list}   ${warehouse}
#
#    END
#
#    Log    ${warehouse_list}

    Lists should be equal   ${repository_warehouse}   ${products_list_warehouse}   ignore_order=True

Create a serial item when filling all required fields

    [Arguments]   ${data_type_digital}   ${data_tax_VAT}   ${data_unit}

    [Return]   ${item_code}

    Click On Create Button to open the item class pop-up

    Choose the item class for new item   ${products_chk_ItemNormal}

    Click On Create Product Button For Navigate To Create Product Page

    Input item type for the item      ${data_type_digital}

    ${item_code}    Input code for the standar item

    Input Name for the item

    Input tax For the item  ${data_tax_VAT}

    Navigate to PRICE AND COST tab

    Input unit for the item    ${data_unit}

    Input cost for the item

    Input Price for the item

    Navigate To Serial/Imei tab

    Input Serial 1 For Serial item

    Input Serial 2 For Serial item

    Input Serial 3 For Serial item

    Input quantity serial for the item

    Click on save button to create a product