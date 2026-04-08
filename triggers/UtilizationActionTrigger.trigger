trigger UtilizationActionTrigger on Utilization_Action__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) UtilizationActionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationActionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationActionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) UtilizationActionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationActionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationActionHandler.handleAfterDelete(Trigger.old);
    }
}
