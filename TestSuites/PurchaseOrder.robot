*** Settings ***
Resource   ../Resources/Env_Variables.robot

Variables  ../Data/GlobalData.yaml
Variables  ../Data/PurchaseOrderData.yaml

Test Setup             Run Keywords    Open the browser and go to the admin page   ${URL}   ${BROWSER}
...                    AND     The user logins to the system    ${USER_STORE}   ${PASSWORD}

Test Teardown         Close All Browsers

*** Test Cases ***
13972_Create new PO successfully when filling all fields-users do not have approval right
    [Setup]            Run Keywords    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    ...                AND     The user logins to the system    ${USER_STORE2}   ${PASSWORD}
    [Tags]  13972  13738
#    ${item_list}     Get infomation of the item      ${26054.ID_ITEM}
#
#    ${cus_list}      Get information of the customer     ${26054.NAME_CUS}

    PO-Navigate to the Purchase Order list
    PO-Click on the "Create a new Purchase Order" button
    PO-Select New PO and click "filter and add" button
    PO-Input PO number  ${13972.data_po_number}
    PO-Input PO name  ${13972.data_po_name}
    PO-Select a supplier and edit address, phone number  ${13972.data_supplier}  ${13972.data_supplier_address}  ${13972.data_supplier_phonenumber}
    PO-Select the approver  ${13972.data_approver}
    PO-Select the day users send request  ${13972.data_po_requiredday}
    PO-Change status of ordering and pick a day  ${13972.data_po_orderedday}
    PO-Select a warehouse and edit address, phone number  ${13972.data_warehouse}  ${13972.data_warehouse_address}  ${13972.data_warehouse_phonenumber}
    PO-Select the staff purchase  ${13972.data_staffpurchase}
    PO-Input expire time  ${13972.data_expiretime}
    PO-Input PO note  ${13972.data_note}
    PO-Navigate to the products tab
    PO-Type a product code and add it to PO  ${13972.data_product1_code}  ${13972.data_product1_name}
    PO-Type description, quantity, price, discount, tax  ${13972.data_product1_code}  ${13972.data_product1_description}  ${13972.data_product1_quantity}  ${13972.data_product1_price}  ${13972.data_product1_discount}  ${13972.data_product1_tax}
    PO-Type a product code and add it to PO  ${13972.data_product2_code}  ${13972.data_product2_name}
    PO-Type description, quantity, price, discount, tax  ${13972.data_product2_code}  ${13972.data_product2_description}  ${13972.data_product2_quantity}  ${13972.data_product2_price}  ${13972.data_product2_discount}  ${13972.data_product2_tax}
    PO-Input shipping cost  ${13972.data_shippingcost}
    PO-Input other cost  ${13972.data_othercost}
    Sleep   1s
    ${total}  PO-Get total of a Po
    PO-Click on save button
    PO-Verify PO display in grid  ${13972.data_po_number}  ${13972.data_po_name}  ${13972.data_po_status_in_grid}  ${total}
#    View details
    PO-Click on po-number  ${13972.data_po_number}
    &{PO_details}=  Create dictionary  ponumber=${13972.data_po_number}  poname=${13972.data_po_name}  postatus=${13972.data_po_status_in_grid}  posupplier=${13972.data_supplier}   posuppliername=${13972.data_supplier_name}  posupplieraddress=${13972.data_supplier_address}  posupplierphone=${13972.data_supplier_phonenumber}  orderstatus=${13972.data_po_statusofordering}  orderday=${13972.data_po_orderedday_displayed}  powarehouse=${13972.data_warehouse}  powarehousename=${13972.data_warehouse_name}  powarehouseaddress=${13972.data_warehouse_address}  powarehousephone=${13972.data_warehouse_phonenumber}  postaffpurchase=${13972.data_staffpurchase}  porequiredday=${13972.data_po_requiredday_displayed}  approver=${13972.data_approver}  podueday=${13972.data_expiretime}  ponote=${13972.data_note}  poshippingcost=${13972.data_shippingcost}  poothercost=${13972.data_othercost}  pototal=${total}
    PO-Verify PO-details page after creating or updating  &{PO_details}
    PO-Navigate to the Purchase Order list
    PO-Delete a PO by checkbox and delete button  ${13972.data_po_number}

13973_Create new PO successfully when filling all required fields-users do not have approval right
    [Setup]            Run Keywords    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    ...                AND     The user logins to the system    ${USER_STORE2}   ${PASSWORD}
    [Tags]  13973
#    ${item_list}     Get infomation of the item      ${26054.ID_ITEM}
#
#    ${cus_list}      Get information of the customer     ${26054.NAME_CUS}

    PO-Navigate to the Purchase Order list
    PO-Click on the "Create a new Purchase Order" button
    PO-Select New PO and click "filter and add" button
    PO-Input PO name  ${13973.data_po_name}
    PO-Select a supplier  ${13973.data_supplier}
    PO-Select a warehouse  ${13973.data_warehouse}
    PO-Select the approver  ${13973.data_approver}
    PO-Select the day users send request  ${13973.data_po_requiredday}
    PO-Select the staff purchase  ${13973.data_staffpurchase}
    PO-Navigate to the products tab
    PO-Type a product code and add it to PO  ${13973.data_product1_code}  ${13973.data_product1_name}
    PO-Type a product code and add it to PO  ${13973.data_product2_code}  ${13973.data_product2_name}
    ${total}  PO-Get total of a Po
    PO-Click on save button
    ${PO_number}  PO-Find PO code by PO name  ${13973.data_po_name}
    PO-Verify PO display in grid  ${PO_number}  ${13973.data_po_name}  ${13973.data_po_status_in_grid}  ${total}

    PO-Delete a PO by checkbox and delete button  ${PO_number}
26706_Create new PO successfully when filling all fields and pressing Save and send to Approver

    [Setup]            Run Keywords    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    ...                AND     The user logins to the system    ${USER_STORE2}   ${PASSWORD}
    [Tags]  26706  13738
