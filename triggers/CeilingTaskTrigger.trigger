trigger CeilingTaskTrigger on Ceiling_Task__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CeilingTaskHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingTaskHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingTaskHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CeilingTaskHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingTaskHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingTaskHandler.handleAfterDelete(Trigger.old);
    }
}
