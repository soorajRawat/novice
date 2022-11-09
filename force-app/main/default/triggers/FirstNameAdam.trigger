trigger FirstNameAdam on Lead(before insert) {
    for (Lead l : Trigger.new) {
        if(l.FirstName != 'Adam'){
            l.LastName=l.FirstName;
            // update     
        }
    }

}