trigger ScoreManagerTrigger on Score_Manager__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScoreManagerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreManagerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreManagerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScoreManagerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreManagerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreManagerHandler.handleAfterDelete(Trigger.old);
    }
}
