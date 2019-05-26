from selenium.webdriver import FirefoxOptions
from selenium.webdriver import Firefox


def before_all(context):
    options = FirefoxOptions()
    options.add_argument("--headless")
    context.driver = Firefox(firefox_options=options, service_log_path="/tmp/geckodriver.log")


def after_all(context):
    context.driver.quit()
