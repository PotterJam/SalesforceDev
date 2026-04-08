trigger CeilingJobTrigger on Ceiling_Job__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CeilingJobHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingJobHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingJobHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CeilingJobHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingJobHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingJobHandler.handleAfterDelete(Trigger.old);
    }
}
