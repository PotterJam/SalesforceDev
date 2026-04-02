trigger SalesProcessTrigger on Sales_Process__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SalesProcessHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SalesProcessHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesProcessHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SalesProcessHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SalesProcessHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesProcessHandler.handleAfterDelete(Trigger.old);
    }
}
