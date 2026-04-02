trigger ResearchDispatchTrigger on Research_Dispatch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResearchDispatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchDispatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchDispatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResearchDispatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchDispatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchDispatchHandler.handleAfterDelete(Trigger.old);
    }
}
