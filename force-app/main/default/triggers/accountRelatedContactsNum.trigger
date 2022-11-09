//trigger that populates an Account’s “Callable Contacts” field (new custom field). This trigger should populate this field with the 
//total number of related Contacts that have a phone number populated. Should work when contacts are inserted updated and deleted.
trigger accountRelatedContactsNum on Contact (after insert,after update, after delete) {
    Set<ID> relatedId = New Set<ID>();
    if(trigger.isafter && (trigger.isInsert || trigger.isUpdate)){
        for(Contact changeCons: Trigger.new){
            relatedId.add(changeCons.AccountId);
        }}
       if(trigger.isafter && trigger.isdelete ){
        for(Contact changeCons: Trigger.old){
            relatedId.add(changeCons.AccountId);
        }}
    List<Account> relatedAccounts= [Select CallableContacts__c, Id , (select Id from contacts where phone !=Null) 
                                    from Account where Id=: relatedId ];
 
    for (account acc: relatedAccounts){
        acc.CallableContacts__c=acc.contacts.size();
    }
    update relatedAccounts;
}