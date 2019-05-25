from behave import given, when, then
from time import sleep
from datetime import datetime as DT


class Helpers:

    @classmethod
    def open_webpage(cls, context, link):
        context.link = link if link.startswith("http://") else "http://{}".format(link)
        context.driver.get(context.link)

    @classmethod
    def wait_for_page_load(cls, context, timeout=5):
        start = DT.now()
        page_title = context.driver.current_url
        timer = (DT.now() - start).seconds
        while timer <= timeout and context.driver.current_url in [page_title, "loading"]:
            sleep(0.1)
            timer = (DT.now() - start).seconds
        status = context.driver.execute_script("return document.readyState")
        while timer <= timeout and status.lower() != "complete":
            sleep(0.1)
            status = context.driver.execute_script("return document.readyState")
            timer = (DT.now() - start).seconds



@given('Open {link}')
def step_impl(context, link):
    Helpers.open_webpage(context, link)


@when('Title contains {title}')
def step_impl(context, title):
    assert title.lower() in context.driver.title.lower()



@then('Take Screenshot')
def step_impl(context):
    filename = context.link.replace("http://", "")
    for c in "/.:":
        filename = filename.replace(c, "-")
    context.driver.save_screenshot("screenshot-" + filename + ".png")


@given('Search Box is present')
def step_impl(context):
    context.search_box_id = "search-box"
    assert context.driver.find_element_by_id(context.search_box_id)


@when('Search for {name}')
def step_impl(context, name):
    search_box = context.driver.find_element_by_id(context.search_box_id)
    search_box.send_keys(name)
    search_box.submit()
    Helpers.wait_for_page_load(context)


@when('URL and Title has {search_engine} and {name}')
def step_impl(context, search_engine, name):
    assert search_engine.lower() in context.driver.current_url.lower()
    assert search_engine.lower() in context.driver.title.lower()
    assert name.lower() in context.driver.current_url.lower()
    assert name.lower() in context.driver.title.lower()


@then('First 3 Search Results should contains {name}')
def step_impl(context, name):
    search_results_elems = context.driver.find_elements_by_class_name("PartialSearchResults-item-title")
    search_results_text = [elem.text for elem in search_results_elems]
    for result in search_results_text[:3]:
        assert name.lower() in result.lower()
