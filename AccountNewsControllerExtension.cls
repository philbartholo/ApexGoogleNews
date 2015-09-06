/*
Calls Google API to get news stories about a Salesforce account.
*/

public class AccountNewsControllerExtension
{
    Private final Account acct;
    
    public AccountNewsControllerExtension(ApexPages.StandardController stdController)
    {
        this.acct = (Account)stdController.getRecord();
    }
    
    
    /* Used by Visualforce page to retrieve list news stories of Constructs AJAX call, 
       calls API, passes results to parsing method, returns list to VisualForce page. */
    public List<String> getNewsStories()
    {
        String call = 'https://ajax.googleapis.com/ajax/services/search/news?v=1.0&q='+EncodingUtil.urlEncode(acct.name,'UTF-8');
        
        // Instantiate a new http object
        Http h = new Http();

         // Instantiate a new HTTP request, specify the method (GET) as well as the endpoint
        HttpRequest req = new HttpRequest();
        
        req.setEndpoint(call);
        req.setMethod('GET');

        // Send the request, and return a response
        HttpResponse res = h.send(req);
  
        return parseNewsStories(res.getBody());

    }
    
    /* Receives JSON string, parses it looking for link titles and URL's, 
    constructs and returns list of links */
    private List<String> parseNewsStories( String jsonString )
    {
        List<String> accountNewsStories = new List<String>();

        String parsedString = '', title=null, url=null;

        // parse JSON returned by Google
        JSONParser parser = JSON.createParser(jsonString);
        
        // traverse tokens looking for URL and title tags
        while ( parser.nextToken() != null ) 
        {
                
                if ( parser.getText() == 'unescapedUrl' )
                {
                    // found URL
                    parser.nextToken();
                    url = parser.getText();
                }
                
                if ( parser.getText() == 'title' )
                {
                    // found title
                    parser.nextToken();
                    title = parser.getText();
                }
                
                if ( title!=null && url!=null )
                {
                    // link ready
                    accountNewsStories.add('<A HREF='+url+'>'+title+'</A>');
                    title=null; 
                    url=null;
                }
        }
        return accountNewsStories;
    }
    
}
