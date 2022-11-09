import { LightningElement, wire, track} from 'lwc';
import RetrievedAccounts from '@salesforce/apex/searchAccount.RetrievedAccounts';
import NAME_FIELD from '@salesforce/schema/Contact.Name';



export default class AccountsSearch extends LightningElement {
    @track Accs=''
    acco=[]
    accountId
    
   
    changeInput(event){
        this.Accs=event.target.value
    }
    handleSelect(event){
       this.accountId=event.detail.value
    }
    Creation(){
        const mike=this.template.querySelector('c-contact-with-account')
        mike.show()
    }

    UpdateSearch(){
        RetrievedAccounts({text:this.Accs}).then(result=>{
    
            this.acco=result
    })
}
}