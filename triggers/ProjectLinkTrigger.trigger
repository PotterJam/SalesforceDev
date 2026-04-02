trigger ProjectLinkTrigger on Project_Link__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProjectLinkHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectLinkHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectLinkHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProjectLinkHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectLinkHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectLinkHandler.handleAfterDelete(Trigger.old);
    }
}
