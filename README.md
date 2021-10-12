# usda.announcements

## Installation

This package is only published on github for now. Therefore, to install it, you can use the following code:

```r
devtools::install_github("bsyben/usda.announcements")
```

Obviously, _devtools_ must be installed at first. Also, other packages which can install R packages from git may also work. However, I have not tested them yet.

## Register api key
This is a simple package for retrieving USDA announcement days with the [USDA EMSI api](https://usda.library.cornell.edu/apidoc/index.html). You can obtain your own free api key by the following steps:

1. Register an account at the [website](https://usda.library.cornell.edu/?locale=en)
2. Use the _key_generator_ function in this package to generate your token for the api

## Find USDA Announcement Publication ID
To use this package, you need to decide the range of dates you want to use and the announcement publication id of your announcements. To find the announcement publication id, go to USDA ESMI [website](https://usda.library.cornell.edu/?locale=en) and search for the announcement. For example, suppose we are looking for Crop Progress. Entering "Crop Progress" in the website search area and choose the first suggested report, you will enter the page with the URL "https://usda.library.cornell.edu/concern/publications/8336h188j?locale=en". Here, the publication id for crop progress is "8336h188j", which is the string between "publications/" and "?". You can use this method to find publication id for other reports.

## An Example

Suppose you want to find announcement release dates for _Crop Production_ between 01/02/2009 and 05/22/2018, then using the following function:

```r
Crop_Progress_Date <- release_dates(start_date = "2009-01-02",end_date = "2018-05-22",pubid = "tm70mv177",key = key)
```

where _key_ is your own api key. Then, the output would be as following:

announcement_dates|announcement_name
-----------------|------------------
2018-05-10|Crop Production
2018-04-10|Crop Production
2018-03-08|Crop Production
2018-02-08|Crop Production

## Feature requests

I don't have too much time to work on this small package so far. If you are familir with git's fork/pull request workflow, please feel free to submit your pull requests. I will review and approve them as soon as possible. If you are not familiar with the workflow, please leave comments in the discussion session. I will try to answer them and make necessary adjustments.
