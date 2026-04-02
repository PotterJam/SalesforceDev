trigger UtilizationLinkTrigger on Utilization_Link__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) UtilizationLinkHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationLinkHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationLinkHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) UtilizationLinkHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationLinkHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationLinkHandler.handleAfterDelete(Trigger.old);
    }
}
