trigger StatusAdapterTrigger on Status_Adapter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) StatusAdapterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) StatusAdapterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusAdapterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) StatusAdapterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) StatusAdapterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusAdapterHandler.handleAfterDelete(Trigger.old);
    }
}
