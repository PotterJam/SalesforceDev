trigger CommissionJobTrigger on Commission_Job__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CommissionJobHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionJobHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionJobHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CommissionJobHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionJobHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionJobHandler.handleAfterDelete(Trigger.old);
    }
}
