global with sharing class WarehouseCalloutService implements Queueable, Database.AllowsCallouts {  
    private static final String WAREHOUSE_URL = 'https://th-superbadge-apex.herokuapp.com/equipment'; 


    global static void equipmentSync(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint(WAREHOUSE_URL);  
        HttpResponse response = http.send(request);
        if(response.getStatusCode() == 200) {
            List<Object> jsonResponse = (List<Object>)JSON.deserializeUntyped(response.getBody());
            system.debug('~~ '+jsonResponse);
            List<Product2> productList = new List<Product2>();

            for(Object ob : jsonResponse) {
                Map<String,Object> mapJson = (Map<String,Object>)ob;
                Product2 pd = new Product2();
                pd.Replacement_Part__c = (Boolean)mapJson.get('replacement');
                pd.Name = (String)mapJson.get('name');
                pd.Maintenance_Cycle__c = (Integer)mapJson.get('maintenanceperiod');
                pd.Lifespan_Months__c = (Integer)mapJson.get('lifespan');
                pd.Cost__c = (Decimal) mapJson.get('lifespan');
                pd.Warehouse_SKU__c = (String)mapJson.get('sku');
                pd.Current_Inventory__c = (Double) mapJson.get('quantity');
                productList.add(pd);
            }            
            if(productList.size()>0)
                upsert productList;
        }        
    }    
    public static void execute(QueueableContext context){
        equipmentSync();
    }
 }