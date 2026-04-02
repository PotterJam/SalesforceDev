trigger ReviewAdapterTrigger on Review_Adapter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReviewAdapterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewAdapterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewAdapterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReviewAdapterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewAdapterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewAdapterHandler.handleAfterDelete(Trigger.old);
    }
}
