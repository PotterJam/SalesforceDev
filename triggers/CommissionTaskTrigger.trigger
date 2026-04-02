trigger CommissionTaskTrigger on Commission_Task__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CommissionTaskHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionTaskHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionTaskHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CommissionTaskHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionTaskHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionTaskHandler.handleAfterDelete(Trigger.old);
    }
}
