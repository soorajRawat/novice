trigger LeadUpdate on Lead (before update) {
    set<String> lastname=new Set<String>();
    
    for(Lead l: Trigger.new){
        
       
        if(l.phone==null){
            l.Phone=l.MobilePhone;
            lastname.add(l.LastName);
           }
         else{ lastname.add(l.LastName);
        } system.debug(lastname);
}