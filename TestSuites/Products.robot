*** Settings ***
Resource   ../Resources/Env_Variables.robot
Variables  ../Data/GlobalData.yaml

Test Setup          Run Keywords    Open the browser and go to the admin page   ${URL}   ${BROWSER}
...                 AND     The user logins to the system    ${USER_TENANT}   ${PASSWORD}

Test Teardown       Run Keywords     Close All Browsers

*** Test Cases ***

23679_Create a standar product successfully when filling all required fields

    [Tags]   23679

    Menu - Click on the Items Management menu

    Navigate To Products Page And Verify The Products Page Appears

    Open the item class pop-up and choose the item class  ${23679.data_tle_popup_choose_class}   ${23679.products_chk_ItemNormal}

    Click On Create Product Button For Navigate To Create Product Page

    Verify The Create Product Page Appear successfully  ${23679.data_tle_create}

    Input item type for the item     ${23679.data_type_standar}

    ${item_code}    Input code for the standar item

    Input Name for the item

    Input tax For the item  ${23679.data_tax_VAT}

    Navigate to PRICE AND COST tab

    Verify The PRICE AND COST tab appear successfully  ${23679.data_tle_price_and_cost}

    Input unit for the item    ${23679.data_unit}

    Input cost for the item

    Input Price for the item

    Click on save button to create a product

    Verify data of standar products     ${item_code}

    Remove item After Create Product Successfully  ${item_code}

23680_Create a standar product successfully when filling all fields

    [Tags]   23680

    Menu - Click on the Items Management menu

    Navigate To Products Page And Verify The Products Page Appears

    Open the item class pop-up and choose the item class  ${23680.data_tle_popup_choose_class}   ${23680.products_chk_ItemNormal}

    Navigate to create product page and verify the page appear successfully    ${23680.data_tle_create}

    Input item type for the item     ${23680.data_type_standar}

    ${item_code}    Input code for the standar item

    Input Name for the item

    Filling in all unrequired fields on general information tab    ${23680.data_department}    ${23680.data_category}    ${23680.data_barcode}

    Input tax For the item  ${23680.data_tax_VAT}

    Navigate to PRICE AND COST tab and verify the tab appear successfully    ${23680.data_tle_price_and_cost}

    Input unit for the item    ${23680.data_unit}

    Input cost for the item

    Input Price for the item

    Filling in all unrequired fields on price and cost tab

    Navigate to TECHNICAL INFORMATION tab and verify the tab appear successfully   ${23680.data_tle_tech_infor}

    Filling in all unrequired fields on technical information tab    ${23680.data_parent_item}

    Click on save button to create a product

    Verify data of standar products     ${item_code}

    Remove item After Create Product Successfully  ${item_code}

13880_Create a serial item successfully with the "Serial number 1" property

    [Tags]   13880

    Menu - Click on the Items Management menu

    Navigate To Products Page And Verify The Products Page Appears

    Open the item class pop-up and choose the item class  ${13880.data_tle_popup_choose_class}   ${13880.products_chk_ItemNormal}

    Navigate to create product page and verify the page appear successfully   ${13880.data_tle_create}

    Input item type for the item     ${13880.data_type_digital}

    ${item_code}    Input code for the standar item

    Input Name for the item

    Input tax For the item  ${13880.data_tax_VAT}

    Navigate to PRICE AND COST tab and verify the tab appear successfully    ${13880.data_tle_price_and_cost}

    Input unit for the item    ${13880.data_unit}

    Input cost for the item

    Input Price for the item

    Navigate to Serial/Imei tab and verify the page appear successfully   ${13880.data_tle_serial_imei}

    Input Serial 1 For Serial item

    Input quantity serial for the item

    Click on save button to create a product

    Verify data of serial products   ${item_code}

    Remove item After Create Product Successfully   ${item_code}

