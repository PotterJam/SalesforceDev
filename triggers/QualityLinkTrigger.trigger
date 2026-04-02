trigger QualityLinkTrigger on Quality_Link__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QualityLinkHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QualityLinkHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityLinkHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QualityLinkHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QualityLinkHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityLinkHandler.handleAfterDelete(Trigger.old);
    }
}
