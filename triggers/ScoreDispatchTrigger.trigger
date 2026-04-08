trigger ScoreDispatchTrigger on Score_Dispatch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScoreDispatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreDispatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreDispatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScoreDispatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreDispatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreDispatchHandler.handleAfterDelete(Trigger.old);
    }
}
