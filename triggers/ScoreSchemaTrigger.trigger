trigger ScoreSchemaTrigger on Score_Schema__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScoreSchemaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreSchemaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreSchemaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScoreSchemaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreSchemaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreSchemaHandler.handleAfterDelete(Trigger.old);
    }
}
