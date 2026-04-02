trigger ScoreControllerTrigger on Score_Controller__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScoreControllerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreControllerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreControllerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScoreControllerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreControllerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreControllerHandler.handleAfterDelete(Trigger.old);
    }
}
