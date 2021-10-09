trigger CTLocationTrigger on Location__c (before insert, after insert, before update, after update) {

    switch on Trigger.operationType {
        when BEFORE_INSERT {
            CTLocationTriggerHandler.beforeInsert(Trigger.New);
        }

        when AFTER_UPDATE {
            CTLocationTriggerHandler.beforeUpdate(Trigger.New, Trigger.oldMap);
        }
    }
}