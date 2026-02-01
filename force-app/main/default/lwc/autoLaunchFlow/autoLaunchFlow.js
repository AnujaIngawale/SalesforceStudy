import { LightningElement, api, wire } from 'lwc';

import { getRecord } from 'lightning/uiRecordApi';

const FIELDS = [
    'Account.Name', 
    'Account.Industry', 
    'Account.Type', 
    'Account.BillingStreet', 
    'Account.BillingCity', 
    'Account.BillingState', 
    'Account.BillingPostalCode'
];

export default class AutoLaunchFlow extends LightningElement {

    @api recordId; //Account Record Id
    @api flowApiName = 'Create_New_Contact_SF'; // API Name of the Flow to launch
    isModalOpen;
    inputVariables = [];

    constructor(){
        super();
        console.log('Constructor Record Id: ' + this.recordId); // Record Id undefined
    }

    connectedCallback(){
        console.log('Record Id: ' + this.recordId);
        console.log('Flow API Name: ' + this.flowApiName);
    }

    @wire(getRecord, { recordId: '$recordId', fields: FIELDS })
    wiredAccount({ error, data }) {
        if (data) {
            console.log('getRecord data: ' + JSON.stringify(data));
            console.log('Account Industry: ' + data.fields.Industry.value); 
            if(data.fields.Industry.value == 'Apparel'){
                this.inputVariables = [
                    {
                        name: "recordId",
                        type: "String",
                        value: this.recordId
                    }
                ];
                setTimeout(() => {
                    this.isModalOpen = true; // Automatically open modal when the component loads
                }, 2000);
            }

        } else if (error) {
            console.log(
                'getRecord error: ' +
                JSON.stringify(error) +
                '\n' +
                'recordId: ' +
                this.recordId);
        }
    }

    

    // Handle Flow Status Change (e.g., completion)
    handleStatusChange(event) {
        if (event.detail.status === 'FINISHED') {
            this.closeModal();
        }
    }
    // Close the modal
    closeModal() {
        this.isModalOpen = false;
    }

}