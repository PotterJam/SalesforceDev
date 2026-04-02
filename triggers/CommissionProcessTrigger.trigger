trigger CommissionProcessTrigger on Commission_Process__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CommissionProcessHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionProcessHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionProcessHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CommissionProcessHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionProcessHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionProcessHandler.handleAfterDelete(Trigger.old);
    }
}
