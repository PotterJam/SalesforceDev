trigger ResearchActionTrigger on Research_Action__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResearchActionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchActionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchActionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResearchActionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchActionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchActionHandler.handleAfterDelete(Trigger.old);
    }
}
