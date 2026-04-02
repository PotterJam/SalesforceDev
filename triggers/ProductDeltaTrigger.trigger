trigger ProductDeltaTrigger on Product_Delta__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProductDeltaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProductDeltaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductDeltaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProductDeltaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProductDeltaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductDeltaHandler.handleAfterDelete(Trigger.old);
    }
}