13875_Create a serial item successfully with "Serial number 1" and "Serial number 2" properties

    [Tags]   13875

    Menu - Click on the Items Management menu

    Navigate To Products Page And Verify The Products Page Appears

    Open the item class pop-up and choose the item class  ${13875.data_tle_popup_choose_class}   ${13875.products_chk_ItemNormal}

    Navigate to create product page and verify the page appear successfully   ${13875.data_tle_create}

    Input item type for the item     ${13875.data_type_digital}

    ${item_code}    Input code for the standar item

    Input Name for the item

    Input tax For the item  ${13875.data_tax_VAT}

    Navigate to PRICE AND COST tab and verify the tab appear successfully  ${13875.data_tle_price_and_cost}

    Input unit for the item    ${13875.data_unit}

    Input cost for the item

    Input Price for the item

    Navigate to Serial/Imei tab and verify the page appear successfully   ${13875.data_tle_serial_imei}

    Input Serial 1 For Serial item

    Input Serial 2 For Serial item

    Input quantity serial for the item

    Click on save button to create a product

    Verify data of serial products   ${item_code}

    Remove item After Create Product Successfully   ${item_code}

13870_Create a serial item successfully with "Serial number 1", "Serial number 2" and "Serial number 3" properties

    [Tags]   13870

    Menu - Click on the Items Management menu

    Navigate To Products Page And Verify The Products Page Appears

    Open the item class pop-up and choose the item class  ${13870.data_tle_popup_choose_class}   ${13870.products_chk_ItemNormal}

    Navigate to create product page and verify the page appear successfully   ${13870.data_tle_create}

    Input item type for the item      ${13870.data_type_digital}

    ${item_code}    Input code for the standar item

    Input Name for the item

    Input tax For the item  ${13870.data_tax_VAT}

    Navigate to PRICE AND COST tab and verify the tab appear successfully  ${13870.data_tle_price_and_cost}

    Input unit for the item    ${13870.data_unit}

    Input cost for the item

    Input Price for the item

    Navigate to Serial/Imei tab and verify the page appear successfully   ${13870.data_tle_serial_imei}

    Input Serial 1 For Serial item

    Input Serial 2 For Serial item

    Input Serial 3 For Serial item

    Input quantity serial for the item

    Click on save button to create a product

    Verify data of serial products   ${item_code}

    Remove item After Create Product Successfully   ${item_code}

#14382_Create matrix product successfully when filling all fields
#
#    [Tags]   14382
#
#    Menu - Click on the Items Management menu
#
#    Navigate To Products Page And Verify The Products Page Appears
#
#    Open the item class pop-up and choose the item class  ${14382.data_tle_popup_choose_class}   ${14382.products_chk_ItemMatrix}
#
#    Navigate to create product page and verify the page appear successfully   ${14382.data_tle_create}
#
#    ${item_code}   Input code for the matrix item
#
#    Input name for the matrix item
#
#    Input decription for the item
#
#    Input department for the item           ${14382.data_department}
#
#    Input category for the item             ${14382.data_category}
#
#    Input barcode for the item              ${14382.data_barcode}
#
#    Input tax For the item                  ${14382.data_tax}
#
#    Input commission for the item           ${14382.data_commission}
#
#    Input supplier for the matrix items     ${14382.data_supplier}
#
#    Input unit for the item                 ${14382.data_unit}
#
#    Input Cost for the item
#
#    Input Price for the item
#
#    Navigate to property tab for verify item properties
#
#    Input 1 property for the matrix items
#
#    Click on save button to create a product
#
#    Remove item After Create Product Successfully    ${item_code}
#
#25372_Create new matrix product has 3 properties
#
#    [Tags]   25372
#
#    Menu - Click on the Items Management menu
#
#    Navigate To Products Page And Verify The Products Page Appears
#
#    Open the item class pop-up and choose the item class  ${25372.data_tle_popup_choose_class}   ${25372.products_chk_ItemMatrix}
#
#    Navigate to create product page and verify the page appear successfully   ${25372.data_tle_create}
#
#    ${item_code}   Input code for the matrix item
#
#    Input name for the matrix item
#
#    Input decription for the item
#
#    Input department for the item           ${25372.data_department}
#
#    Input category for the item             ${25372.data_category}
#
#    Input barcode for the item              ${25372.data_barcode}
#
#    Input tax For the item                  ${25372.data_tax}
#
#    Input commission for the item           ${25372.data_commission}
#
#    Input supplier for the matrix items     ${25372.data_supplier}
#
#    Input unit for the item                 ${25372.data_unit}
#
#    Input Cost for the item
#
#    Input Price for the item
#
#    Navigate to property tab for verify item properties
#
#    Input 3 property for the matrix items
#
#    Click on save button to create a product
#
#    Remove item After Create Product Successfully    ${item_code}

