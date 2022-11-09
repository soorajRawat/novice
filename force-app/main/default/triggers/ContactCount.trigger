trigger ContactCount on Contact (after insert,after update,after delete) {
    set <id>RelatedID = new set<id>();
    if(trigger.isinsert || trigger.isupdate || trigger.isdelete){
        for ( Contact Cons: Trigger.new){
            RelatedID.add(Cons.AccountId);
        }
    }
    List <Account> AccRel= [Select Name, ConatctCount__c, (Select Id from Contacts)  from Account WHERE Id in: RelatedID ];
    for (Account Acc : AccRel){
        List<Contact> ConChange = Acc.Contacts;
        system.debug(ConChange.size());
        Acc.ConatctCount__c = ConChange.size();
    }
    Update AccRel;
}