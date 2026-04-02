trigger CeilingServiceTrigger on Ceiling_Service__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CeilingServiceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingServiceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingServiceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CeilingServiceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingServiceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingServiceHandler.handleAfterDelete(Trigger.old);
    }
}
