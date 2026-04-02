trigger ResearchEntryTrigger on Research_Entry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResearchEntryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchEntryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchEntryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResearchEntryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchEntryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchEntryHandler.handleAfterDelete(Trigger.old);
    }
}
