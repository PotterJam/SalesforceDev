trigger CeilingDetailTrigger on Ceiling_Detail__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CeilingDetailHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingDetailHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingDetailHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CeilingDetailHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingDetailHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingDetailHandler.handleAfterDelete(Trigger.old);
    }
}
