trigger ProductTriggerTrigger on Product_Trigger__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProductTriggerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProductTriggerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductTriggerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProductTriggerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProductTriggerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductTriggerHandler.handleAfterDelete(Trigger.old);
    }
}
