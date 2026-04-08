trigger OrderAdapterTrigger on Order_Adapter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OrderAdapterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OrderAdapterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderAdapterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OrderAdapterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OrderAdapterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderAdapterHandler.handleAfterDelete(Trigger.old);
    }
}
