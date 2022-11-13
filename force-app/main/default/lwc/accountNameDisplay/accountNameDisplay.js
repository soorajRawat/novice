import { LightningElement ,wire,api} from 'lwc';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';

export default class AccountNameDisplay extends LightningElement {
    @api recordId
    @wire(getRecord, { recordId: '$recordId' , fields: [NAME_FIELD, INDUSTRY_FIELD]})
    account;

    get name() {
        return getFieldValue(this.account.data, NAME_FIELD);
    }
    get industry(){
        return getFieldValue(this.account.data, INDUSTRY_FIELD);
    }
    

}