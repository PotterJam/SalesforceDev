trigger SupportTaskTrigger on Support_Task__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SupportTaskHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SupportTaskHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportTaskHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SupportTaskHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SupportTaskHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportTaskHandler.handleAfterDelete(Trigger.old);
    }
}