#    ${item_list}     Get infomation of the item      ${26054.ID_ITEM}
#
#    ${cus_list}      Get information of the customer     ${26054.NAME_CUS}

    PO-Navigate to the Purchase Order list
    PO-Click on the "Create a new Purchase Order" button
    PO-Select New PO and click "filter and add" button
    PO-Input PO number  ${26706.data_po_number}
    PO-Input PO name  ${26706.data_po_name}
    PO-Select a supplier and edit address, phone number  ${26706.data_supplier}  ${26706.data_supplier_address}  ${26706.data_supplier_phonenumber}

    PO-Select a warehouse and edit address, phone number  ${26706.data_warehouse}  ${26706.data_warehouse_address}  ${26706.data_warehouse_phonenumber}
    PO-Select the staff purchase  ${26706.data_staffpurchase}
    PO-Select the approver  ${26706.data_approver}
    PO-Select the day users send request  ${26706.data_po_requiredday}
    PO-Change status of ordering and pick a day  ${26706.data_po_orderedday}
    PO-Input expire time  ${26706.data_expiretime}
    PO-Input PO note  ${26706.data_note}
    PO-Navigate to the products tab
    PO-Type a product code and add it to PO  ${26706.data_product1_code}  ${26706.data_product1_name}
    PO-Type description, quantity, price, discount, tax  ${13972.data_product1_code}  ${26706.data_product1_description}  ${26706.data_product1_quantity}  ${26706.data_product1_price}  ${26706.data_product1_discount}  ${26706.data_product1_tax}
    PO-Type a product code and add it to PO  ${26706.data_product2_code}  ${26706.data_product2_name}
    PO-Type description, quantity, price, discount, tax  ${26706.data_product2_code}  ${26706.data_product2_description}  ${26706.data_product2_quantity}  ${26706.data_product2_price}  ${26706.data_product2_discount}  ${26706.data_product2_tax}
    PO-Input shipping cost  ${26706.data_shippingcost}
    PO-Input other cost  ${26706.data_othercost}
    ${total}  PO-Get total of a Po
    PO-Click on save and send request button
    PO-Navigate to the Purchase Order list
    PO-Verify PO display in grid  ${26706.data_po_number}  ${26706.data_po_name}  ${26706.data_po_status_in_grid}  ${total}
    PO-Click on View details in action menu  ${26706.data_po_number}
    Sleep   2s
    &{PO_details}=  Create dictionary  ponumber=${26706.data_po_number}  poname=${26706.data_po_name}  postatus=${26706.data_po_status_in_grid}  posupplier=${26706.data_supplier}   posuppliername=${26706.data_supplier_name}  posupplieraddress=${26706.data_supplier_address}  posupplierphone=${26706.data_supplier_phonenumber}  orderstatus=${26706.data_po_statusofordering}  orderday=${26706.data_po_orderedday_displayed}  powarehouse=${26706.data_warehouse}  powarehousename=${26706.data_warehouse_name}  powarehouseaddress=${26706.data_warehouse_address}  powarehousephone=${26706.data_warehouse_phonenumber}  postaffpurchase=${26706.data_staffpurchase}  porequiredday=${26706.data_po_requiredday_displayed}  approver=${26706.data_approver}  podueday=${26706.data_expiretime}  ponote=${26706.data_note}  poshippingcost=${26706.data_shippingcost}  poothercost=${26706.data_othercost}  pototal=${total}
    PO-Verify PO-details page after creating or updating  &{PO_details}
    PO-Navigate to the products tab in the details page
    PO-Verify items display correctly in the details page after creating or updating  ${26706.data_product1_code}  ${13972.data_product1_name}  ${26706.data_product1_description}  ${26706.data_product1_quantity}  ${26706.data_product1_price}  ${26706.data_product1_discount}  ${26706.data_product1_tax}
    PO-Verify items display correctly in the details page after creating or updating  ${26706.data_product2_code}  ${13972.data_product2_name}  ${26706.data_product2_description}  ${26706.data_product2_quantity}  ${26706.data_product2_price}  ${26706.data_product2_discount}  ${26706.data_product2_tax}
    PO-Navigate to the Purchase Order list
    PO-Cancel a PO  ${26706.data_po_number}
    PO-Delete a PO by checkbox and delete button  ${26706.data_po_number}
26705_Create new PO successfully when filling all fields and pressing Save and Approve
    [Tags]  26705
    [Setup]            Run Keywords    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    ...                AND     The user logins to the system    ${USER_STORE}   ${PASSWORD}

#    ${item_list}     Get infomation of the item      ${26054.ID_ITEM}
#
#    ${cus_list}      Get information of the customer     ${26054.NAME_CUS}

    PO-Navigate to the Purchase Order list
    PO-Click on the "Create a new Purchase Order" button
    PO-Select New PO and click "filter and add" button
    PO-Input PO number  ${26705.data_po_number}
    PO-Input PO name  ${26705.data_po_name}
    PO-Select a supplier and edit address, phone number  ${26705.data_supplier}  ${26705.data_supplier_address}  ${26705.data_supplier_phonenumber}
    PO-Change status of ordering and pick a day  ${26705.data_po_orderedday}
    PO-Select a warehouse and edit address, phone number  ${26705.data_warehouse}  ${26705.data_warehouse_address}  ${26705.data_warehouse_phonenumber}
    PO-Select the staff purchase  ${26705.data_staffpurchase}
    PO-Input expire time  ${26705.data_expiretime}
    PO-Input PO note  ${26705.data_note}
    PO-Navigate to the products tab
    PO-Type a product code and add it to PO  ${26705.data_product1_code}  ${26705.data_product1_name}
    PO-Type description, quantity, price, discount, tax  ${26705.data_product1_code}  ${26705.data_product1_description}  ${26705.data_product1_quantity}  ${26705.data_product1_price}  ${26705.data_product1_discount}  ${26705.data_product1_tax}
    PO-Type a product code and add it to PO  ${26705.data_product2_code}  ${26705.data_product2_name}
    PO-Type description, quantity, price, discount, tax  ${26705.data_product2_code}  ${26705.data_product2_description}  ${26705.data_product2_quantity}  ${26705.data_product2_price}  ${26705.data_product2_discount}  ${26705.data_product2_tax}
    PO-Input shipping cost  ${26705.data_shippingcost}
    PO-Input other cost  ${26705.data_othercost}
    ${total}  PO-Get total of a Po
    PO-Click on save and approve button
    PO-Verify PO display in grid  ${26705.data_po_number}  ${26705.data_po_name}  ${26705.data_po_status_in_grid}  ${total}
    PO-Cancel a PO  ${26705.data_po_number}
    PO-Delete a PO by checkbox and delete button  ${26705.data_po_number}
26709_Users that have approve right create new PO successfully when filling all fields
    [Setup]            Run Keywords    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    ...                AND     The user logins to the system    ${USER_STORE}   ${PASSWORD}
    [Tags]  26709
#    ${item_list}     Get infomation of the item      ${26054.ID_ITEM}
#
#    ${cus_list}      Get information of the customer     ${26054.NAME_CUS}

    PO-Navigate to the Purchase Order list
    PO-Click on the "Create a new Purchase Order" button
    PO-Select New PO and click "filter and add" button
    PO-Input PO number  ${26709.data_po_number}
    PO-Input PO name  ${26709.data_po_name}
    PO-Select a supplier and edit address, phone number  ${26709.data_supplier}  ${26709.data_supplier_address}  ${26709.data_supplier_phonenumber}
    PO-Change status of ordering and pick a day  ${26709.data_po_orderedday}
    PO-Select a warehouse and edit address, phone number  ${26709.data_warehouse}  ${26709.data_warehouse_address}  ${26709.data_warehouse_phonenumber}
    PO-Select the staff purchase  ${26709.data_staffpurchase}
    PO-Input expire time  ${26709.data_expiretime}
    PO-Input PO note  ${26709.data_note}
    PO-Navigate to the products tab
    PO-Type a product code and add it to PO  ${26709.data_product1_code}  ${26709.data_product1_name}
    PO-Type description, quantity, price, discount, tax  ${26709.data_product1_code}  ${26709.data_product1_description}  ${26709.data_product1_quantity}  ${26709.data_product1_price}  ${26709.data_product1_discount}  ${26709.data_product1_tax}
    PO-Type a product code and add it to PO  ${26709.data_product2_code}  ${26709.data_product2_name}
    PO-Type description, quantity, price, discount, tax  ${26709.data_product2_code}  ${26709.data_product2_description}  ${26709.data_product2_quantity}  ${26709.data_product2_price}  ${26709.data_product2_discount}  ${26709.data_product2_tax}
    PO-Input shipping cost  ${26709.data_shippingcost}
    PO-Input other cost  ${26709.data_othercost}
    ${total}  PO-Get total of a Po
    PO-Click on save button
    PO-Verify PO display in grid  ${26709.data_po_number}  ${26709.data_po_name}  ${26709.data_po_status_in_grid}  ${total}
    PO-Delete a PO by checkbox and delete button  ${26709.data_po_number}
