trigger TagLinkTrigger on Tag_Link__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TagLinkHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TagLinkHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagLinkHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TagLinkHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TagLinkHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagLinkHandler.handleAfterDelete(Trigger.old);
    }
}
