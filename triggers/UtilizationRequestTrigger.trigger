trigger UtilizationRequestTrigger on Utilization_Request__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) UtilizationRequestHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationRequestHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationRequestHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) UtilizationRequestHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationRequestHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationRequestHandler.handleAfterDelete(Trigger.old);
    }
}
