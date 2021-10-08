trigger CTPersonTrigger on Person__c (before insert, after update, before update) {
    switch on Trigger.operationType {
        
        when BEFORE_INSERT {
            PersonTriggerHandler.beforeInsert(Trigger.New);
        }

        when BEFORE_UPDATE {
            PersonTriggerHandler.beforeUpdate(Trigger.New, Trigger.oldMap);
        }

        when AFTER_UPDATE {
            PersonTriggerHandler.afterUpdate(Trigger.New, Trigger.oldMap);
        }
    }
}