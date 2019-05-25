# behave-example
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