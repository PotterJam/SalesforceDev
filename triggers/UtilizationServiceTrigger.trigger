trigger UtilizationServiceTrigger on Utilization_Service__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) UtilizationServiceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationServiceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationServiceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) UtilizationServiceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationServiceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationServiceHandler.handleAfterDelete(Trigger.old);
    }
}
