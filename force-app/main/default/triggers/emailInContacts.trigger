trigger emailInContacts on contact (before insert,before update) {

for(contact con:trigger.new){
   
    if(con.Email==null){
       con.Email='noemail@gmail.com';
    }
}

}