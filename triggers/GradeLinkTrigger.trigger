trigger GradeLinkTrigger on Grade_Link__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) GradeLinkHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) GradeLinkHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeLinkHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) GradeLinkHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) GradeLinkHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeLinkHandler.handleAfterDelete(Trigger.old);
    }
}
