trigger IndexAdapterTrigger on Index_Adapter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IndexAdapterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IndexAdapterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexAdapterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IndexAdapterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IndexAdapterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexAdapterHandler.handleAfterDelete(Trigger.old);
    }
}
