trigger SalesAdapterTrigger on Sales_Adapter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SalesAdapterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SalesAdapterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesAdapterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SalesAdapterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SalesAdapterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesAdapterHandler.handleAfterDelete(Trigger.old);
    }
}
