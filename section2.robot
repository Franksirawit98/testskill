*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${BROWSER}                  Chrome
${URL}                      https://www.nejavu.com
${DELAY}                    1
${MODAL_XPATH}              //*[@id="top"]/main/div[2]/div[1]/a
${CARTOON_XPATH}            //*[@id="top"]/main/div[1]/div[2]/div[2]/div[2]/nav/div/ul/li[3]/a/span
${BOOKS_XPATH}              //*[@id="top"]/main/div[1]/div[3]/div[1]/div[6]/div[2]/div[1]/div/div[2]/a[2]
${CART_XPATH}               //*[@id="top"]/main/div[1]/div[1]/div/div/div[2]/div/div[4]/ul/li[2]/div/a
${ADD_TO_CART_BUTTON}       //*[@id="quick-cart-button"]
${REMOVE_BUTTON}            //*[@id="cart"]/div[2]/div[2]/div[5]/a
${CONFIRM_BUTTON_XPATH}     //*[@id="top"]/div/div/div[3]/button[1]


*** Test Cases ***
Test case 1: Complete Workflow
    Open Browser To Nejavu
    Close Modal If Present
    Click Cartoon Menu
    # Get Books Names In First Row
    Add Books To Cart In First Row
    Go To Cart
    # Get Book Titles In Cart
    # Verify Books In Cart
    Remove All Books From Cart
    # Verify Cart Badge    0


*** Keywords ***
Open Browser To Nejavu
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

Close Modal If Present
    Run Keyword And Ignore Error    Click Element    ${MODAL_XPATH}

Click Cartoon Menu
    Click Element    ${CARTOON_XPATH}

# Get Books Names In First Row

Add Books To Cart In First Row
    FOR    ${i}    IN RANGE    5
        Scroll Element Into View    ${ADD_TO_CART_BUTTON}
        Wait Until Element Is Visible    ${ADD_TO_CART_BUTTON}    10s
        Execute JavaScript    document.getElementById('quick-cart-button').click()
    END

Go To Cart
    Wait Until Element Is Visible    ${CART_XPATH}    10s
    Wait Until Element Is Enabled    ${CART_XPATH}    10s
    Click Element    ${CART_XPATH}

# Get Book Titles In Cart

# Verify Books In Cart

Remove All Books From Cart
    Click Element    ${REMOVE_BUTTON}
    Click Element    ${CONFIRM_BUTTON_XPATH}
    Sleep    ${DELAY}

# Verify Cart Badge
