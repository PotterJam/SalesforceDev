trigger CommissionHandlerTrigger on Commission_Handler__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CommissionHandlerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionHandlerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionHandlerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CommissionHandlerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionHandlerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionHandlerHandler.handleAfterDelete(Trigger.old);
    }
}