26710_Users that have approve right create new PO successfully when filling all required fields
    [Setup]            Run Keywords    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    ...                AND     The user logins to the system    ${USER_STORE}   ${PASSWORD}
    [Tags]  26710
#    ${item_list}     Get infomation of the item      ${26054.ID_ITEM}
#
#    ${cus_list}      Get information of the customer     ${26054.NAME_CUS}

    PO-Navigate to the Purchase Order list
    PO-Click on the "Create a new Purchase Order" button
    PO-Select New PO and click "filter and add" button
    PO-Input PO name  ${26710.data_po_name}
    PO-Select a supplier  ${26710.data_supplier}
    PO-Select a warehouse  ${26710.data_warehouse}
    PO-Select the staff purchase  ${26710.data_staffpurchase}
    PO-Navigate to the products tab
    PO-Type a product code and add it to PO  ${26710.data_product1_code}  ${26710.data_product1_name}
    PO-Type a product code and add it to PO  ${26710.data_product2_code}  ${26710.data_product2_name}
    ${total}  PO-Get total of a Po
    PO-Click on save button
    ${PO_number}  PO-Find PO code by PO name  ${26710.data_po_name}
    PO-Verify PO display in grid  ${PO_number}  ${26710.data_po_name}  ${26710.data_po_status_in_grid}  ${total}
    PO-Delete a PO by checkbox and delete button  ${PO_number}
#    ---------------------------------Delete---------------------------
13755_Delete a PO with the "New" status successfully
    [Setup]            Run Keywords    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    ...                AND     The user logins to the system    ${USER_STORE2}   ${PASSWORD}
    [Tags]  13755
#    ${item_list}     Get infomation of the item      ${26054.ID_ITEM}
#    ${cus_list}      Get information of the customer     ${26054.NAME_CUS}
    PO-Create a Po has 2 product  ${13755.data_po_number_original}  ${13755.data_po_name}  ${13755.data_supplier}  ${13755.data_warehouse}   ${13755.data_product1_code}  ${13755.data_product1_name}  ${13755.data_product2_code}  ${13755.data_product2_name}  ${13755.data_approver}
    PO-Delete PO by delete button in the details page  ${13755.data_po_number_original}

    PO-Create a Po has 2 product  ${13755.data_po_number_original}  ${13755.data_po_name}  ${13755.data_supplier}  ${13755.data_warehouse}   ${13755.data_product1_code}  ${13755.data_product1_name}  ${13755.data_product2_code}  ${13755.data_product2_name}  ${13755.data_approver}
    PO-Delete a PO by checkbox and delete button  ${13755.data_po_number_original}

    PO-Create a Po has 2 product  ${13755.data_po_number_original}  ${13755.data_po_name}  ${13755.data_supplier}  ${13755.data_warehouse}   ${13755.data_product1_code}  ${13755.data_product1_name}  ${13755.data_product2_code}  ${13755.data_product2_name}  ${13755.data_approver}
    PO-Delete PO by action menu  ${13755.data_po_number_original}
13757_Delete a PO with the "Cancel" status successfully
    [Setup]            Run Keywords    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    ...                AND     The user logins to the system    ${USER_STORE2}   ${PASSWORD}
    [Tags]  13757
#    ${item_list}     Get infomation of the item      ${26054.ID_ITEM}
#    ${cus_list}      Get information of the customer     ${26054.NAME_CUS}
    PO-Create a Po has 2 product  ${13757.data_po_number_original}  ${13757.data_po_name}  ${13757.data_supplier}  ${13757.data_warehouse}   ${13757.data_product1_code}  ${13757.data_product1_name}  ${13757.data_product2_code}  ${13757.data_product2_name}  ${13757.data_approver}
    PO-Cancel a PO  ${13757.data_po_number_original}
    PO-Delete PO by delete button in the details page  ${13757.data_po_number_original}

    PO-Create a Po has 2 product  ${13757.data_po_number_original}  ${13757.data_po_name}  ${13757.data_supplier}  ${13757.data_warehouse}   ${13757.data_product1_code}  ${13757.data_product1_name}  ${13757.data_product2_code}  ${13757.data_product2_name}  ${13757.data_approver}
    PO-Cancel a PO  ${13757.data_po_number_original}
    PO-Delete a PO by checkbox and delete button  ${13757.data_po_number_original}

    PO-Create a Po has 2 product  ${13757.data_po_number_original}  ${13757.data_po_name}  ${13757.data_supplier}  ${13757.data_warehouse}   ${13757.data_product1_code}  ${13757.data_product1_name}  ${13757.data_product2_code}  ${13757.data_product2_name}  ${13757.data_approver}
    PO-Cancel a PO  ${13757.data_po_number_original}
    PO-Delete PO by action menu  ${13757.data_po_number_original}
#-------------------------------------------------Update--------------
13807_Update all fields of a purchase order and press "Save" button successfully-Users do not have approval right
    [Tags]  13807
    [Setup]            Run Keywords    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    ...                AND     The user logins to the system    ${USER_STORE2}   ${PASSWORD}

#    ${item_list}     Get infomation of the item      ${26054.ID_ITEM}
#
#    ${cus_list}      Get information of the customer     ${26054.NAME_CUS}
    PO-Create a Po has 2 product  ${13807.data_po_number_original}  ${13807.data_po_name}  ${13807.data_supplier}  ${13807.data_warehouse}   ${13807.data_product1_code}  ${13807.data_product1_name}  ${13807.data_product2_code}  ${13807.data_product2_name}  ${13807.data_approver}
    PO-Navigate to the Purchase Order list
    PO-Click on edit button in the action menu  ${13807.data_po_number_original}
    PO-Input PO number  ${13807.data_po_number}
    PO-Input PO name  ${13807.data_po_name}
    PO-Change status of the PO  ${13807.data_po_status}
    PO-Select a supplier and edit address, phone number  ${13807.data_supplier}  ${13807.data_supplier_address}  ${13807.data_supplier_phonenumber}
    PO-Select the day users send request  ${13807.data_po_requiredday}
    PO-Change status of ordering and pick a day  ${13807.data_po_orderedday}
    PO-Select a warehouse and edit address, phone number  ${13807.data_warehouse}  ${13807.data_warehouse_address}  ${13807.data_warehouse_phonenumber}
    PO-Select the staff purchase  ${13807.data_staffpurchase}
    PO-Select the approver  ${13807.data_approver}
    PO-Input expire time  ${13807.data_expiretime}
    PO-Input PO note  ${13807.data_note}
    PO-Input shipping cost  ${13807.data_shippingcost}
    PO-Input other cost  ${13807.data_othercost}
    PO-Navigate to the products tab in the update page
#    /Edit a products
    PO-Type description, quantity, price, discount, tax  ${13807.data_product1_code}  ${13807.data_product1_description}  ${13807.data_product1_quantity}  ${13807.data_product1_price}  ${13807.data_product1_discount}  ${13807.data_product1_tax}
