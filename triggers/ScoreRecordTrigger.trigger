trigger ScoreRecordTrigger on Score_Record__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScoreRecordHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreRecordHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreRecordHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScoreRecordHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreRecordHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreRecordHandler.handleAfterDelete(Trigger.old);
    }
}
