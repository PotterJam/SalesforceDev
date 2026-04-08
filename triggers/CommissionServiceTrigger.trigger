trigger CommissionServiceTrigger on Commission_Service__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CommissionServiceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionServiceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionServiceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CommissionServiceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionServiceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionServiceHandler.handleAfterDelete(Trigger.old);
    }
}
