trigger updateLeadInsertTask on Lead (before insert,after insert) {
    list<Task> infoTask=new list<Task>();
    
    list<Task> warningTask=new list<Task>();
    for(Lead ld:trigger.new){
        
        if(trigger.isinsert&&trigger.isbefore){
             integer count=0;
             decimal score=0;
            if(ld.FirstName!=Null){
                score=score+10;
                count=count+1;
               
                }
            if(ld.LastName!=Null){
                score=score+20;
                count=count+1;
                 
            }
            if(ld.Email!=Null){
                score=score+25;
                count=count+1;
               
            }
            if(ld.Phone!=Null){
                score=score+25;
                count=count+1;
               
            }
            if(ld.Website!=Null){
                score=score+10;
                count=count+1;
                
            }
            if(ld.Title!=Null){
                score=score+10;
                count=count+1;
               
            }
           ld.FieldsPopulated__c=count;
           ld.DataQuality__c=score/100*100;
        }
       
        if(trigger.isinsert&&trigger.isafter && ld.FieldsPopulated__c>=3){
            
            User u=[Select Id from User where Alias=:'ada.ba'];
            list<String> fieldNames=New list<String>();
            Task tt=new task();
            if(ld.FirstName!=Null){
                if(ld.FirstName.containsIgnoreCase('TEST')){
                    fieldNames.add('FirstName');
                }
                Task tk=new Task();
                tk.WhoId=ld.Id;
                tk.Subject='Verify the '+ld.FirstName;
                tk.OwnerId=u.Id;
                infoTask.add(tk);
            }    
            if(ld.LastName!=Null){
                 if(ld.LastName.containsIgnoreCase('TEST')){
                    fieldNames.add('LastName');
                }
                Task tk=new Task();
                tk.WhoId=ld.Id;
                tk.Subject='Verify the '+ld.LastName;
                tk.OwnerId=u.Id;
                infoTask.add(tk);
            }     
            if(ld.Title!=Null){
                 if(ld.Title.containsIgnoreCase('TEST')){
                    fieldNames.add('Title');
                }
                Task tk=new Task();
                tk.WhoId=ld.Id;
                tk.Subject='Verify the '+ld.Title;
                tk.OwnerId=u.Id;
                infoTask.add(tk);
            }     
            if(ld.Website!=Null){
                 if(ld.Website.containsIgnoreCase('TEST')){
                    fieldNames.add('Website');
                }
                Task tk=new Task();
                tk.WhoId=ld.Id;
                tk.Subject='Verify the '+ld.Website;
                tk.OwnerId=u.Id;
                infoTask.add(tk);
            }     
            if(ld.Email!=Null){
                 if(ld.Email.containsIgnoreCase('TEST')){
                    fieldNames.add('Email');
                }
                Task tk=new Task();
                tk.WhoId=ld.Id;
                tk.Subject='Verify the '+ld.Email;
                tk.OwnerId=u.Id;
                infoTask.add(tk);
            }     
            if(ld.Phone!=Null){
                 if(ld.Phone.containsIgnoreCase('TEST')){
                    fieldNames.add('Phone');
                }
                Task tk=new Task();
                tk.WhoId=ld.Id;
                tk.Subject='Verify the '+ld.Phone;
                tk.OwnerId=u.Id;
                infoTask.add(tk);
            }
            if(!ld.BypassTriggers__c==TRUE){
                if(fieldNames.size()>0){
                tt.Description='This Lead contains the TEST keyword in the following key fields: '+ fieldNames ;
            	tt.Subject='Warning';
				tt.WhoId=ld.Id;
            	warningTask.add(tt);
            }
            
            }
            
        }
        }
    insert infoTask;
    insert warningTask;
}