*** Settings ***
Documentation   Test check work buttons.
# Подключаем файл с ключевыми словами, для данного теста из папки ${EXECDIR}${/}resources/.
Resource        ${EXECDIR}${/}resources/functional_tests/resources.robot    # Ключевые слова, для функциональных тестов.
# Прописываем необходимые теги, для запуска данного теста, в каких-либо тестовых наборах.
Default Tags    Smoke  Regression  Sanitaze  No_parallel


*** Test Cases ***
# Пишем ОСНОВНОЙ СЦЕНАРИЙ в тест-кейсах, для данного теста по проверке работы кнопок.
Добавить две кнопки Delete на страницу
    [Tags]              Проверка добавления кнопок Delete, на страницу
    # Основное ключевое слово, для данного тест-кейса.
    Add Delete buttons on page        ${url}

Удалить кнопки Delete со страницы
    [Tags]              Проверка удаления кнопок Delete, со страницы
    # Основное ключевое слово, для данного тест-кейса.
    Remove Delete buttons on page
    # Завершаем тест
    Finish the test


*** Keywords ***
# КЛЮЧЕВЫЕ СЛОВА, по проверке работы кнопок на страничке.
Add Delete buttons on page
    [Arguments]     ${url}
    Open browser on the page      ${url}      ${browser}  # Определяет тип браузера в котором будет произв. проверка. Прописывается в аргум. запуска: --variable BROWSER:chrome.

    # Создаем переменную с текстом ошибки, если проверка в данном ключевом слове не отработала. Для отправления этого текста в слак.
    Set Suite Variable      ${text_message}    на страничке не две кнопки Delete.

    # В цикле добавляем 2 кнопки Delete, на страницу.
    : FOR   ${index}    IN RANGE    0    2
    \       sleep  1
    \       Click Element   xpath: ${button_add_element}
    \       sleep  1
    END
    log to console  Добавили 2 кнопки Delete, на страницу.

    # Проверяем, что на странице присутствуют 2 кнопки Delete.
    ${buttons_delete_count}   Get Element Count   xpath: ${button_remove_element}
    Page Should Contain Element     xpath: ${button_remove_element}     limit=2
    Should Be True	    ${buttons_delete_count} == 2     msg=На странице не 2 кнопки Delete!
    log to console  Проверили, что на странице присутствуют 2 кнопки Delete.

    # Если данное ключевое слово отработало без ошибок, создаем переменную ${success} со значением True, для продолжения теста.
    ${success} =    Set Variable    True
    [Return]    ${success}

Remove Delete buttons on page
    # Создаем переменную с текстом ошибки, если проверка в данном ключевом слове не отработала. Для отправления этого текста в слак.
    Set Suite Variable      ${text_message}    на страничке не все кнопки Delete были удалены.

    # Получаем кол-во кнопок Delete, на странице.
    ${finish}   Get Element Count   xpath: ${button_remove_element}
    # Проходим в цикле по полученному кол-ву и удаляем кнопки Delete.
    : FOR   ${index}    IN RANGE    0   ${finish}
    \       sleep  1
    \       Click Element   xpath: ${button_remove_element}
    \       sleep  1
    END
    log to console  Удалили в цикле кнопки Delete, со страницы.

#    Второй вариант удаления кнопок со страницы, используя более лаконичный код в цикле. Данный вариант чуть более тяжелее, т.к. он берет не кол-во элементов для цикла, а сами элементы.
#    # Получаем все кнопки Delete, на странице. Добавляем их в список.
#    @{List}    Get WebElements     xpath: ${button_remove_element}
#    # Нажимаем на каждую из полученных кнопок Delete.
#    :FOR  ${index}  IN  @{List}
#    \       sleep  1
#    \       Click Element   ${index}
#    \       sleep  1
#    END

    # Проверяем, что на странице все кнопки Delete, удалены.
    Page Should Not Contain Element     xpath: ${button_remove_element}
    log to console  Проверили, что на странице все кнопки Delete, удалены.


