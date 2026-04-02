trigger AssignmentLinkTrigger on Assignment_Link__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AssignmentLinkHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentLinkHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentLinkHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AssignmentLinkHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentLinkHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentLinkHandler.handleAfterDelete(Trigger.old);
    }
}