#    Add a product
#    PO-Type a product code and add it to PO  ${13807.data_product3_code}  ${13807.data_product3_name}
#    PO-Type description, quantity, price, discount, tax  ${13807.data_product3_code}  ${13807.data_product3_description}  ${13807.data_product3_quantity}  ${13807.data_product3_price}  ${13807.data_product3_discount}  ${13807.data_product3_tax}
    #    Delete a product
    PO-Remove a product from PO  ${13807.data_product2_code}
    ${total}  PO-Get total of a Po
    PO-Click on save button
    PO-Verify PO display in grid after update  ${13807.data_po_number}  ${13807.data_po_name}  ${13807.data_po_status}  ${total}
    PO-Click on po-number  ${13807.data_po_number}
    &{PO_details}=  Create dictionary  ponumber=${13807.data_po_number}  poname=${13807.data_po_name}  postatus=${13807.data_po_status_in_grid}  posupplier=${13807.data_supplier}   posuppliername=${13807.data_supplier_name}  posupplieraddress=${13807.data_supplier_address}  posupplierphone=${13807.data_supplier_phonenumber}  orderstatus=${13807.data_po_statusofordering}  orderday=${13807.data_po_orderedday_displayed}  powarehouse=${13807.data_warehouse}  powarehousename=${13807.data_warehouse_name}  powarehouseaddress=${13807.data_warehouse_address}  powarehousephone=${13807.data_warehouse_phonenumber}  postaffpurchase=${13807.data_staffpurchase}  porequiredday=${13807.data_po_requiredday_displayed}  approver=${13807.data_approver}  podueday=${13807.data_expiretime}  ponote=${13807.data_note}  poshippingcost=${13807.data_shippingcost}  poothercost=${13807.data_othercost}  pototal=${total}
    PO-Verify PO-details page after creating or updating  &{PO_details}
    PO-Navigate to the Purchase Order list
    PO-Cancel a PO  ${13807.data_po_number}
    PO-Delete a PO by checkbox and delete button  ${13807.data_po_number}
27165_Update all fields of a purchase order and press "Save" button successfully-Users have approval right
    [Tags]  27165
    [Setup]            Run Keywords    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    ...                AND     The user logins to the system    ${USER_STORE}   ${PASSWORD}

#    ${item_list}     Get infomation of the item      ${26054.ID_ITEM}
#
#    ${cus_list}      Get information of the customer     ${26054.NAME_CUS}
    ${PO_details}  create list
    PO-Create a Po has 2 product  ${27165.data_po_number_original}  ${27165.data_po_name}  ${27165.data_supplier}  ${27165.data_warehouse}   ${27165.data_product1_code}  ${27165.data_product1_name}  ${27165.data_product2_code}  ${27165.data_product2_name}  ${27165.data_approver}
    PO-Click on edit button in the action menu  ${27165.data_po_number_original}
    PO-Input PO number  ${27165.data_po_number}
    PO-Input PO name  ${27165.data_po_name}
    PO-Change status of the PO  ${27165.data_po_status}
    PO-Select a supplier and edit address, phone number  ${27165.data_supplier}  ${27165.data_supplier_address}  ${27165.data_supplier_phonenumber}
    PO-Change status of ordering and pick a day  ${27165.data_po_orderedday}
    PO-Select a warehouse and edit address, phone number  ${27165.data_warehouse}  ${27165.data_warehouse_address}  ${27165.data_warehouse_phonenumber}
    PO-Select the staff purchase  ${27165.data_staffpurchase}
    PO-Input expire time  ${27165.data_expiretime}
    PO-Input PO note  ${27165.data_note}
    PO-Input shipping cost  ${27165.data_shippingcost}
    PO-Input other cost  ${27165.data_othercost}
    PO-Navigate to the products tab in the update page
#    /Edit a products
    PO-Type description, quantity, price, discount, tax  ${27165.data_product1_code}  ${27165.data_product1_description}  ${27165.data_product1_quantity}  ${27165.data_product1_price}  ${27165.data_product1_discount}  ${27165.data_product1_tax}

#    Add a product
#    PO-Type a product code and add it to PO  ${27165.data_product3_code}  ${27165.data_product3_name}
#    PO-Type description, quantity, price, discount, tax  ${27165.data_product3_code}  ${27165.data_product3_description}  ${27165.data_product3_quantity}  ${27165.data_product3_price}  ${27165.data_product3_discount}  ${27165.data_product3_tax}
    #    Delete a product
    PO-Remove a product from PO  ${27165.data_product2_code}
     ${total}  PO-Get total of a Po
    PO-Click on save button
    PO-Verify PO display in grid after update  ${27165.data_po_number}  ${27165.data_po_name}  ${27165.data_po_status}  ${total}
    PO-Cancel a PO  ${27165.data_po_number}
    PO-Delete a PO by checkbox and delete button  ${27165.data_po_number}
26720_Users can update all fields of PO successfully and click on Save and send to approver
    [Tags]  26720
    [Setup]            Run Keywords    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    ...                AND     The user logins to the system    ${USER_STORE2}   ${PASSWORD}

#    ${item_list}     Get infomation of the item      ${26054.ID_ITEM}
#
#    ${cus_list}      Get information of the customer     ${26054.NAME_CUS}
    PO-Create a Po has 2 product  ${26720.data_po_number_original}  ${26720.data_po_name}  ${26720.data_supplier}  ${26720.data_warehouse}   ${26720.data_product1_code}  ${26720.data_product1_name}  ${26720.data_product2_code}  ${26720.data_product2_name}  ${26720.data_approver}
    PO-Navigate to the Purchase Order list
    PO-Click on edit button in the action menu  ${26720.data_po_number_original}
    PO-Input PO number  ${26720.data_po_number}
    PO-Input PO name  ${26720.data_po_name}
    PO-Change status of the PO  ${26720.data_po_status}
    PO-Select a supplier and edit address, phone number  ${26720.data_supplier}  ${26720.data_supplier_address}  ${26720.data_supplier_phonenumber}
    PO-Select the day users send request  ${26720.data_po_requiredday}
    PO-Change status of ordering and pick a day  ${26720.data_po_orderedday}
    PO-Select a warehouse and edit address, phone number  ${26720.data_warehouse}  ${26720.data_warehouse_address}  ${26720.data_warehouse_phonenumber}
    PO-Select the staff purchase  ${26720.data_staffpurchase}
    PO-Select the approver  ${26720.data_approver}
    PO-Input expire time  ${26720.data_expiretime}
    PO-Input PO note  ${26720.data_note}
    PO-Input shipping cost  ${26720.data_shippingcost}
    PO-Input other cost  ${26720.data_othercost}
    PO-Navigate to the products tab in the update page
#    /Edit a products
    PO-Type description, quantity, price, discount, tax  ${26720.data_product1_code}  ${26720.data_product1_description}  ${26720.data_product1_quantity}  ${26720.data_product1_price}  ${26720.data_product1_discount}  ${26720.data_product1_tax}
#    Add a product
#    PO-Type a product code and add it to PO  ${26720.data_product3_code}  ${26720.data_product3_name}
#    PO-Type description, quantity, price, discount, tax  ${26720.data_product3_code}  ${26720.data_product3_description}  ${26720.data_product3_quantity}  ${26720.data_product3_price}  ${26720.data_product3_discount}  ${26720.data_product3_tax}
    #    Delete a product
    PO-Remove a product from PO  ${26720.data_product2_code}
    ${total}  PO-Get total of a Po
    PO-Click on save and send request button
    PO-Verify PO display in grid after update  ${26720.data_po_number}  ${26720.data_po_name}  ${26720.data_po_status_in_grid}  ${total}
    PO-Cancel a PO  ${26720.data_po_number}
    PO-Delete a PO by checkbox and delete button  ${26720.data_po_number}
