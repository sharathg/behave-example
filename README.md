# behave-example [![Build Status](https://dev.azure.com/sharathgpai/behave-example/_apis/build/status/sharathg.behave-example?branchName=master)](https://dev.azure.com/sharathgpai/behave-example/_build/latest?definitionId=4&branchName=master)
Example/Base project for BDD Testing using @behave (https://github.com/behave/behave)


## Requirements
* Install Firefox (Add to Path)
* Download Geckodriver for the same Firefox Version (Add to Path)
* Python 3.x


## Setup
* Install dependencies from requirements.txt:  
    <code>pip install -r requirements.txt</code>


## Run (Examples)
* Normal Run  
    <code>behave</code>

* Specific Features  
    <code>behave DIR|FILE|FILE:LINE</code>

* Junit Report XML  
    Default folder (reports/)  
    <code>behave --junit</code>
    
    Specific folder  
    <code> behave --junit --junit-directory=/path/to/folder</code>