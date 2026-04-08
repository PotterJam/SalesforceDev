trigger ResearchRecordTrigger on Research_Record__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResearchRecordHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchRecordHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchRecordHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResearchRecordHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchRecordHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchRecordHandler.handleAfterDelete(Trigger.old);
    }
}
