trigger ResearchDeltaTrigger on Research_Delta__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResearchDeltaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchDeltaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchDeltaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResearchDeltaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchDeltaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchDeltaHandler.handleAfterDelete(Trigger.old);
    }
}
