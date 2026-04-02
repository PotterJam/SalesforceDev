trigger LabelLinkTrigger on Label_Link__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LabelLinkHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LabelLinkHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelLinkHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LabelLinkHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LabelLinkHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelLinkHandler.handleAfterDelete(Trigger.old);
    }
}
