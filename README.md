# Установка


Установка зависимостей:

    pip install -r requirements.txt
    pip install slackclient==1.0.0
    
    
Скачиваем драйвер для работы с браузером используя пакет webdrivermanager

    webdrivermanager chrome 
    

# Запуск теста
    robot --variable BROWSER:chrome --listener "listeners/functional_tests/CommonListener.py;test_check_buttons" --listener allure_robotframework tests/functional_tests/test_buttons/test_buttons.robot

В переменной BROWSER, можно указывать и другие браузеры. Например :headlesschrome или :firefox.
