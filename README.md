# usda.announcements

## Register api key
This is a simple package for retrieving USDA announcement days with the [USDA EMSI api](https://usda.library.cornell.edu/apidoc/index.html). You can obtain your own free api key from [here](https://www.ers.usda.gov/developer/data-apis/). 

## Find USDA Announcement Publication ID
To use this package, you need to decide the range of dates you want to use and the announcement publication id of your announcements. To find the announcement publication id, go to USDA ESMI [website](https://usda.library.cornell.edu/?locale=en) and search for the announcement. For example, suppose we are looking for Crop Progress. Entering "Crop Progress" in the website search area and choose the first suggested report, you will enter the page with the URL "https://usda.library.cornell.edu/concern/publications/8336h188j?locale=en". Here, the publication id for crop progress is "8336h188j", which is the string between "publications/" and "?". You can use this method to find publication id for other reports.

## An Example

Suppose you want to find announcement release dates for _Crop Production_ between 01/02/2009 and 05/22/2018, then using the following function:

`<Crop_Progress_Date <- release_dates(start_date = "2009-01-02",end_date = "2018-05-22",pubid = "tm70mv177",key = key)>`

where _key_ is your own api key. Then, the output would be as following:

announcement_dates|announcement_name
-----------------------------------
2018-05-10|Crop Production
2018-04-10|Crop Production
2018-03-08|Crop Production
2018-02-08|Crop Production


