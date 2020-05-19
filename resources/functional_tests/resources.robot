# Проверка работы кнопок на странице http://the-internet.herokuapp.com/add_remove_elements/.
# Со списков ключевых слов.
*** Settings ***
Documentation   Keywords for check work buttons
Library         SeleniumLibrary
Library         Collections
Library         DateTime
Library         String
Library	        Screenshot
# Общие для всех тестов, page object переменные.
Variables       ${EXECDIR}${/}page_objects/Elements.py

*** Variables ***
# Создаем переменную с базовым url, для тест-кейсов по проверке работы кнопок.
${url}      http://the-internet.herokuapp.com/add_remove_elements/


*** Keywords ***
#---ОБЩИЕ КЛЮЧЕВЫЕ СЛОВА, ОДИНАКОВЫЕ ДЛЯ РАЗЛИЧНЫХ ТЕСТОВ, ПО ПРОВЕРКЕ РАЗЛИЧНОГО ФУНКЦИОНАЛА.----#
# Т.к. тест небольшой, здесь только 2 общих ключевых слова.
# Первое, открывает браузер на указанной странице.
# Второе, закрывает браузер после завершения теста.

# Открываем браузер.
Open browser on the page
    [Arguments]     ${url}      ${type_browsers}
    Open Browser    ${url}      browser=${type_browsers}
    #Set Window Size     1600	900
    Maximize Browser Window
    Set Suite Variable     ${name_browsers}    ${type_browsers}

# Завершаем тест
Finish the test
    # Закрываем браузер и завершаем тест.
    [Teardown]    Close Browser
    Sleep   2
