5902_Add Mutiple Suppliers Successfully For A Product

    [Tags]   5902

    Menu - Click on the Items Management menu

    Navigate To Products Page And Verify The Products Page Appears

    Click on the update supplier menu to open the update suppliers pop-up       ${5902.data_search_item}

    Add multiple suppliers for product and close the update suppliers pop-up    ${5902.data_supplier1}

    Add multiple suppliers for product and close the update suppliers pop-up    ${5902.data_supplier2}

    Remove suppliers after add supplier for product

14374_Copy a product successfully

    [Tags]   14374

    Menu - Click on the Items Management menu

    Navigate To Products Page And Verify The Products Page Appears

    Copy a product from data grid   ${14374.data_item}

    ${item_code}   Verify Create a copy product successfully   ${14374.data_item}

    Remove item After Create Product Successfully    ${item_code}

1524_Verify suppliers list appear when clicking on the View supplier list menu

    [Tags]   1524

    Menu - Click on the Items Management menu

    Navigate To Products Page And Verify The Products Page Appears

    Click on action button and open the suppliers list pop-up to see detail   ${1524.data_item_view_supplier}

    Verify the suppliers list pop-up appear with data correct   ${1524.data_item_view_supplier}

14461_Update all fields of a sub-product successfully           ##### Bug: Can not search a sub product from search textbox #####

    [Tags]   14461

    Menu - Click on the Items Management menu

    Navigate To Products Page And Verify The Products Page Appears

    View detail a product for verify    ${14461.data_item_parent}

    Navigate to property tab for verify item properties

    Select a sub-product for update

    Verify the update product page appear   ${14461.data_tle_item_update}

    ${update_item_type}    Update type for the item

    ${update_item_code}    Input code for the matrix item

    ${update_item_name}    Input name for the matrix item

    Update all unrequired fields in general information tab for sub-product

    ${update_item_tax}     Update tax for the item

    Navigate to PRICE AND COST tab

    ${update_item_unit}    Update unit for the item

    ${update_item_cost}    Input Cost for the item

    ${update_item_price}   Input Price for the item

    Update all unrequired fields in price and cost tab for sub-product

    Update all unrequired fields in technical information tab for sub-product

    Click on Save button to update for item

    Verify create product successfully    ${update_item_code}    ${update_item_name}

14466_Update all required fields of a sub-product successfully

    [Tags]   14466

    Menu - Click on the Items Management menu

    Navigate To Products Page And Verify The Products Page Appears
    
    View detail a product for verify   ${14466.data_item_parent}

    Navigate to property tab for verify item properties

    Select a sub-product for update

    Verify the update product page appear   ${14466.data_tle_item_update}

    ${update_item_type}    Update type for the item

    ${update_item_code}    Input code for the matrix item

    ${update_item_name}    Input name for the matrix item

    ${update_item_tax}     Update tax for the item

    Navigate to PRICE AND COST tab

    ${update_item_unit}    Update unit for the item

    ${update_item_cost}    Input Cost for the item

    ${update_item_price}   Input Price for the item

    Click on Save button to update for item

    Verify create product successfully    ${update_item_code}    ${update_item_name}

