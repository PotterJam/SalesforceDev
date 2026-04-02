trigger CommissionRequestTrigger on Commission_Request__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CommissionRequestHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionRequestHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionRequestHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CommissionRequestHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionRequestHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionRequestHandler.handleAfterDelete(Trigger.old);
    }
}
