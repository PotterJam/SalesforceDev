trigger CommissionEventTrigger on Commission_Event__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CommissionEventHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionEventHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionEventHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CommissionEventHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionEventHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionEventHandler.handleAfterDelete(Trigger.old);
    }
}
