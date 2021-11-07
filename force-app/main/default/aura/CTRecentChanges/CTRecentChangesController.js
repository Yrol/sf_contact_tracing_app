({
    doInit : function(component, event, helper) {

        const scope = component.get('v.scope');

        /**
        * Mapping table columns to the actual field name names based on Person or Location selected
        */
        const columns = scope === "person" ? [
            {label: 'Name', fieldName: 'Name', type: 'text'},
            {label: 'Phone', fieldName: 'Mobile__c', type: 'phone'},
            {label: 'Token', fieldName: 'Token__c', type: 'text'},
            {label: 'Status', fieldName: 'Health_Status__c', type: 'text'},
            {label: 'Status Update Date', fieldName: 'Status_Update_Date__c', type: 'date'},
        ] : [
            {label: 'Name', fieldName: 'Name', type: 'text'},
            {label: 'Status', fieldName: 'Status__c', type: 'text'},
            {label: 'Pincode', fieldName: 'Pincode__c', type: 'text'},
            {label: 'Address', fieldName: 'Address__c', type: 'text'},
            {label: 'Red Score', fieldName: 'Red_Score__c', type: 'number'},
            {label: 'Status Update Date', fieldName: 'Status_Update_Date__c', type: 'date'},
        ];

        component.set("v.columns", columns);

        helper.fetchPersonStatus(component);
    }
})
