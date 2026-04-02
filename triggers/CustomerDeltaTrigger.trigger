trigger CustomerDeltaTrigger on Customer_Delta__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CustomerDeltaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerDeltaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerDeltaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CustomerDeltaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CustomerDeltaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CustomerDeltaHandler.handleAfterDelete(Trigger.old);
    }
}