26721_Users can update all fields of PO successfully and click on Save and approve
    [Tags]  26721
    [Setup]            Run Keywords    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    ...                AND     The user logins to the system    ${USER_STORE}   ${PASSWORD}

#    ${item_list}     Get infomation of the item      ${26054.ID_ITEM}
#
#    ${cus_list}      Get information of the customer     ${26054.NAME_CUS}

    PO-Create a Po has 2 product  ${26721.data_po_number_original}  ${26721.data_po_name}  ${26721.data_supplier}  ${26721.data_warehouse}   ${26721.data_product1_code}  ${26721.data_product1_name}  ${26721.data_product2_code}  ${26721.data_product2_name}  ${26721.data_approver}

    PO-Navigate to the Purchase Order list
    PO-Click on edit button in the action menu  ${26721.data_po_number_original}
    PO-Input PO number  ${26721.data_po_number}
    PO-Input PO name  ${26721.data_po_name}
    PO-Change status of the PO  ${26721.data_po_status}
    PO-Select a supplier and edit address, phone number  ${26721.data_supplier}  ${26721.data_supplier_address}  ${26721.data_supplier_phonenumber}
    PO-Change status of ordering and pick a day  ${26721.data_po_orderedday}
    PO-Select a warehouse and edit address, phone number  ${26721.data_warehouse}  ${26721.data_warehouse_address}  ${26721.data_warehouse_phonenumber}
    PO-Select the staff purchase  ${26721.data_staffpurchase}
    PO-Input expire time  ${26721.data_expiretime}
    PO-Input PO note  ${26721.data_note}
    PO-Input shipping cost  ${26721.data_shippingcost}
    PO-Input other cost  ${26721.data_othercost}
    PO-Navigate to the products tab in the update page
#    /Edit a products
    PO-Type description, quantity, price, discount, tax  ${26721.data_product1_code}  ${26721.data_product1_description}  ${26721.data_product1_quantity}  ${26721.data_product1_price}  ${26721.data_product1_discount}  ${26721.data_product1_tax}
#    Add a product
#    PO-Type a product code and add it to PO  ${26721.data_product3_code}  ${26721.data_product3_name}
#    PO-Type description, quantity, price, discount, tax  ${26721.data_product3_code}  ${26721.data_product3_description}  ${26721.data_product3_quantity}  ${26721.data_product3_price}  ${26721.data_product3_discount}  ${26721.data_product3_tax}
    #    Delete a product
    PO-Remove a product from PO  ${26721.data_product2_code}
    ${total}  PO-Get total of a Po
    PO-Click on approve and save button
    PO-Navigate to the Purchase Order list
    PO-Verify PO display in grid after update  ${26721.data_po_number}  ${26721.data_po_name}  ${26721.data_po_status_in_grid}  ${total}
    PO-Cancel a PO  ${26721.data_po_number}
    PO-Delete a PO by checkbox and delete button  ${26721.data_po_number}
26761_Display the preview of PO fully and correctly
    [Setup]            Run Keywords    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    ...                AND     The user logins to the system    ${USER_STORE2}   ${PASSWORD}
    [Tags]  26761

    PO-Navigate to the Purchase Order list
    PO-Click on the "Create a new Purchase Order" button
    PO-Select New PO and click "filter and add" button
    PO-Input PO number  ${26761.data_po_number}
    PO-Input PO name  ${26761.data_po_name}
    PO-Select a supplier and edit address, phone number  ${26761.data_supplier}  ${26761.data_supplier_address}  ${26761.data_supplier_phonenumber}
    PO-Select the approver  ${26761.data_approver}
    PO-Select the day users send request  ${26761.data_po_requiredday}
    PO-Change status of ordering and pick a day  ${26761.data_po_orderedday}
    PO-Select a warehouse and edit address, phone number  ${26761.data_warehouse}  ${26761.data_warehouse_address}  ${26761.data_warehouse_phonenumber}
    PO-Select the staff purchase  ${26761.data_staffpurchase}
    PO-Input expire time  ${26761.data_expiretime}
    PO-Input PO note  ${26761.data_note}
    PO-Navigate to the products tab
    PO-Type a product code and add it to PO  ${26761.data_product1_code}  ${26761.data_product1_name}
    PO-Type description, quantity, price, discount, tax  ${26761.data_product1_code}  ${26761.data_product1_description}  ${26761.data_product1_quantity}  ${26761.data_product1_price}  ${26761.data_product1_discount}  ${26761.data_product1_tax}
    PO-Type a product code and add it to PO  ${26761.data_product2_code}  ${26761.data_product2_name}
    PO-Type description, quantity, price, discount, tax  ${26761.data_product2_code}  ${26761.data_product2_description}  ${26761.data_product2_quantity}  ${26761.data_product2_price}  ${26761.data_product2_discount}  ${26761.data_product2_tax}
    PO-Input shipping cost  ${26761.data_shippingcost}
    PO-Input other cost  ${26761.data_othercost}
    ${total}  PO-Get total of a Po
    PO-Click on save button
    PO-Verify PO display in grid  ${26761.data_po_number}  ${26761.data_po_name}  ${26761.data_po_status_in_grid}  ${total}
#    preview Po
    PO-Click on preview button  ${26761.data_po_number}
    PO-Verify general details  ${26761.data_supplier}  ${26761.data_supplier_contact}  ${26761.data_supplier_phonenumber}  ${26761.data_supplier_email}  ${26761.data_supplier_payment}  ${26761.data_supplier_taxcode}  ${26761.data_supplier_address}  ${26761.data_staffpurchase}  ${26761.data_po_orderedday_displayed}  ${26761.data_warehouse}  ${26761.data_warehouse_address}  ${26761.data_shippingcost}  ${26761.data_othercost}  ${total}
    PO-Verify the Item display correctly  ${26761.data_product1_code}  ${26761.data_product1_name}  ${26761.data_product1_quantity}  ${26761.data_product1_price}  ${26761.data_product1_discount}  ${26761.data_product1_tax}
    PO-Verify the Item display correctly  ${26761.data_product2_code}  ${26761.data_product2_name}  ${26761.data_product2_quantity}  ${26761.data_product2_price}  ${26761.data_product2_discount}  ${26761.data_product1_tax}
    PO-Close preview pop-up
    PO-Delete a PO by checkbox and delete button  ${26761.data_po_number}
