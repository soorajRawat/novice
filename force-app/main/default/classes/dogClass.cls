public with sharing class dogClass {
    @AuraEnabled(cacheable=true)
    public static string randomDogs(){
        Http http=new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://dog.ceo/api/breeds/image/random');
        
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        Map<String, object> results = (Map<String, object>) JSON.deserializeUntyped(response.getBody());
       // return string.valueof(results.get('message'));
       return response.getBody();
    }
    
}
