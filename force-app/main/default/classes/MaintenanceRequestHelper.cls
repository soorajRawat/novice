public with sharing class MaintenanceRequestHelper {
    public static void updateWorkOrders(list<Id> myList) {
        List<case> newCases = new List<case>();
        Integer duration=10000;
        
        List<Equipment_Maintenance_Item__c> newMaintenanceItem = new List<Equipment_Maintenance_Item__c>();
        List<case> caseList = [SELECT id,Vehicle__c,Subject,ProductID,Product__c, (SELECT id from Equipment_Maintenance_Items__r) 
                               from case where ID IN :myList LIMIT 200];
        Map<id,Equipment_Maintenance_Item__c> equip = new map<id,Equipment_Maintenance_Item__c>
            ([Select ID, Equipment__c, Quantity__c,Equipment__r.id,Equipment__r.Maintenance_Cycle__c from Equipment_Maintenance_Item__c ]);
        for(case cas: caseList){
            case newCase = new Case();
            newCase.Type = 'Routine Maintenance';
            newCase.Status = 'New';
            newCase.Vehicle__c = cas.Vehicle__c;
            newCase.Subject =  String.isBlank(cas.Subject) ? 'Routine Maintenance Request' : cas.Subject;
            newCase.Date_Reported__c = Date.today();
            newCase.ProductId = cas.ProductId;
            newCase.Product__c = cas.Product__c;
            newCase.parentID = cas.Id;
            
            
            for(Equipment_Maintenance_Item__c emi : cas.Equipment_Maintenance_Items__r ){
                duration = Math.min(duration,Integer.valueOf(equip.get(emi.id).Equipment__r.Maintenance_Cycle__c));
                newMaintenanceItem.add(new Equipment_Maintenance_Item__c(
                    Equipment__c = equip.get(emi.id).Equipment__c,
                    Maintenance_Request__c = cas.id,
                    Quantity__c = equip.get(emi.id).Quantity__c));
            }
            Date dueDate = date.TODAY().adddays(duration);
            newCase.Date_Due__c =dueDate;
            newCases.add(newCase);
            
        }
        if(newCases.size()>0){
            Database.insert(newCases);    
        }
        
        for(Case c2: newCases){
            for(Equipment_Maintenance_Item__c emi2 : newMaintenanceItem){
                if(c2.parentID == emi2.Maintenance_Request__c){
                    emi2.Maintenance_Request__c = c2.id;    
                }
            }
        }
        
        if(newMaintenanceItem.size()>0){
            Database.insert(newMaintenanceItem);    
        }     
    }        
}