17350_Sending mail to supplier successfully- the supplier will receive email
    [Setup]            Run Keywords    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    ...                AND     The user logins to the system    ${USER_STORE}   ${PASSWORD}
    [Tags]  17350
    PO-Navigate to the Purchase Order list
    PO-Click on the "Create a new Purchase Order" button
    PO-Select New PO and click "filter and add" button
    PO-Input PO number  ${17350.data_po_number}
    PO-Input PO name  ${17350.data_po_name}
    PO-Select a supplier and edit address, phone number  ${17350.data_supplier}  ${17350.data_supplier_address}  ${17350.data_supplier_phonenumber}
    PO-Change status of ordering and pick a day  ${17350.data_po_orderedday}
    PO-Select a warehouse and edit address, phone number  ${17350.data_warehouse}  ${17350.data_warehouse_address}  ${17350.data_warehouse_phonenumber}
    PO-Select the staff purchase  ${17350.data_staffpurchase}
    PO-Input expire time  ${17350.data_expiretime}
    PO-Input PO note  ${17350.data_note}
    PO-Navigate to the products tab
    PO-Type a product code and add it to PO  ${17350.data_product1_code}  ${17350.data_product1_name}
    PO-Type description, quantity, price, discount, tax  ${17350.data_product1_code}  ${17350.data_product1_description}  ${17350.data_product1_quantity}  ${17350.data_product1_price}  ${17350.data_product1_discount}  ${17350.data_product1_tax}
    PO-Type a product code and add it to PO  ${17350.data_product2_code}  ${17350.data_product2_name}
    PO-Type description, quantity, price, discount, tax  ${17350.data_product2_code}  ${17350.data_product2_description}  ${17350.data_product2_quantity}  ${17350.data_product2_price}  ${17350.data_product2_discount}  ${17350.data_product2_tax}
    PO-Input shipping cost  ${17350.data_shippingcost}
    PO-Input other cost  ${17350.data_othercost}
    ${total}  PO-Get total of a Po
    PO-Click on save and approve button
    PO-Verify PO display in grid  ${17350.data_po_number}  ${17350.data_po_name}  ${17350.data_po_status_in_grid}  ${total}
    PO-Click on send po to supplier button in action menu  ${17350.data_po_number}
    PO-Click on send mail button
    PO-Verify PO display in grid  ${17350.data_po_number}  ${17350.data_po_name}  ${17350.data_po_status_update}  ${total}
13823_Receive goods successfully when selecting quantity option and clicking on receive fully
    [Setup]            Run Keywords    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    ...                AND     The user logins to the system    ${USER_STORE}   ${PASSWORD}
    [Tags]  13823
    PO-Navigate to the Purchase Order list
    ${list_item}=  Create List  ${13823.data_product1}  ${13823.data_product2}
    ${13823.data_po_number}  ${total}  PO-Create a new PO has full details  ${13823}   ${list_item}
    PO-Change status of PO to  ${13823.data_po_status_update}  ${13823.data_po_number}
    PO-Verify PO display in grid  ${13823.data_po_number}  ${13823.data_po_name}  ${13823.data_po_status_update}  ${total}
    PO-Navigate to receive po page  ${13823.data_po_number}
    ${PO_Total} =  PO-Click on receive fully  ${13823.data_po_number}  Số lượng
    log  ${PO_Total}
    PO-Navigate to the Purchase Order history
    PO-Verify PO display in history  ${13823.data_po_number}  ${13823.data_po_orderedday_displayed}  ${13823.data_supplier}  Chưa thanh toán  ${PO_Total}
13824_Receive goods successfully when selecting value option and clicking on receive fully
    [Setup]            Run Keywords    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    ...                AND     The user logins to the system    ${USER_STORE}   ${PASSWORD}
    [Tags]  13824
    PO-Navigate to the Purchase Order list
    ${list_item}=  Create List  ${13824.data_product1}  ${13824.data_product2}
    ${13824.data_po_number}  ${total}  PO-Create a new PO has full details  ${13824}   ${list_item}
    PO-Change status of PO to  ${13824.data_po_status_update}  ${13824.data_po_number}
    PO-Verify PO display in grid  ${13824.data_po_number}  ${13824.data_po_name}  ${13824.data_po_status_update}  ${total}
    PO-Navigate to receive po page  ${13824.data_po_number}
    ${PO_Total}  PO-Click on receive fully   Số lượng
    log  ${PO_Total}
    PO-Navigate to the Purchase Order history
    PO-Verify PO display in history  ${13824.data_po_number}  ${13824.data_po_orderedday_displayed}  ${13824.data_supplier}  Chưa thanh toán  ${PO_Total}
13825_The purchase order is completed with "Quantity" option when clicking on the "Receive partially and complete PO" button-Verify shiping quantity-Inventory
    [Setup]            Run Keywords    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    ...                AND     The user logins to the system    ${USER_STORE}   ${PASSWORD}
    [Tags]  13825
    PO-Navigate to the Purchase Order list
    ${list_item}=  Create List  ${13825.data_product1}  ${13825.data_product2}
    ${13825.data_po_number}  ${total}  PO-Create a new PO has full details  ${13825}   ${list_item}
    PO-Change status of PO to  ${13825.data_po_status_update}  ${13825.data_po_number}
    PO-Verify PO display in grid  ${13825.data_po_number}  ${13825.data_po_name}  ${13825.data_po_status_update}  ${total}
    PO-Navigate to receive po page  ${13825.data_po_number}
    PO-Type quantity of an titem to receive  ${13825.data_product1.code}  ${13825.data_product1.quantity_receive}
    PO-Type quantity of an titem to receive  ${13825.data_product2.code}  ${13825.data_product2.quantity_receive}
    ${PO_Total}  PO-Click on receive partially and complete Po  Số lượng
    log  ${PO_Total}
    PO-Navigate to the Purchase Order history
    PO-Verify PO display in history  ${13825.data_po_number}  ${13825.data_po_orderedday_displayed}  ${13825.data_supplier}  Chưa thanh toán  ${PO_Total}

13826_The purchase order is completed with "Value" option when clicking on the "Receive partially and complete PO" button-Verify shiping quantity-Inventory
    [Setup]            Run Keywords    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    ...                AND     The user logins to the system    ${USER_STORE}   ${PASSWORD}
    [Tags]  13826
    PO-Navigate to the Purchase Order list
    ${list_item}=  Create List  ${13826.data_product1}  ${13826.data_product2}
    ${13826.data_po_number}  ${total}  PO-Create a new PO has full details  ${13826}   ${list_item}

    log  ${total}
    log  ${13826.data_po_number}
    PO-Change status of PO to  ${13826.data_po_status_update}  ${13826.data_po_number}
    PO-Verify PO display in grid  ${13826.data_po_number}  ${13826.data_po_name}  ${13826.data_po_status_update}  ${total}
    PO-Navigate to receive po page  ${13826.data_po_number}
    PO-Type quantity of an titem to receive  ${13826.data_product1.code}  ${13826.data_product1.quantity_receive}
    PO-Type quantity of an titem to receive  ${13826.data_product2.code}  ${13826.data_product2.quantity_receive}
    ${PO_Total}  PO-Click on receive partially and complete Po  Giá trị
    log  ${PO_Total}
    PO-Navigate to the Purchase Order history
    PO-Verify PO display in history  ${13826.data_po_number}  ${13826.data_po_orderedday_displayed}  ${13826.data_supplier}  Chưa thanh toán  ${PO_Total}

13829_The purchase order is completed with "Số lượng" option and "Nhận 1 phần , tạo đơn hàng mới cho phần còn lại." button-Verify shipping quantity-inventory
    [Setup]            Run Keywords    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    ...                AND     The user logins to the system    ${USER_STORE}   ${PASSWORD}
    [Tags]  13829
    PO-Navigate to the Purchase Order list
    ${list_item}=  Create List  ${13829.data_product1}  ${13829.data_product2}
    ${13829.data_po_number}  ${total}  PO-Create a new PO has full details  ${13829}   ${list_item}
#
    log  ${total}
    log  ${13829.data_po_number}
