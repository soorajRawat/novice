//If the Lead FirstName last name and emails matches with existing contact record, throw error (use .addError method)
trigger LeadToContactMatch on Lead (before insert,before Update) {
    list<Contact> conList=[select FirstName,LastName,Email from contact];
    for(lead ld:trigger.new){
        for(contact conMatch:conList){
            
            if(ld.FirstName==conMatch.FirstName && ld.LastName==conMatch.LastName && ld.Email==conMatch.Email){
                ld.addError('FirstName and LastName and Email already exist');
            }
        }
    }
}