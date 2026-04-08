trigger CommissionEntryTrigger on Commission_Entry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CommissionEntryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionEntryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionEntryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CommissionEntryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionEntryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionEntryHandler.handleAfterDelete(Trigger.old);
    }
}
