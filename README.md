# New York Most Popular Articles Project
This Application shows the most popular articles in last 7 days in the New York Times in a list.
You can view details of the article by tapping one of the articles from the list.
This App Based on Master/Details Views.


![Ipad Screen Shot](https://user-images.githubusercontent.com/2528482/46334476-e523f600-c62c-11e8-9be9-ae1f368be33e.png)


# APIs Used
* Used NYtimes developer website to get access key : https://developer.nytimes.com/
* Used Most Viewed API GET : https://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=#API-KEY

# Third Parties Used 
I used in the project two pods and uploaded the project with pods to make easy when you clone the repository no need to make pod install :
1. [Kingfisher AsyncImageView library](https://github.com/onevcat/Kingfisher).
2. [Alamofire HTTP networking library](https://github.com/Alamofire/Alamofire).

# How the code can be Run
1. Clone the repo.
2. Open the `NYTimesMostPopular.xcworkspace `
3. Select a simulator
4. Click the run button

# How The Unit Test Can Be Run
To run the unit tests follow the below steps
1. Open the project
2. Click and hold the run button until a dropdown menu appears
3. Select the `test` option 
4. Tap on the new icon that appears (the wrench icon)

![How The Unit Test Can Be Run](https://user-images.githubusercontent.com/2528482/46334470-e48b5f80-c62c-11e8-9dae-ba420c26372a.png)

# Generating unit Testing Coverage Reports
In order to get code coverage reports from Xcode, you need to make sure your scheme collects code coverage info.
To make sure follow the below steps:
1. Open xcode
2. Next to the run button, click the scheme, and then click `edit scheme`
![simulator screen shot - ipad air 2 - 2018-10-02 at 01 50 05](https://user-images.githubusercontent.com/2528482/46334471-e48b5f80-c62c-11e8-99c7-bcbc2e4cdc71.png)
3. Click on options tap
4. Make sure there’s a check on the `Collect Code Coverage data`
![How To collect Code Coverage](https://user-images.githubusercontent.com/2528482/46334474-e523f600-c62c-11e8-8c70-76039d657437.png)
5. Run the unit tests (look above for instructions)
6. Tap on the reports icon in the navigation pane
7. Under the latest run details, tap on the coverage item. You will see the code coverage for each class.

![Code Coverage](https://user-images.githubusercontent.com/2528482/46334475-e523f600-c62c-11e8-940e-2b47907b45f3.png)


