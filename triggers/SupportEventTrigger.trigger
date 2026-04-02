trigger SupportEventTrigger on Support_Event__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SupportEventHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SupportEventHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportEventHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SupportEventHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SupportEventHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportEventHandler.handleAfterDelete(Trigger.old);
    }
}
