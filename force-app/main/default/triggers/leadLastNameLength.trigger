trigger leadLastNameLength on Lead (before insert,before update) {
    set<id> relatedId=new set<id>();
    
    for(lead newEntry:trigger.new){
        
    if(newEntry.LastName!=newEntry.FirstName){
        
        newEntry.LastNameLen__c=newEntry.LastName.Length();
    }
   }
  
   
}
