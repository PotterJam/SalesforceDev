trigger ResourceAdapterTrigger on Resource_Adapter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResourceAdapterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceAdapterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceAdapterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResourceAdapterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceAdapterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceAdapterHandler.handleAfterDelete(Trigger.old);
    }
}
