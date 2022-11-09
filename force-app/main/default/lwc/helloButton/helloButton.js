import { LightningElement } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';

export default class HelloButton extends LightningElement {
   showText=false;
   objectApiName=ACCOUNT_OBJECT;
   fields=[NAME_FIELD];
    dealer="Hello From ";
    HandleSuccess(event) {
        this.showText = true;
      }
}