#    ${13829.data_po_number}  Set Variable  	1253438
    PO-Change status of PO to  ${13829.data_po_status_update}  ${13829.data_po_number}
    PO-Verify PO display in grid  ${13829.data_po_number}  ${13829.data_po_name}  ${13829.data_po_status_update}  ${total}
    PO-Navigate to receive po page  ${13829.data_po_number}
    PO-Type quantity of an titem to receive  ${13829.data_product1.code}  ${13829.data_product1.quantity_receive}
    PO-Type quantity of an titem to receive  ${13829.data_product2.code}  ${13829.data_product2.quantity_receive}
    ${PO_Total}  PO-Click on receive partially and create new Po  Số lượng
    log  ${PO_Total}
    PO-Navigate to the Purchase Order history
    PO-Verify PO display in history  ${13829.data_po_number}  ${13829.data_po_orderedday_displayed}  ${13829.data_supplier}  Chưa thanh toán  ${PO_Total}
13830_The purchase order is completed with "Giá trị" option and "Nhận 1 phần , tạo đơn hàng mới cho phần còn lại." button-Verify shipping quantity-inventory
    [Setup]            Run Keywords    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    ...                AND     The user logins to the system    ${USER_STORE}   ${PASSWORD}
    [Tags]  13830
    PO-Navigate to the Purchase Order list
    ${list_item}=  Create List  ${13830.data_product1}  ${13830.data_product2}
    ${13830.data_po_number}  ${total}  PO-Create a new PO has full details  ${13830}   ${list_item}
#
    log  ${total}
    log  ${13830.data_po_number}
#    ${13830.data_po_number}  Set Variable  	1253438
    PO-Change status of PO to  ${13830.data_po_status_update}  ${13830.data_po_number}
    PO-Verify PO display in grid  ${13830.data_po_number}  ${13830.data_po_name}  ${13830.data_po_status_update}  ${total}
    PO-Navigate to receive po page  ${13830.data_po_number}
    PO-Type quantity of an titem to receive  ${13830.data_product1.code}  ${13830.data_product1.quantity_receive}
    PO-Type quantity of an titem to receive  ${13830.data_product2.code}  ${13830.data_product2.quantity_receive}
    ${PO_Total}  PO-Click on receive partially and create new Po  Giá trị
    log  ${PO_Total}
    PO-Navigate to the Purchase Order history
    PO-Verify PO display in history  ${13830.data_po_number}  ${13830.data_po_orderedday_displayed}  ${13830.data_supplier}  Chưa thanh toán  ${PO_Total}

13827_The purchase order is completed with "Số lượng" option when clicking on the "Chỉ nhận 1 phần" button-Verify shipping quantity-Inventory
    [Setup]            Run Keywords    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    ...                AND     The user logins to the system    ${USER_STORE}   ${PASSWORD}
    [Tags]  13827
    PO-Navigate to the Purchase Order list
    ${list_item}=  Create List  ${13827.data_product1}  ${13827.data_product2}
    ${13827.data_po_number}  ${total}  PO-Create a new PO has full details  ${13827}   ${list_item}
#
    log  ${total}
    log  ${13827.data_po_number}
#    ${13827.data_po_number}  Set Variable  	1253438
    PO-Change status of PO to  ${13827.data_po_status_update}  ${13827.data_po_number}
    PO-Verify PO display in grid  ${13827.data_po_number}  ${13827.data_po_name}  ${13827.data_po_status_update}  ${total}
    PO-Navigate to receive po page  ${13827.data_po_number}
    PO-Type quantity of an titem to receive  ${13827.data_product1.code}  ${13827.data_product1.quantity_receive}
    PO-Type quantity of an titem to receive  ${13827.data_product2.code}  ${13827.data_product2.quantity_receive}
    PO-Click on receive partially  Số lượng

13828_The purchase order is completed with "Số lượng" option when clicking on the "Chỉ nhận 1 phần" button-Verify shipping quantity-Inventory
    [Setup]            Run Keywords    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    ...                AND     The user logins to the system    ${USER_STORE}   ${PASSWORD}
    [Tags]  13828
    PO-Navigate to the Purchase Order list
    ${list_item}=  Create List  ${13828.data_product1}  ${13828.data_product2}
    ${13828.data_po_number}  ${total}  PO-Create a new PO has full details  ${13828}   ${list_item}
#
    log  ${total}
    log  ${13828.data_po_number}
#    ${13828.data_po_number}  Set Variable  	1253438
    PO-Change status of PO to  ${13828.data_po_status_update}  ${13828.data_po_number}
    PO-Verify PO display in grid  ${13828.data_po_number}  ${13828.data_po_name}  ${13828.data_po_status_update}  ${total}
    PO-Navigate to receive po page  ${13828.data_po_number}
    PO-Type quantity of an titem to receive  ${13828.data_product1.code}  ${13828.data_product1.quantity_receive}
    PO-Type quantity of an titem to receive  ${13828.data_product2.code}  ${13828.data_product2.quantity_receive}
    ${total}  PO-Click on receive partially  ${13828.option}
    PO-Verify PO display in grid  ${13828.data_po_number}  ${13828.data_po_name}  Nhận một phần  ${total}

15087_[The purchase order in status "Receive partially"] Receive good successfully with option "Receive fully"
    [Setup]            Run Keywords    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    ...                AND     The user logins to the system    ${USER_STORE}   ${PASSWORD}
    [Tags]  15087
    PO-Navigate to the Purchase Order list
    ${list_item}=  Create List  ${15087.data_product1}  ${15087.data_product2}
    ${15087.data_po_number}  ${total}  PO-Create a new PO has full details  ${15087}   ${list_item}
#
    log  ${total}
    log  ${15087.data_po_number}
#    ${15087.data_po_number}  Set Variable  	1253438
    PO-Change status of PO to  ${15087.data_po_status_update}  ${15087.data_po_number}
    PO-Verify PO display in grid  ${15087.data_po_number}  ${15087.data_po_name}  ${15087.data_po_status_update}  ${total}
#    ${15087.data_po_number}  Set Variable  7428573
    PO-Navigate to receive po page  ${15087.data_po_number}
    PO-Type quantity of an titem to receive  ${15087.data_product1.code}  ${15087.data_product1.quantity_receive}
    PO-Type quantity of an titem to receive  ${15087.data_product2.code}  ${15087.data_product2.quantity_receive}
    ${total}  PO-Click on receive partially  ${15087.option}
    PO-Verify PO display in grid  ${15087.data_po_number}  ${15087.data_po_name}  Nhận một phần  ${total}
    PO-Navigate to receive po page  ${15087.data_po_number}
    ${PO_Total}  PO-Click on receive fully  Số lượng
    ${total} =  PO-Convert money to integer  ${total}
    ${PO_Total} =  PO-Convert money to integer  ${PO_Total}
    ${PO_Total} =  Evaluate  ${total}+${PO_Total}
    ${PO_Total}  Common - Currency format  ${PO_Total}
    log  ${PO_Total}
    PO-Navigate to the Purchase Order history
    PO-Verify PO display in history  ${15087.data_po_number}  ${15087.data_po_orderedday_displayed}  ${15087.data_supplier}  Chưa thanh toán  ${PO_Total}
15088_[The purchase order in status "Receive partially"] Receive good successfully with option "Receive partially and complete"
    [Setup]            Run Keywords    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    ...                AND     The user logins to the system    ${USER_STORE}   ${PASSWORD}
    [Tags]  15088
    PO-Navigate to the Purchase Order list
    ${list_item}=  Create List  ${15088.data_product1}  ${15088.data_product2}
    ${15088.data_po_number}  ${total}  PO-Create a new PO has full details  ${15088}   ${list_item}
