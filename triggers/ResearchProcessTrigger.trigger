trigger ResearchProcessTrigger on Research_Process__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResearchProcessHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchProcessHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchProcessHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResearchProcessHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchProcessHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchProcessHandler.handleAfterDelete(Trigger.old);
    }
}
