Flipkart API seemed difficult to use, probably because it is still in beta. Here's a quick overview of how it works (at the time this is written):

    Obtain an affiliate id and access token from the Flipkart Affiliates website.
    Use your affiliate id in a standard url to view the API homepage that contain custom links through which you can view products in different categories. The standard url is of the format (https://affiliate-api.flipkart.net/affiliate/api/<affiliate-id>.<json/xml>)
    The response will contain API urls for different categories that can be used to obtain product details. These urls require HTTP authentication headers (your affiliate-id and access token) in the GET request. A sample request should look something like this:
    (GET /affiliate/feeds/...?expiresAt=1408599587245&sig=f6be93ff1b2 HTTP/1.1
    Host: affiliate-api.flipkart.net
    Fk-Affiliate-Id: <affiliate-id>
    Fk-Affiliate-Token: <access-code>)
    The response will contain details of 50 products in the selected category. Even out-of-stock and discontinued items are displayed, and the API does not provide an option to sort the list or to exclude unnecessary items.
    To retrieve the next 50 items, the nextUrl link in the previous response should be used. If you need to use the data in a meaningful way, you'll need to save the entire data into a database, and take care of syncing the changes frequently.



Installation

git clone git@github.com:vishalzambre/flipkart_affiliats.git
gem install rest-client
gem install sinatra
cd flipkart_affiliats
rackup
