from selenium.webdriver import FirefoxOptions
from selenium.webdriver import Firefox


def before_all(context):
    options = FirefoxOptions()
    options.add_argument("--headless")
    context.driver = Firefox(firefox_options=options, service_log_path="/tmp/geckodriver.log")


def after_step(context, step):
    if context.failed:
        test_name = step.name
        for c in "/.: \\":
            test_name = test_name.replace(c, "-")
        context.driver.save_screenshot("screenshot-FAIL-{}.png".format(test_name))


def after_all(context):
    context.driver.quit()