#
    log  ${total}
    log  ${15088.data_po_number}
#    ${15088.data_po_number}  Set Variable  	1253438
    PO-Change status of PO to  ${15088.data_po_status_update}  ${15088.data_po_number}
    PO-Verify PO display in grid  ${15088.data_po_number}  ${15088.data_po_name}  ${15088.data_po_status_update}  ${total}
    PO-Navigate to receive po page  ${15088.data_po_number}
    PO-Type quantity of an titem to receive  ${15088.data_product1.code}  ${15088.data_product1.quantity_receive}
    PO-Type quantity of an titem to receive  ${15088.data_product2.code}  ${15088.data_product2.quantity_receive}
    ${total}  PO-Click on receive partially  ${15088.option}
    PO-Verify PO display in grid  ${15088.data_po_number}  ${15088.data_po_name}  Nhận một phần  ${total}
    PO-Navigate to receive po page  ${15088.data_po_number}
    PO-Type quantity of an titem to receive partially  ${15088.data_product1.code}  ${15088.data_product1.quantity_receive_2}
    PO-Type quantity of an titem to receive partially  ${15088.data_product2.code}  ${15088.data_product2.quantity_receive_2}
    ${PO_Total}  PO-Click on receive partially and create new Po  Số lượng
    ${total} =  PO-Convert money to integer  ${total}
    ${PO_Total} =  PO-Convert money to integer  ${PO_Total}
    ${PO_Total} =  Evaluate  ${total}+${PO_Total}
    ${PO_Total}  Common - Currency format  ${PO_Total}
    log  ${PO_Total}
    PO-Navigate to the Purchase Order history
    PO-Verify PO display in history  ${15088.data_po_number}  ${15088.data_po_orderedday_displayed}  ${15088.data_supplier}  Chưa thanh toán  ${PO_Total}
15089_[The purchase order in status "Receive partially"] Receive good successfully with option "Receive partially and complete"
    [Setup]            Run Keywords    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    ...                AND     The user logins to the system    ${USER_STORE}   ${PASSWORD}
    [Tags]  15089
    PO-Navigate to the Purchase Order list
    ${list_item}=  Create List  ${15089.data_product1}  ${15089.data_product2}
    ${15089.data_po_number}  ${total}  PO-Create a new PO has full details  ${15089}   ${list_item}
#
    log  ${total}
    log  ${15089.data_po_number}
#    ${15089.data_po_number}  Set Variable  	1253438
    PO-Change status of PO to  ${15089.data_po_status_update}  ${15089.data_po_number}
    PO-Verify PO display in grid  ${15089.data_po_number}  ${15089.data_po_name}  ${15089.data_po_status_update}  ${total}
    PO-Navigate to receive po page  ${15089.data_po_number}
    PO-Type quantity of an titem to receive  ${15089.data_product1.code}  ${15089.data_product1.quantity_receive}
    PO-Type quantity of an titem to receive  ${15089.data_product2.code}  ${15089.data_product2.quantity_receive}
    ${total}  PO-Click on receive partially  ${15089.option}
    PO-Verify PO display in grid  ${15089.data_po_number}  ${15089.data_po_name}  Nhận một phần  ${total}
    PO-Navigate to receive po page  ${15089.data_po_number}
    PO-Type quantity of an titem to receive partially  ${15089.data_product1.code}  ${15089.data_product1.quantity_receive_2}
    PO-Type quantity of an titem to receive partially  ${15089.data_product2.code}  ${15089.data_product2.quantity_receive_2}
    ${PO_Total}  PO-Click on receive partially and complete Po  Số lượng
    ${total} =  PO-Convert money to integer  ${total}
    ${PO_Total} =  PO-Convert money to integer  ${PO_Total}
    ${PO_Total} =  Evaluate  ${total}+${PO_Total}
    ${PO_Total}  Common - Currency format  ${PO_Total}
    log  ${PO_Total}
    PO-Navigate to the Purchase Order history
    PO-Verify PO display in history  ${15089.data_po_number}  ${15089.data_po_orderedday_displayed}  ${15089.data_supplier}  Chưa thanh toán  ${PO_Total}
15090_[The purchase order in status "Receive partially"] Receive good successfully with option "Receive partially"
    [Setup]            Run Keywords    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    ...                AND     The user logins to the system    ${USER_STORE}   ${PASSWORD}
    [Tags]  15090
    PO-Navigate to the Purchase Order list
    ${list_item}=  Create List  ${15090.data_product1}  ${15090.data_product2}
    ${15090.data_po_number}  ${total}  PO-Create a new PO has full details  ${15090}   ${list_item}
#
    log  ${total}
    log  ${15090.data_po_number}
#    ${15090.data_po_number}  Set Variable  	1253438
    PO-Change status of PO to  ${15090.data_po_status_update}  ${15090.data_po_number}
    PO-Verify PO display in grid  ${15090.data_po_number}  ${15090.data_po_name}  ${15090.data_po_status_update}  ${total}
    PO-Navigate to receive po page  ${15090.data_po_number}
    PO-Type quantity of an titem to receive  ${15090.data_product1.code}  ${15090.data_product1.quantity_receive}
    PO-Type quantity of an titem to receive  ${15090.data_product2.code}  ${15090.data_product2.quantity_receive}
    ${total}  PO-Click on receive partially  ${15090.option}
    PO-Verify PO display in grid  ${15090.data_po_number}  ${15090.data_po_name}  Nhận một phần  ${total}
    PO-Navigate to receive po page  ${15090.data_po_number}
    PO-Type quantity of an titem to receive partially  ${15090.data_product1.code}  ${15090.data_product1.quantity_receive_2}
    PO-Type quantity of an titem to receive partially  ${15090.data_product2.code}  ${15090.data_product2.quantity_receive_2}
    ${total}  PO-Click on receive partially  Số lượng

30433_Receive goods successfully by creating new serials with option "Receive fully"
    [Setup]            Run Keywords    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    ...                AND     The user logins to the system    ${USER_STORE}   ${PASSWORD}
    [Tags]  30433
    PO-Navigate to the Purchase Order list
    ${list_item}=  Create List  ${30433.data_product1}  ${30433.data_product2}
    ${30433.data_po_number}  ${total}  PO-Create a new PO has full details  ${30433}   ${list_item}
##
    log  ${total}
    log  ${30433.data_po_number}
#    ${30433.data_po_number}  Set Variable  	9545669
    PO-Change status of PO to  ${30433.data_po_status_update}  ${30433.data_po_number}
    PO-Verify PO display in grid  ${30433.data_po_number}  ${30433.data_po_name}  ${30433.data_po_status_update}  ${total}
    PO-Navigate to receive po page  ${30433.data_po_number}
    PO-Type quantity of serial titem to receive partially  ${30433.data_product1.code}  ${30433.data_product1.quantity_receive}
    PO-Type quantity of serial titem to receive partially  ${30433.data_product2.code}  ${30433.data_product2.quantity_receive}
    ${PO_Total}  PO-Click on receive fully  ${30433.option}
    PO-Navigate to the Purchase Order history
    PO-Verify PO display in history  ${30433.data_po_number}  ${30433.data_po_orderedday_displayed}  ${30433.data_supplier}  Chưa thanh toán  ${PO_Total}