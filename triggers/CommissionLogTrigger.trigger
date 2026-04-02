trigger CommissionLogTrigger on Commission_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CommissionLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CommissionLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionLogHandler.handleAfterDelete(Trigger.old);
    }
}
