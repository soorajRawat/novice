trigger opportunityInsertUpdate on Opportunity (after insert,after update) {
    set <Id>RelatedID = new set<Id>();
   if(trigger.isinsert || trigger.isupdate){
       for ( Opportunity Oppty: Trigger.new){
           RelatedID.add(Oppty.AccountId);
       }
       List <Account> AccRel= [Select Id,Amount__c, (Select Amount from Opportunities order by Amount Desc limit 2)
                               from Account WHERE Id in: RelatedID ];
       for (Account Acc : AccRel){
           Double X=0;
           for (Opportunity Opps : Acc.Opportunities){
               X = X + Opps.Amount;
           }
           Acc.Amount__c = X;
       }
       Update AccRel;
   }
   
}