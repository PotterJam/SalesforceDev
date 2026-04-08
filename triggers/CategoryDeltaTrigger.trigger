trigger CategoryDeltaTrigger on Category_Delta__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CategoryDeltaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryDeltaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryDeltaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CategoryDeltaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryDeltaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryDeltaHandler.handleAfterDelete(Trigger.old);
    }
}
