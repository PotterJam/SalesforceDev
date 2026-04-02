trigger IndexLinkTrigger on Index_Link__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IndexLinkHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IndexLinkHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexLinkHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IndexLinkHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IndexLinkHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexLinkHandler.handleAfterDelete(Trigger.old);
    }
}
