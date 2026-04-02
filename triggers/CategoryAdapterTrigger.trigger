trigger CategoryAdapterTrigger on Category_Adapter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CategoryAdapterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryAdapterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryAdapterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CategoryAdapterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryAdapterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryAdapterHandler.handleAfterDelete(Trigger.old);
    }
}
