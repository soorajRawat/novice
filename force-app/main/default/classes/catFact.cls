public class catFact {
    public static void factOnCat(){
        Http http=new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://catfact.ninja/fact');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        if(response.getStatusCode() == 200) {
            Map<String, object> results = (Map<String, object>) JSON.deserializeUntyped(response.getBody());
            system.debug(results);
            string result=string.valueof(results.get('fact'));
          system.debug(result);
            }
}
}