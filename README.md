# Installation


Installing dependencies:

    pip install -r requirements.txt
    pip install slackclient==1.0.0
    
    
Download the driver to work with the browser using the web driver manager package

    webdrivermanager chrome 
    

# Running the test
    robot --variable BROWSER:chrome --listener "listeners/functional_tests/CommonListener.py;test_check_buttons" --listener allure_robotframework tests/functional_tests/test_buttons/test_buttons.robot

In the BROWSER variable, you can specify other browsers. For example: headless chrome or: firefox.


Link to Demo - https://drive.google.com/open?id=1ARmItloOmuwks4Tl0Pfv0hEgky8FF7nE
