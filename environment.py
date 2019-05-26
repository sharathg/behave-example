from selenium.webdriver import FirefoxOptions
from selenium.webdriver import Firefox


def before_all(context):
    options = FirefoxOptions()
    options.add_argument("--headless")
    context.driver = Firefox(firefox_options=options)


def after_all(context):
    context.driver.quit()
