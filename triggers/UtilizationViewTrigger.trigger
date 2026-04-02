trigger UtilizationViewTrigger on Utilization_View__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) UtilizationViewHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationViewHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationViewHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) UtilizationViewHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationViewHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationViewHandler.handleAfterDelete(Trigger.old);
    }
}