25944_Update all fields of sub-products in the properties tab sucessfully

    [Tags]   25944

    Menu - Click on the Items Management menu

    Navigate To Products Page And Verify The Products Page Appears

    View detail a product for verify    ${25944.data_item_parent}

    Clicking on Edit button for navigate to edit item page

    Verify the update product page appear   ${25944.data_tle_item_update}
    
    Navigate to property tab for verify item properties

    Click on toggle button left side to hiding the menu

    Select a sub-product for update on property tab

    ${sub_item_code}            Input code for sub-product on property tab

    ${sub_item_name}            Input name for sub-product on property tab

    ${sub_item_description}     Input description for sub-product on property tab

    ${sub_item_price}           Input price for sub-product on property tab

    ${sub_item_price_a}          Input price A for sub-product on property tab

    ${sub_item_price_b}          Input price B for sub-product on property tab

    ${sub_item_price_c}          Input price C for sub-product on property tab

    Click on toggle button right side to open the menu

    Click on Save button to update for item

    Verify create product successfully    ${sub_item_code}    ${sub_item_name}

25943_Remove sub-product from matrix product successfully

    [Tags]   25943

    Menu - Click on the Items Management menu

    Navigate To Products Page And Verify The Products Page Appears

    ${sub_item}         Remove a sub-product for matrix item    ${25943.data_item_parent}

    ${sub_item_code}    Add a sub-product for matrix item       ${25943.data_item_parent}

    Remove item After Create Product Successfully               ${sub_item}

17537_Create new serial 1, 2, 3 sucessfully when updating all fields of a serial product

    [Tags]   17537

    Menu - Click on the Items Management menu

    Navigate To Products Page And Verify The Products Page Appears

    ${serial_item_code}   Create a serial item when filling all required fields   ${17537.data_item_type}   ${17537.data_tax_VAT}   ${17537.data_unit}

    Open the update products page and verify the update page appear    ${serial_item_code}   ${17537.data_tle_item_update}

    Input item type for the item    ${17537.data_item_type}
    
    ${update_item_code}    Input code for the serial item

    ${update_item_name}    Input name for the matrix item

    Update all unrequired fields in general information tab for sub-product

    ${update_item_tax}     Input tax For the item    ${17537.data_tax_VAT}

    Navigate to PRICE AND COST tab

    ${update_item_unit}    Update unit for the item

    ${update_item_cost}    Input Cost for the item

    ${update_item_price}   Input Price for the item

    Update all unrequired fields in price and cost tab for sub-product

#    Update all unrequired fields in technical information tab for sub-product     -----Bug: Can not update data for technical information after added a parent product)-----

    Navigate to Serial/Imei tab and verify the page appear successfully   ${17537.data_tle_serial_imei}

    Delete current serial for update new serial

    Input Serial 1 For Serial item

    Input Serial 2 For Serial item

    Input Serial 3 For Serial item

    Input quantity serial for the item

    Click on Save button to update for item

    Verify data of serial products    ${update_item_code}
    
    Remove item After Create Product Successfully    ${update_item_code}

17538_Create new serial 1, 2 sucessfully when updating all fields of a serial product

    [Tags]   17538

    Menu - Click on the Items Management menu

    Navigate To Products Page And Verify The Products Page Appears
    
    ${serial_item_code}   Create a serial item when filling all required fields   ${17538.data_item_type}   ${17538.data_tax_VAT}   ${17538.data_unit}

    Open the update products page and verify the update page appear   ${serial_item_code}   ${17538.data_tle_item_update}

    Input item type for the item    ${17538.data_item_type}

    ${update_item_code}    Input code for the serial item

    ${update_item_name}    Input name for the matrix item

    Update all unrequired fields in general information tab for sub-product

    ${update_item_tax}     Input tax For the item    ${17538.data_tax_VAT}

    Navigate to PRICE AND COST tab

    ${update_item_unit}    Update unit for the item

    ${update_item_cost}    Input Cost for the item

    ${update_item_price}   Input Price for the item

    Update all unrequired fields in price and cost tab for sub-product

#    Update all unrequired fields in technical information tab for sub-product     -----Bug: Can not update data for technical information after added a parent product-----

    Navigate to Serial/Imei tab and verify the page appear successfully   ${17538.data_tle_serial_imei}

    Delete current serial for update new serial

    Input Serial 1 For Serial item

    Input Serial 2 For Serial item

    Input quantity serial for the item

    Click on Save button to update for item

    Verify data of serial products    ${update_item_code}
    
    Remove item After Create Product Successfully    ${update_item_code}

