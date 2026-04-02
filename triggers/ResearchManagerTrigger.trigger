trigger ResearchManagerTrigger on Research_Manager__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResearchManagerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchManagerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchManagerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResearchManagerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchManagerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchManagerHandler.handleAfterDelete(Trigger.old);
    }
}
