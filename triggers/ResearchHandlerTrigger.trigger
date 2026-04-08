trigger ResearchHandlerTrigger on Research_Handler__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResearchHandlerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchHandlerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchHandlerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResearchHandlerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchHandlerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchHandlerHandler.handleAfterDelete(Trigger.old);
    }
}