25945_Stop selling a product in a store successfully by updating status in action button

    [Tags]   25945

    Menu - Click on the Items Management menu

    Navigate To Products Page And Verify The Products Page Appears

    Common - Search data    ${25945.data_item}

    Update Status For Items From Is Working To Suspension of bussiness

    Navigate to the Suspension of bussiness product list page for delete Products

    Add a store for a item    ${25945.data_item}    ${25945.data_store}

25946_Stop selling a product in all stores successfully by updating status in action button

    [Tags]   25946

    Menu - Click on the Items Management menu

    Navigate To Products Page And Verify The Products Page Appears

    Common - Search data    ${25946.data_item}

    Update Status For Items From Is Working To Suspension of bussiness

    Navigate to the Suspension of bussiness product list page for delete Products

    Add a store for a item    ${25946.data_item}    ${25946.data_store1}

    Add a store for a item    ${25946.data_item}    ${25946.data_store2}

    Add a store for a item    ${25946.data_item}    ${25946.data_store3}

17427_User update images successfully-verify image after uploading

    [Tags]   17427

    Menu - Click on the Items Management menu

    Navigate To Products Page And Verify The Products Page Appears

    Common - Search data    ${17427.data_item}

    Open the update image pop-up to update image for the item

    Upload a image for the item    ${17427.data_image}

    Verify image uploaded successfully

    Remove the image after uploaded successfully

17428_User update images successfully when the user inserts text

    [Tags]   17428

    Menu - Click on the Items Management menu

    Navigate To Products Page And Verify The Products Page Appears

    Common - Search data    ${17428.data_item}

    Open the update image pop-up to update image for the item

    Upload a image for the item    ${17428.data_image}

    Insert text for the image

    Verify image uploaded successfully

    Remove the image after uploaded successfully

25947_Return correct product when typing a product code

    [Tags]   25947

    Menu - Click on the Items Management menu

    Navigate To Products Page And Verify The Products Page Appears

    View detail a product for verify    ${25947.data_item}

    Verify data of the standar product on view detail page   ${25947.data_item}

25948_Return correct products when selecting a department

    [Tags]   25948

    Menu - Click on the Items Management menu

    Navigate To Products Page And Verify The Products Page Appears
    
    Filter the item by department    ${25948.data_department}
    
    Verify the data when filter by dapartment    ${25948.data_department}

25949_Return correct products when selecting a supplier

    [Tags]   25949

    Menu - Click on the Items Management menu

    Navigate To Products Page And Verify The Products Page Appears

    Filter the item by supplier    ${25949.data_supplier}

    Verify the data when filter by supplier    ${25949.data_supplier}

25950_Return correct products when selecting a status of product    ### Suspension status ###

    [Tags]   25950

    Menu - Click on the Items Management menu

    Navigate To Products Page And Verify The Products Page Appears

    Navigate to the Suspension of bussiness product list page for delete Products

    Verify the data when filter by status

14370_View warehouse details successfully by clicking on view warehouse menu

    [Tags]   14370

    Menu - Click on the Items Management menu

    Navigate To Products Page And Verify The Products Page Appears

    Common - Search data    ${14370.data_item_name}

    Open the warehouse list pop-up

    ${products_list_warehouse}    Verify inventory data of the product

    Navigate to Repository information page

    Filter Repository by item name   ${14370.data_item_name}

    Verify the data in Repository information page when filter by item name  ${products_list_warehouse}

10920_View detail with the serial item by clicking on the product code

    [Tags]   10920

    Menu - Click on the Items Management menu

    Navigate To Products Page And Verify The Products Page Appears

    ${serial_item_code}   Create a serial item when filling all required fields   ${10920.data_type_digital}   ${10920.data_tax_VAT}   ${10920.data_unit}

    Verify data of serial products    ${serial_item_code}

    Remove item After Create Product Successfully   ${serial_item_code}

