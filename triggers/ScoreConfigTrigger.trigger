trigger ScoreConfigTrigger on Score_Config__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScoreConfigHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreConfigHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreConfigHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScoreConfigHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreConfigHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreConfigHandler.handleAfterDelete(Trigger.old);
    }
}
