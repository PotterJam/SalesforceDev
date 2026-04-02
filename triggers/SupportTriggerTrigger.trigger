trigger SupportTriggerTrigger on Support_Trigger__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SupportTriggerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SupportTriggerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportTriggerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SupportTriggerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SupportTriggerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportTriggerHandler.handleAfterDelete(Trigger.old);
    }
}
