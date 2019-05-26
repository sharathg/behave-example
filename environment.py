from selenium.webdriver import FirefoxOptions
from selenium.webdriver import Firefox
from os import getcwd


def before_all(context):
    options = FirefoxOptions()
    options.add_argument("--headless")
    context.driver = Firefox(firefox_options=options, service_log_path="{}/geckodriver.log".format(getcwd()))


def after_all(context):
    context.driver.quit()
