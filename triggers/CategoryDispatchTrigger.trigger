trigger CategoryDispatchTrigger on Category_Dispatch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CategoryDispatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryDispatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryDispatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CategoryDispatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryDispatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryDispatchHandler.handleAfterDelete(Trigger.old);
    }
}
