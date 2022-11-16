trigger MaintenanceRequest on Case (before update, after update) {
    // ToDo: Call MaintenanceRequestHelper.updateWorkOrders
     list<Id> caseId=new list<Id>();
     if(trigger.isAfter){
         for(case cd:trigger.new){
             if (cd.Status=='Closed'&&(cd.Type=='Repair'||cd.Type=='Routine Maintenance')){
             caseId.add(cd.Id);
         }
         }}
     MaintenanceRequestHelper.updateWorkOrders(caseId);  
}