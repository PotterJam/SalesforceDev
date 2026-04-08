trigger SupportLinkTrigger on Support_Link__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SupportLinkHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SupportLinkHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportLinkHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SupportLinkHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SupportLinkHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportLinkHandler.handleAfterDelete(Trigger.old);
    }
}
