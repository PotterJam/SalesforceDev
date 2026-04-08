trigger TargetLinkTrigger on Target_Link__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TargetLinkHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TargetLinkHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetLinkHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TargetLinkHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TargetLinkHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetLinkHandler.handleAfterDelete(Trigger.old);
    }
}
