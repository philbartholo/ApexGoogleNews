# ApexGoogleNews
ApexGoogleNews

This is the code corresponding to Youtube video XXX showing how to add a link to the Account page layout that will display a page showing Google News for that company. The implementation uses a Visualforce page, and Apex custom controller, and the Google news API.

Here are the step by step instructions:

1) DEVELOPER ACCOUNT:

If you haven't already, sign up for a free developer environment at http://developer.salesforce.com

2) DEVELOPMENT MODE:

Navigate to "Your Name on top header -> My Settings -> Personal -> Advanced User Details" and make sure the checkbox "Development Mode" is checked

3) CONFIGURE GOOGLE API AS A REMOTE SITE:

Navigate to "Setup -> Security Controls -> Remote Site Settings" and set up a new remove site with the Remote Site URL as https://ajax.googleapis.com and make sure it is checked active.  I did not disable security protocol since the call is over HTTPS.

4) ACCOUNT CONTROLLER EXTENSION

Navigate to "Setup -> Develop -> Apex Classes", click new, and add the code from the class AccountNewsControllerExtension found in this repository.

5) ACCOUNT NEWS VISUALFORCE PAGE

Navigate to "Setup -> Develop -> Visualforce" pages, click "New", and add a page with label "Account News", name "Account_News" and add the code from the page Account_News in this repository.  It's not necessary to check that this will be available for Salesforce mobile apps or that it requires CSRF protection.

6) CREATE LINK

Navigate to "Setup -> Customize -> Accounts", "Buttons, Links, and Actions" and click "New Button or Link".  You can label the link "Google News", name it "Google_News" and make it a Detail Page Link with a behavior to display in existing window without the sidebar.  The content source should be "Visualforce Page" and the Content selector should be set to the Account News page created in step 5.

7) UPDATE LAYOUT TO ACCOUNT PAGE

Navigate to "Setup -> Customize -> Accounts -> Page Layouts" and edit the Account Layout.  On top, select Custom Links and drag the "Google News" link you created in step 6 down to the Custom Links section of the page.

8) Test it out by going navigating to the Accounts tab of your instance, selecting any account, clicking on Google News in the Custom Links section, validating that the news links are working, and then clicking on the account name to navigate back to the Accounts page.

Useful Reference for troubleshooting:

Salesforce Developer Workbook: https://developer.salesforce.com/page/Force.com_workbook
