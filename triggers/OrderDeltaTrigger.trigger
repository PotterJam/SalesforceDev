trigger OrderDeltaTrigger on Order_Delta__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OrderDeltaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OrderDeltaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderDeltaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OrderDeltaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OrderDeltaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderDeltaHandler.handleAfterDelete(Trigger.old);
    }
}
