trigger CommissionManagerTrigger on Commission_Manager__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CommissionManagerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionManagerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionManagerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CommissionManagerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionManagerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionManagerHandler.handleAfterDelete(Trigger.old);
    }
}
